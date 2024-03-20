data "pagerduty_escalation_policy" "cost" {
  name = "Cost Notifications Policy"
}

data "pagerduty_escalation_policy" "cost_quarantine" {
  name = "ZZ-Cost Quarantine Notifications Policy"
}

locals {
  cost_escalation_policy = var.enable_quarantine ? data.pagerduty_escalation_policy.cost_quarantine.id : data.pagerduty_escalation_policy.cost.id
}

resource "pagerduty_service" "cost" {
  name                    = "${var.awsorg_name} Cost Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 0
  escalation_policy       = local.cost_escalation_policy

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "cost" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.aws.id
      type = pagerduty_business_service.aws.type
    }
    supporting_service {
      id   = pagerduty_service.cost.id
      type = pagerduty_service.cost.type
    }
  }
}

resource "pagerduty_slack_connection" "cost" {
  channel_id        = local.slack_service_delivery_team_channel
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
