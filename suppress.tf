# Partial VPN tunnel redundancy loss
resource "pagerduty_event_orchestration_service" "account" {
  service                                = pagerduty_service.account.id
  enable_event_orchestration_for_service = true
  set {
    id = "start"
    rule {
      label = "Suppress VPN Alerts"
      condition {
        expression = "raw_event.details.log_sample contains 'Connectivity on the second tunnel was not affected during this time'"
      }
      actions {
        suppress = true
      }
    }
  }
  catch_all {
    actions {}
  }
}
