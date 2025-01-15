########################################
# Jira parameters - Account
########################################

data "aws_ssm_parameter" "jira_account_mapping_name" {
  name = "/config/jira/${var.account_jira_integration_profile}/account_mapping_name"
}

data "aws_ssm_parameter" "jira_account_project_id" {
  name = "/config/jira/${var.account_jira_integration_profile}/project_id"
}

data "aws_ssm_parameter" "jira_account_project_key" {
  name = "/config/jira/${var.account_jira_integration_profile}/project_key"
}

data "aws_ssm_parameter" "jira_account_project_name" {
  name = "/config/jira/${var.account_jira_integration_profile}/project_name"
}

data "aws_ssm_parameter" "jira_account_issue_type_id" {
  name = "/config/jira/${var.account_jira_integration_profile}/issue_type_id"
}

data "aws_ssm_parameter" "jira_account_issue_type_name" {
  name = "/config/jira/${var.account_jira_integration_profile}/issue_type_name"
}

data "aws_ssm_parameter" "jira_account_sync_notes_user" {
  name = "/config/jira/${var.account_jira_integration_profile}/sync_notes_user"
}

data "aws_ssm_parameter" "jira_account_create_issue_on_incident_trigger" {
  name = "/config/jira/${var.account_jira_integration_profile}/create_issue_on_incident_trigger"
}

data "aws_ssm_parameter" "jira_account_custom_jira_fields" {
  name = "/config/jira/${var.account_jira_integration_profile}/custom_jira_fields"
}

data "aws_ssm_parameter" "jira_account_custom_fixed_fields" {
  name = "/config/jira/${var.account_jira_integration_profile}/custom_fixed_fields"
}

########################################
# Jira parameters - Compliance
########################################

data "aws_ssm_parameter" "jira_compliance_mapping_name" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/account_mapping_name"
}

data "aws_ssm_parameter" "jira_compliance_project_id" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/project_id"
}

data "aws_ssm_parameter" "jira_compliance_project_key" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/project_key"
}

data "aws_ssm_parameter" "jira_compliance_project_name" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/project_name"
}

data "aws_ssm_parameter" "jira_compliance_issue_type_id" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/issue_type_id"
}

data "aws_ssm_parameter" "jira_compliance_issue_type_name" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/issue_type_name"
}

data "aws_ssm_parameter" "jira_compliance_sync_notes_user" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/sync_notes_user"
}

data "aws_ssm_parameter" "jira_compliance_create_issue_on_incident_trigger" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/create_issue_on_incident_trigger"
}

data "aws_ssm_parameter" "jira_compliance_custom_jira_fields" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/custom_jira_fields"
}

data "aws_ssm_parameter" "jira_compliance_custom_fixed_fields" {
  name = "/config/jira/${var.compliance_jira_integration_profile}/custom_fixed_fields"
}

########################################
# Jira parameters - Cost
########################################    

data "aws_ssm_parameter" "jira_cost_mapping_name" {
  name = "/config/jira/${var.cost_jira_integration_profile}/account_mapping_name"
}

data "aws_ssm_parameter" "jira_cost_project_id" {
  name = "/config/jira/${var.cost_jira_integration_profile}/project_id"
}

data "aws_ssm_parameter" "jira_cost_project_key" {
  name = "/config/jira/${var.cost_jira_integration_profile}/project_key"
}

data "aws_ssm_parameter" "jira_cost_project_name" {
  name = "/config/jira/${var.cost_jira_integration_profile}/project_name"
}

data "aws_ssm_parameter" "jira_cost_issue_type_id" {
  name = "/config/jira/${var.cost_jira_integration_profile}/issue_type_id"
}

data "aws_ssm_parameter" "jira_cost_issue_type_name" {
  name = "/config/jira/${var.cost_jira_integration_profile}/issue_type_name"
}

data "aws_ssm_parameter" "jira_cost_sync_notes_user" {
  name = "/config/jira/${var.cost_jira_integration_profile}/sync_notes_user"
}

data "aws_ssm_parameter" "jira_cost_create_issue_on_incident_trigger" {
  name = "/config/jira/${var.cost_jira_integration_profile}/create_issue_on_incident_trigger"
}

data "aws_ssm_parameter" "jira_cost_custom_jira_fields" {
  name = "/config/jira/${var.cost_jira_integration_profile}/custom_jira_fields"
}

data "aws_ssm_parameter" "jira_cost_custom_fixed_fields" {
  name = "/config/jira/${var.cost_jira_integration_profile}/custom_fixed_fields"
}

########################################
# Jira parameters - Security
########################################

data "aws_ssm_parameter" "jira_security_mapping_name" {
  name = "/config/jira/${var.security_jira_integration_profile}/account_mapping_name"
}

data "aws_ssm_parameter" "jira_security_project_id" {
  name = "/config/jira/${var.security_jira_integration_profile}/project_id"
}

data "aws_ssm_parameter" "jira_security_project_key" {
  name = "/config/jira/${var.security_jira_integration_profile}/project_key"
}

data "aws_ssm_parameter" "jira_security_project_name" {
  name = "/config/jira/${var.security_jira_integration_profile}/project_name"
}

data "aws_ssm_parameter" "jira_security_issue_type_id" {
  name = "/config/jira/${var.security_jira_integration_profile}/issue_type_id"
}

data "aws_ssm_parameter" "jira_security_issue_type_name" {
  name = "/config/jira/${var.security_jira_integration_profile}/issue_type_name"
}

data "aws_ssm_parameter" "jira_security_sync_notes_user" {
  name = "/config/jira/${var.security_jira_integration_profile}/sync_notes_user"
}

data "aws_ssm_parameter" "jira_security_create_issue_on_incident_trigger" {
  name = "/config/jira/${var.security_jira_integration_profile}/create_issue_on_incident_trigger"
}

data "aws_ssm_parameter" "jira_security_custom_jira_fields" {
  name = "/config/jira/${var.security_jira_integration_profile}/custom_jira_fields"
}

data "aws_ssm_parameter" "jira_security_custom_fixed_fields" {
  name = "/config/jira/${var.security_jira_integration_profile}/custom_fixed_fields"
}

########################################
# PagerDuty parameters
########################################

data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_extension_schema" "jira" {
  name = "Jira Cloud"
}

data "pagerduty_business_service" "customer" {
  name = var.customer_name
}

data "pagerduty_team" "customer_success" {
  name = "Customer Success Team"
}

data "pagerduty_jira_cloud_account_mapping" "account" {
  subdomain = data.aws_ssm_parameter.jira_account_mapping_name.value
}

data "pagerduty_jira_cloud_account_mapping" "compliance" {
  subdomain = data.aws_ssm_parameter.jira_compliance_mapping_name.value
}

data "pagerduty_jira_cloud_account_mapping" "cost" {
  subdomain = data.aws_ssm_parameter.jira_cost_mapping_name.value
}

data "pagerduty_jira_cloud_account_mapping" "security" {
  subdomain = data.aws_ssm_parameter.jira_security_mapping_name.value
}

data "pagerduty_priority" "p1" {
  name = "P1"
}

data "pagerduty_priority" "p2" {
  name = "P2"
}

data "pagerduty_priority" "p3" {
  name = "P3"
}

data "pagerduty_priority" "p4" {
  name = "P4"
}

data "pagerduty_priority" "p5" {
  name = "P5"
}

data "pagerduty_user" "account_user" {
  email = data.aws_ssm_parameter.jira_account_sync_notes_user.value
}

data "pagerduty_user" "compliance_user" {
  email = data.aws_ssm_parameter.jira_compliance_sync_notes_user.value
}

data "pagerduty_user" "cost_user" {
  email = data.aws_ssm_parameter.jira_cost_sync_notes_user.value
}

data "pagerduty_user" "security_user" {
  email = data.aws_ssm_parameter.jira_security_sync_notes_user.value
}