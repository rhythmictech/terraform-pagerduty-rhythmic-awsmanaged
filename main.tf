data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_extension_schema" "jira" {
  name = "Jira Cloud"
}

data "pagerduty_business_service" "customer" {
  name = var.customer_name
}

data "pagerduty_team" "service_delivery" {
  name = "Service Delivery Team"
}

resource "pagerduty_business_service" "aws" {
  name        = "${var.awsorg_name} - AWS Managed Services (${var.customer_name})"
  description = "AWS Managed Services - account health, compliance, cost and security monitoring"
  team        = data.pagerduty_team.service_delivery.id
}

resource "pagerduty_service_dependency" "aws" {
  dependency {
    dependent_service {
      id   = data.pagerduty_business_service.customer.id
      type = data.pagerduty_business_service.customer.type
    }
    supporting_service {
      id   = pagerduty_business_service.aws.id
      type = pagerduty_business_service.aws.type
    }
  }
}
