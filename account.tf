data "pagerduty_escalation_policy" "account" {
  name = "Account Notifications Policy"
}

data "pagerduty_escalation_policy" "account_quarantine" {
  name = "ZZ-Service Delivery Quarantine Notifications Policy"
}

locals {
  account_escalation_policy           = var.enable_quarantine ? data.pagerduty_escalation_policy.account_quarantine.id : data.pagerduty_escalation_policy.account.id
  slack_service_delivery_team_channel = var.enable_quarantine ? var.slack_service_delivery_quarantine_channel : var.slack_service_delivery_team_channel
}

resource "pagerduty_service" "account" {
  name                    = "${var.awsorg_name} Account Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 0
  escalation_policy       = local.account_escalation_policy

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
  channel_id        = local.slack_service_delivery_team_channel
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
