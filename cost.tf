data "pagerduty_escalation_policy" "cost" {
  name = "Cost Notifications Policy"
}

resource "pagerduty_service" "cost" {
  name                    = "${var.awsorg_name} Cost Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = null
  escalation_policy       = data.pagerduty_escalation_policy.cost.id

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "cost" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.aws.id
      type = "business_service"
    }
    supporting_service {
      id   = pagerduty_service.cost.id
      type = pagerduty_service.cost.type
    }
  }
}

resource "pagerduty_slack_connection" "cost" {
  channel_id        = var.slack_customer_success_team_channel
  notification_type = "responder"
  source_id         = pagerduty_service.cost.id
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

resource "pagerduty_service_integration" "cost" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.cost.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "cost" {
  name              = "jira-${pagerduty_service.cost.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.cost.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
