# terraform-pagerduty-rhythmic-awsmanaged
[![tflint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/tflint.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/tflint.yaml)
[![trivy](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/trivy.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/trivy.yaml)
[![yamllint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/yamllint.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/yamllint.yaml)
[![misspell](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/misspell.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/misspell.yaml)
[![pre-commit-check](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-awsmanaged/actions/workflows/pre-commit.yaml)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

Configures PagerDuty for a customer with AWS Managed Services.

Suppression rules allow for PagerDuty Event Orchestration to automatically silence specified patterns, including optionally for a specified time range.

## Requirements
* PagerDuty provider
* PagerDuty API key

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | ~> 3.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 3.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pagerduty_business_service.aws](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/business_service) | resource |
| [pagerduty_event_orchestration_service.account_rules](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/event_orchestration_service) | resource |
| [pagerduty_event_orchestration_service.compliance_rules](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/event_orchestration_service) | resource |
| [pagerduty_event_orchestration_service.cost_rules](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/event_orchestration_service) | resource |
| [pagerduty_event_orchestration_service.security_rules](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/event_orchestration_service) | resource |
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
| [pagerduty_team.customer_success](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/team) | data source |
| [pagerduty_vendor.datadog](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_default_suppression_rules"></a> [account\_default\_suppression\_rules](#input\_account\_default\_suppression\_rules) | Default event suppression rules (override to an empty list to disable) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | <pre>[<br>  {<br>    "condition": "event.custom_details.body matches part 'This is to notify you that AWS Certificate Manager (ACM) has completed the renewal of an SSL/TLS certificate'",<br>    "label": "ACM certificate renewal successful"<br>  },<br>  {<br>    "condition": "event.custom_details.body matches part 'AWS_CLOUDSHELL_PERSISTENCE_EXPIRING'",<br>    "label": "CloudShell home directory inactivity"<br>  },<br>  {<br>    "condition": "event.custom_details.log_sample matches part 'Connectivity on the second tunnel was not affected during this time' or event.custom_details.body matches part 'Connectivity on the second tunnel was not affected during this time'",<br>    "label": "VPN Connectivity (no redundancy lost)"<br>  }<br>]</pre> | no |
| <a name="input_account_suppression_rules"></a> [account\_suppression\_rules](#input\_account\_suppression\_rules) | Event suppression rules (uses PagerDuty event orchestration, merged with `account_default_suppression_rules`) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_account_timebound_suppression_rules"></a> [account\_timebound\_suppression\_rules](#input\_account\_timebound\_suppression\_rules) | Timebound event suppression rules (uses PagerDuty event orchestration) | <pre>list(object({<br>    label      = string<br>    condition  = string<br>    start_time = string<br>    end_time   = string<br>  }))</pre> | `[]` | no |
| <a name="input_awsorg_name"></a> [awsorg\_name](#input\_awsorg\_name) | AWS Organization Name (can be nickname or formal name) | `string` | n/a | yes |
| <a name="input_compliance_default_suppression_rules"></a> [compliance\_default\_suppression\_rules](#input\_compliance\_default\_suppression\_rules) | Default event suppression rules (override to an empty list to disable) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_compliance_suppression_rules"></a> [compliance\_suppression\_rules](#input\_compliance\_suppression\_rules) | Event suppression rules (uses PagerDuty event orchestration, merged with `compliance_default_suppression_rules`) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_compliance_timebound_suppression_rules"></a> [compliance\_timebound\_suppression\_rules](#input\_compliance\_timebound\_suppression\_rules) | Timebound event suppression rules (uses PagerDuty event orchestration) | <pre>list(object({<br>    label      = string<br>    condition  = string<br>    start_time = string<br>    end_time   = string<br>  }))</pre> | `[]` | no |
| <a name="input_cost_default_suppression_rules"></a> [cost\_default\_suppression\_rules](#input\_cost\_default\_suppression\_rules) | Default event suppression rules (override to an empty list to disable) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_cost_suppression_rules"></a> [cost\_suppression\_rules](#input\_cost\_suppression\_rules) | Event suppression rules (uses PagerDuty event orchestration, merged with `cost_default_suppression_rules`) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_cost_timebound_suppression_rules"></a> [cost\_timebound\_suppression\_rules](#input\_cost\_timebound\_suppression\_rules) | Timebound event suppression rules (uses PagerDuty event orchestration) | <pre>list(object({<br>    label      = string<br>    condition  = string<br>    start_time = string # Format "2024-03-00 00:00:00 Etc/UTC"<br>    end_time   = string # Format "2024-03-00 00:00:00 Etc/UTC"<br>  }))</pre> | `[]` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Customer Name | `string` | n/a | yes |
| <a name="input_jira_create_issue_on_incident_trigger"></a> [jira\_create\_issue\_on\_incident\_trigger](#input\_jira\_create\_issue\_on\_incident\_trigger) | Whether to create a Jira issue when an incident is triggered | `bool` | `false` | no |
| <a name="input_jira_organization_id"></a> [jira\_organization\_id](#input\_jira\_organization\_id) | Organization ID for Jira integration | `string` | n/a | yes |
| <a name="input_jira_project_key"></a> [jira\_project\_key](#input\_jira\_project\_key) | The Jira project key | `string` | `"NOC"` | no |
| <a name="input_jira_project_name"></a> [jira\_project\_name](#input\_jira\_project\_name) | The Jira project name | `string` | `"NOC"` | no |
| <a name="input_security_default_suppression_rules"></a> [security\_default\_suppression\_rules](#input\_security\_default\_suppression\_rules) | Default event suppression rules (override to an empty list to disable) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_security_suppression_rules"></a> [security\_suppression\_rules](#input\_security\_suppression\_rules) | Event suppression rules (uses PagerDuty event orchestration, merged with `security_default_suppression_rules`) | <pre>list(object({<br>    label     = string<br>    condition = string<br>  }))</pre> | `[]` | no |
| <a name="input_security_timebound_suppression_rules"></a> [security\_timebound\_suppression\_rules](#input\_security\_timebound\_suppression\_rules) | Timebound event suppression rules (uses PagerDuty event orchestration) | <pre>list(object({<br>    label      = string<br>    condition  = string<br>    start_time = string # Format "2024-03-00 00:00:00 Etc/UTC"<br>    end_time   = string # Format "2024-03-00 00:00:00 Etc/UTC"<br>  }))</pre> | `[]` | no |
| <a name="input_slack_compliance_team_channel"></a> [slack\_compliance\_team\_channel](#input\_slack\_compliance\_team\_channel) | The Slack channel ID for the compliance team | `string` | n/a | yes |
| <a name="input_slack_customer_success_team_channel"></a> [slack\_customer\_success\_team\_channel](#input\_slack\_customer\_success\_team\_channel) | The Slack channel ID for the customer success team | `string` | n/a | yes |
| <a name="input_slack_security_team_channel"></a> [slack\_security\_team\_channel](#input\_slack\_security\_team\_channel) | The Slack channel ID for the security team | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | The Slack workspace ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_datadog_integration_key"></a> [account\_datadog\_integration\_key](#output\_account\_datadog\_integration\_key) | PagerDuty Datadog Integration for account notifications |
| <a name="output_account_datadog_mention"></a> [account\_datadog\_mention](#output\_account\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_account_service_id"></a> [account\_service\_id](#output\_account\_service\_id) | PagerDuty service ID for account notifications |
| <a name="output_account_service_name"></a> [account\_service\_name](#output\_account\_service\_name) | PagerDuty service name for account notifications |
| <a name="output_compliance_datadog_integration_key"></a> [compliance\_datadog\_integration\_key](#output\_compliance\_datadog\_integration\_key) | PagerDuty Datadog Integration for compliance notifications |
| <a name="output_compliance_datadog_mention"></a> [compliance\_datadog\_mention](#output\_compliance\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_compliance_service_id"></a> [compliance\_service\_id](#output\_compliance\_service\_id) | PagerDuty service ID for compliance notifications |
| <a name="output_compliance_service_name"></a> [compliance\_service\_name](#output\_compliance\_service\_name) | PagerDuty service name for compliance notifications |
| <a name="output_cost_datadog_integration_key"></a> [cost\_datadog\_integration\_key](#output\_cost\_datadog\_integration\_key) | PagerDuty Datadog Integration for cost notifications |
| <a name="output_cost_datadog_mention"></a> [cost\_datadog\_mention](#output\_cost\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_cost_service_id"></a> [cost\_service\_id](#output\_cost\_service\_id) | PagerDuty service ID for cost notifications |
| <a name="output_cost_service_name"></a> [cost\_service\_name](#output\_cost\_service\_name) | PagerDuty service name for cost notifications |
| <a name="output_datadog_integrations"></a> [datadog\_integrations](#output\_datadog\_integrations) | All PagerDuty Datadog integrations |
| <a name="output_pagerduty_services"></a> [pagerduty\_services](#output\_pagerduty\_services) | All PagerDuty services |
| <a name="output_security_datadog_integration_key"></a> [security\_datadog\_integration\_key](#output\_security\_datadog\_integration\_key) | PagerDuty Datadog Integration for security notifications |
| <a name="output_security_datadog_mention"></a> [security\_datadog\_mention](#output\_security\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_security_service_id"></a> [security\_service\_id](#output\_security\_service\_id) | PagerDuty service ID for security notifications |
| <a name="output_security_service_name"></a> [security\_service\_name](#output\_security\_service\_name) | PagerDuty service name for security notifications |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
