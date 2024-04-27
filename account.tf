data "pagerduty_escalation_policy" "account" {
  name = "Account Notifications Policy"
}

locals {
  slack_customer_success_team_channel = var.enable_quarantine ? var.slack_customer_success_quarantine_channel : var.slack_customer_success_team_channel
}

resource "pagerduty_service" "account" {
  name                    = "${var.awsorg_name} Account Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 0
  escalation_policy       = data.pagerduty_escalation_policy.account.id

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "account" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.aws.id
      type = pagerduty_business_service.aws.type
    }
    supporting_service {
      id   = pagerduty_service.account.id
      type = pagerduty_service.account.type
    }
  }
}

resource "pagerduty_slack_connection" "account" {
  channel_id        = local.slack_customer_success_team_channel
  notification_type = "responder"
  source_id         = pagerduty_service.account.id
  source_type       = "service_reference"
  workspace_id      = var.slack_workspace_id

  config {
    events = [
      "incident.triggered",
      "incident.acknowledged",
      "incident.escalated",
      "incident.resolved",
      "incident.reassigned",
      "incident.unacknowledged",
      "incident.delegated",
      "incident.priority_updated",
      "incident.responder.added",
      "incident.responder.replied",
      "incident.status_update_published",
      "incident.reopened"
    ]
    priorities = ["*"]
  }
}

resource "pagerduty_service_integration" "account" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.account.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "account" {
  name              = "jira-${pagerduty_service.account.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.account.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}

resource "pagerduty_event_orchestration_service" "account" {
  count = var.enable_quarantine ? 1 : 0

  service                                = pagerduty_service.account.id
  enable_event_orchestration_for_service = true

  set {
    id = "start"

    rule {
      label = "Route quarantine events to Slack"
      actions {
        variable {
          name  = "details"
          path  = "event.custom_details"
          value = "(.*)"
          type  = "regex"
        }

        variable {
          name  = "summary"
          path  = "event.summary"
          value = "(.*)"
          type  = "regex"
        }

        automation_action {
          name      = "AWS Chatbot Webhook"
          url       = data.aws_ssm_parameter.chatbot_publisher_invoke_url.value
          auto_send = true

          parameter {
            key   = "channel"
            value = "success_quarantine"
          }

          parameter {
            key   = "message"
            value = "{{variables.summary}}"
          }

          parameter {
            key   = "details"
            value = "{{variables.details}}"
          }

          header {
            key   = "Content-Type"
            value = "application/json"
          }

          header {
            key   = "x-api-key"
            value = data.aws_ssm_parameter.chatbot_publisher_api_key.value
          }
        }

        route_to = "suppress"
      }
    }
  }
  set {
    id = "suppress"

    rule {
      label = "Suppress event"
      actions {
        suppress = true
      }
    }
  }

  catch_all {
    actions {}
  }
}
