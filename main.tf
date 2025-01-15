resource "pagerduty_business_service" "aws" {
  name        = "${var.awsorg_name} - AWS Managed Services (${var.customer_name})"
  description = "AWS Managed Services - account health, compliance, cost and security monitoring"
  team        = data.pagerduty_team.customer_success.id
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

