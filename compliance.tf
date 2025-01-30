data "pagerduty_escalation_policy" "compliance" {
  name = "Compliance Notifications Policy"
}

resource "pagerduty_service" "compliance" {
  name                    = "${var.awsorg_name} Compliance Notifications (AWS - ${var.customer_name})"
  acknowledgement_timeout = 43200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = "null"
  escalation_policy       = data.pagerduty_escalation_policy.compliance.id

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "compliance" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.aws.id
      type = "business_service"
    }
    supporting_service {
      id   = pagerduty_service.compliance.id
      type = pagerduty_service.compliance.type
    }
  }
}

resource "pagerduty_slack_connection" "compliance" {
  count = var.slack_compliance_team_channel != null ? 1 : 0

  channel_id        = var.slack_compliance_team_channel
  notification_type = "responder"
  source_id         = pagerduty_service.compliance.id
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

resource "pagerduty_service_integration" "compliance" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.compliance.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_jira_cloud_account_mapping_rule" "compliance" {
  name            = "jira-${pagerduty_service.compliance.id}"
  account_mapping = data.pagerduty_jira_cloud_account_mapping.compliance.id

  config {
    service = pagerduty_service.compliance.id
    jira {
      create_issue_on_incident_trigger = data.aws_ssm_parameter.jira_account_create_issue_on_incident_trigger.value
      sync_notes_user                  = data.pagerduty_user.account_user.id

      custom_fields {
        source_incident_field   = "incident_description"
        target_issue_field      = "description"
        target_issue_field_name = "Description"
        type                    = "attribute"
      }

      custom_fields {
        source_incident_field   = "incident_title"
        target_issue_field      = "summary"
        target_issue_field_name = "Summary"
        type                    = "attribute"
      }

      custom_fields {
        target_issue_field      = "customfield_10002"
        target_issue_field_name = "Organization"
        type                    = "const"
        value                   = var.jira_organization_id
      }

      dynamic "custom_fields" {
        for_each = try(jsondecode(nonsensitive(data.aws_ssm_parameter.jira_compliance_custom_jira_fields.value)), [])

        content {
          target_issue_field      = custom_fields.value.target_issue_field
          target_issue_field_name = custom_fields.value.target_issue_field_name
          type                    = "jira_value"
          value                   = custom_fields.value.value
        }
      }

      dynamic "custom_fields" {
        for_each = try(jsondecode(nonsensitive(data.aws_ssm_parameter.jira_compliance_custom_fixed_fields.value)), [])

        content {
          target_issue_field      = custom_fields.value.target_issue_field
          target_issue_field_name = custom_fields.value.target_issue_field_name
          type                    = "const"
          value                   = custom_fields.value.value
        }
      }

      issue_type {
        id   = data.aws_ssm_parameter.jira_compliance_issue_type_id.value
        name = data.aws_ssm_parameter.jira_compliance_issue_type_name.value
      }

      priorities {
        jira_id      = "10000"
        pagerduty_id = data.pagerduty_priority.p1.id
      }

      priorities {
        jira_id      = "2"
        pagerduty_id = data.pagerduty_priority.p2.id
      }

      priorities {
        jira_id      = "3"
        pagerduty_id = data.pagerduty_priority.p3.id
      }


      priorities {
        jira_id      = "4"
        pagerduty_id = data.pagerduty_priority.p4.id
      }

      priorities {
        jira_id      = "4"
        pagerduty_id = data.pagerduty_priority.p5.id
      }

      project {
        id   = data.aws_ssm_parameter.jira_compliance_project_id.value
        key  = data.aws_ssm_parameter.jira_compliance_project_key.value
        name = data.aws_ssm_parameter.jira_compliance_project_name.value
      }

      status_mapping {

        acknowledged {
          id   = "3"
          name = "In Progress"
        }
        resolved {
          id   = "5"
          name = "Resolved"
        }
        triggered {
          id   = "1"
          name = "Open"
        }
      }

    }
  }
}
