locals {
  account_suppression_rules    = concat(var.account_suppression_rules, var.account_default_suppression_rules)
  compliance_suppression_rules = concat(var.compliance_suppression_rules, var.compliance_default_suppression_rules)
  cost_suppression_rules       = concat(var.cost_suppression_rules, var.cost_default_suppression_rules)
  security_suppression_rules   = concat(var.security_suppression_rules, var.security_default_suppression_rules)
}

resource "pagerduty_event_orchestration_service" "account_rules" {
  service                                = pagerduty_service.account.id
  enable_event_orchestration_for_service = true
  set {
    id = "suppression-rules"
    dynamic "rule" {
      for_each = local.account_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = rule.value.condition
        }
        actions {
          suppress = true
        }
      }
    }
  }

  set {
    id = "suppression-timebound-rules"
    dynamic "rule" {
      for_each = var.account_timebound_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = "(${rule.value.condition}) and (now > ${rule.value.start_time} and now < ${rule.value.end_time})"
        }
        actions {
          suppress = true
        }
      }
    }
  }

  catch_all {
    actions {}
  }
}

resource "pagerduty_event_orchestration_service" "compliance_rules" {
  service                                = pagerduty_service.compliance.id
  enable_event_orchestration_for_service = true
  set {
    id = "suppression-rules"
    dynamic "rule" {
      for_each = local.compliance_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = rule.value.condition
        }
        actions {
          suppress = true
        }
      }
    }
  }

  set {
    id = "suppression-timebound-rules"
    dynamic "rule" {
      for_each = var.compliance_timebound_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = "(${rule.value.condition}) and (now > ${rule.value.start_time} and now < ${rule.value.end_time})"
        }
        actions {
          suppress = true
        }
      }
    }
  }

  catch_all {
    actions {}
  }
}

resource "pagerduty_event_orchestration_service" "cost_rules" {
  service                                = pagerduty_service.cost.id
  enable_event_orchestration_for_service = true
  set {
    id = "suppression-rules"
    dynamic "rule" {
      for_each = local.cost_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = rule.value.condition
        }
        actions {
          suppress = true
        }
      }
    }
  }

  set {
    id = "suppression-timebound-rules"
    dynamic "rule" {
      for_each = var.cost_timebound_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = "(${rule.value.condition}) and (now > ${rule.value.start_time} and now < ${rule.value.end_time})"
        }
        actions {
          suppress = true
        }
      }
    }
  }

  catch_all {
    actions {}
  }
}

resource "pagerduty_event_orchestration_service" "security_rules" {
  service                                = pagerduty_service.security.id
  enable_event_orchestration_for_service = true
  set {
    id = "suppression-rules"
    dynamic "rule" {
      for_each = local.security_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = rule.value.condition
        }
        actions {
          suppress = true
        }
      }
    }
  }

  set {
    id = "suppression-timebound-rules"
    dynamic "rule" {
      for_each = var.security_timebound_suppression_rules
      content {
        label = rule.value.label
        condition {
          expression = "(${rule.value.condition}) and (now > ${rule.value.start_time} and now < ${rule.value.end_time})"
        }
        actions {
          suppress = true
        }
      }
    }
  }

  catch_all {
    actions {}
  }
}
