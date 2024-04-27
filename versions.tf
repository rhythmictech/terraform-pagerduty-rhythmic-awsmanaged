terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }

    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 3.11"
    }
  }
}
