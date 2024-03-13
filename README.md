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
| [pagerduty_business_service.this](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/business_service) | resource |
| [pagerduty_team.service_delivery](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description (reference scoped services) | `string` | `"Description"` | no |
| <a name="input_name"></a> [name](#input\_name) | Customer Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pagerduty_business_service_id"></a> [pagerduty\_business\_service\_id](#output\_pagerduty\_business\_service\_id) | PagerDuty service |
| <a name="output_pagerduty_service_summary"></a> [pagerduty\_service\_summary](#output\_pagerduty\_service\_summary) | PagerDuty service summary |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
