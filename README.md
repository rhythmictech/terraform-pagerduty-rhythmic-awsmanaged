# terraform-pagerduty-rhythmic-awsmanaged
[![tflint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-customer/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-customer/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-customer/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-customer/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-customer/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

Configures PagerDuty for a customer

## Requirements
* PagerDuty provider
* PagerDuty API key

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | ~> 3.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pagerduty_business_service.aws](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/business_service) | resource |
| [pagerduty_extension.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_service.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service_dependency.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.aws](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_integration.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_slack_connection.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_business_service.customer](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/business_service) | data source |
| [pagerduty_escalation_policy.account](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_escalation_policy.compliance](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_escalation_policy.cost](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_escalation_policy.security](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_extension_schema.jira](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/extension_schema) | data source |
| [pagerduty_team.service_delivery](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/team) | data source |
| [pagerduty_vendor.datadog](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_awsorg_name"></a> [awsorg\_name](#input\_awsorg\_name) | AWS Organization Name (can be nickname or formal name) | `string` | n/a | yes |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Customer Name | `string` | n/a | yes |
| <a name="input_slack_compliance_team_channel"></a> [slack\_compliance\_team\_channel](#input\_slack\_compliance\_team\_channel) | The Slack channel ID for the compliance team | `string` | n/a | yes |
| <a name="input_slack_security_team_channel"></a> [slack\_security\_team\_channel](#input\_slack\_security\_team\_channel) | The Slack channel ID for the security team | `string` | n/a | yes |
| <a name="input_slack_service_delivery_team_channel"></a> [slack\_service\_delivery\_team\_channel](#input\_slack\_service\_delivery\_team\_channel) | The Slack channel ID for the service delivery team | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | The Slack workspace ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_datadog_integration_key"></a> [account\_datadog\_integration\_key](#output\_account\_datadog\_integration\_key) | PagerDuty Datadog Integration for account notifications |
| <a name="output_account_service_id"></a> [account\_service\_id](#output\_account\_service\_id) | PagerDuty service for cost notifications |
| <a name="output_compliance_datadog_integration_key"></a> [compliance\_datadog\_integration\_key](#output\_compliance\_datadog\_integration\_key) | PagerDuty Datadog Integration for compliance notifications |
| <a name="output_compliance_service_id"></a> [compliance\_service\_id](#output\_compliance\_service\_id) | PagerDuty service for compliance notifications |
| <a name="output_cost_datadog_integration_key"></a> [cost\_datadog\_integration\_key](#output\_cost\_datadog\_integration\_key) | PagerDuty Datadog Integration for cost notifications |
| <a name="output_cost_service_id"></a> [cost\_service\_id](#output\_cost\_service\_id) | PagerDuty service for cost notifications |
| <a name="output_datadog_integrations"></a> [datadog\_integrations](#output\_datadog\_integrations) | All PagerDuty Datadog integrations |
| <a name="output_pagerduty_services"></a> [pagerduty\_services](#output\_pagerduty\_services) | All PagerDuty services |
| <a name="output_security_datadog_integration_key"></a> [security\_datadog\_integration\_key](#output\_security\_datadog\_integration\_key) | PagerDuty Datadog Integration for security notifications |
| <a name="output_security_service_id"></a> [security\_service\_id](#output\_security\_service\_id) | PagerDuty service for security notifications |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
