terraform {

  required_providers {
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 3.17" # 3.17 is the first version that supports native Jira Cloud integration
    }
  }
}
