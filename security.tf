data "pagerduty_escalation_policy" "security" {
  name = "Security Notifications Policy"
}

resource "pagerduty_service" "security" {
  name                    = "${var.awsorg_name} Security Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = "null"
  escalation_policy       = data.pagerduty_escalation_policy.security.id

  incident_urgency_rule {
    type = "use_support_hours"

    during_support_hours {
      type    = "constant"
      urgency = "high"
    }

    outside_support_hours {
      type    = "constant"
      urgency = "low"
    }
  }

  support_hours {
    type         = "fixed_time_per_day"
    time_zone    = "America/New_York"
    start_time   = "07:00:00"
    end_time     = "20:00:00"
    days_of_week = [1, 2, 3, 4, 5]
  }

  scheduled_actions {
    type       = "urgency_change"
    to_urgency = "high"

    at {
      type = "named_time"
      name = "support_hours_start"
    }
  }
}

resource "pagerduty_service_dependency" "security" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.aws.id
      type = "business_service"
    }
    supporting_service {
      id   = pagerduty_service.security.id
      type = pagerduty_service.security.type
    }
  }
}

resource "pagerduty_slack_connection" "security" {
  channel_id        = var.slack_security_team_channel
  notification_type = "responder"
  source_id         = pagerduty_service.security.id
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

resource "pagerduty_service_integration" "security" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.security.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "security" {
  name              = "jira-${pagerduty_service.security.id}"
  config            = templatefile("${path.module}/jira.json.tpl", { organization_id = var.jira_organization_id })
  extension_objects = [pagerduty_service.security.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
