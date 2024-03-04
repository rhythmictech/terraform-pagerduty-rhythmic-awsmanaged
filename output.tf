output "account_service_id" {
  description = "PagerDuty service for cost notifications"
  value       = pagerduty_service.cost.id
}

output "account_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for account notifications"
  value       = pagerduty_service_integration.account.integration_key
}

output "compliance_service_id" {
  description = "PagerDuty service for compliance notifications"
  value       = pagerduty_service.compliance.id
}

output "compliance_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for compliance notifications"
  value       = pagerduty_service_integration.compliance.integration_key
}

output "cost_service_id" {
  description = "PagerDuty service for cost notifications"
  value       = pagerduty_service.cost.id
}

output "cost_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for cost notifications"
  value       = pagerduty_service_integration.cost.integration_key
}

output "security_service_id" {
  description = "PagerDuty service for security notifications"
  value       = pagerduty_service.security.id
}

output "security_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for security notifications"
  value       = pagerduty_service_integration.security.integration_key
}

output "datadog_integrations" {
  description = "All PagerDuty Datadog integrations"
  # TODO probably a less hardcody syntax for this that globs what we need but whatever
  value = {
    "account" = {
      "name" = pagerduty_service.account.name
      "key"  = pagerduty_service_integration.account.integration_key
    }
    "compliance" = {
      "name" = pagerduty_service.compliance.name
      "key"  = pagerduty_service_integration.compliance.integration_key
    }
    "cost" = {
      "name" = pagerduty_service.cost.name
      "key"  = pagerduty_service_integration.cost.integration_key
    }
    "security" = {
      "name" = pagerduty_service.security.name
      "key"  = pagerduty_service_integration.security.integration_key
    }
  }
}

output "pagerduty_services" {
  description = "All PagerDuty services"
  value = [
    pagerduty_service.account.id,
    pagerduty_service.compliance.id,
    pagerduty_service.cost.id,
    pagerduty_service.security.id
  ]
}
