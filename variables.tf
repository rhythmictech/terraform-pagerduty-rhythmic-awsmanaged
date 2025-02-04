########################################
# General Variables
########################################
variable "awsorg_name" {
  description = "AWS Organization Name (can be nickname or formal name)"
  type        = string
}

variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "slack_compliance_team_channel" {
  default     = null
  description = "The Slack channel ID for the compliance team"
  type        = string
}

variable "slack_security_team_channel" {
  default     = null
  description = "The Slack channel ID for the security team"
  type        = string
}

variable "slack_customer_success_team_channel" {
  default     = null
  description = "The Slack channel ID for the customer success team"
  type        = string
}

variable "slack_workspace_id" {
  default     = null
  description = "The Slack workspace ID"
  type        = string
}

########################################
# Jira Integration
########################################
variable "account_jira_integration_profile" {
  default     = "NOC"
  description = "The Jira integration profile"
  type        = string
}

variable "cost_jira_integration_profile" {
  default     = "NOC"
  description = "The Jira integration profile"
  type        = string
}

variable "compliance_jira_integration_profile" {
  default     = "NOC"
  description = "The Jira integration profile"
  type        = string
}

variable "security_jira_integration_profile" {
  default     = "NOC"
  description = "The Jira integration profile"
  type        = string
}

variable "jira_organization_id" {
  type        = string
  description = "Organization ID for Jira integration"
}

########################################
# Suppression Rules
########################################
variable "account_suppression_rules" {
  default     = []
  description = "Event suppression rules (uses PagerDuty event orchestration, merged with `account_default_suppression_rules`)"
  type = list(object({
    label     = string
    condition = string
  }))
}

variable "account_default_suppression_rules" {
  default = [
    {
      label     = "ACM certificate renewal successful"
      condition = "event.custom_details.body matches part 'This is to notify you that AWS Certificate Manager (ACM) has completed the renewal of an SSL/TLS certificate'"
    },
    {
      label     = "CloudShell home directory inactivity"
      condition = "event.custom_details.body matches part 'AWS_CLOUDSHELL_PERSISTENCE_EXPIRING'"
    },
    {
      label     = "VPN Connectivity (no redundancy lost)"
      condition = "event.custom_details.log_sample matches part 'Connectivity on the second tunnel was not affected during this time' or event.custom_details.body matches part 'Connectivity on the second tunnel was not affected during this time'"
    }
  ]
  description = "Default event suppression rules (override to an empty list to disable)"
  type = list(object({
    label     = string
    condition = string
  }))
}

variable "account_timebound_suppression_rules" {
  default     = []
  description = "Timebound event suppression rules (uses PagerDuty event orchestration)"
  type = list(object({
    label      = string
    condition  = string
    start_time = string
    end_time   = string
  }))
}

variable "compliance_suppression_rules" {
  default     = []
  description = "Event suppression rules (uses PagerDuty event orchestration, merged with `compliance_default_suppression_rules`)"
  type = list(object({
    label     = string
    condition = string
  }))
}

# TODO reserving for future use
variable "compliance_default_suppression_rules" {
  default     = []
  description = "Default event suppression rules (override to an empty list to disable)"
  type = list(object({
    label     = string
    condition = string
  }))
}

variable "compliance_timebound_suppression_rules" {
  default     = []
  description = "Timebound event suppression rules (uses PagerDuty event orchestration)"
  type = list(object({
    label      = string
    condition  = string
    start_time = string
    end_time   = string
  }))
}

variable "cost_suppression_rules" {
  default     = []
  description = "Event suppression rules (uses PagerDuty event orchestration, merged with `cost_default_suppression_rules`)"
  type = list(object({
    label     = string
    condition = string
  }))
}

# TODO reserving for future use
variable "cost_default_suppression_rules" {
  default     = []
  description = "Default event suppression rules (override to an empty list to disable)"
  type = list(object({
    label     = string
    condition = string
  }))
}

variable "cost_timebound_suppression_rules" {
  default     = []
  description = "Timebound event suppression rules (uses PagerDuty event orchestration)"
  type = list(object({
    label      = string
    condition  = string
    start_time = string # Format "2024-03-00 00:00:00 Etc/UTC"
    end_time   = string # Format "2024-03-00 00:00:00 Etc/UTC"
  }))
}

variable "security_suppression_rules" {
  default     = []
  description = "Event suppression rules (uses PagerDuty event orchestration, merged with `security_default_suppression_rules`)"
  type = list(object({
    label     = string
    condition = string
  }))
}

# TODO reserving for future use
variable "security_default_suppression_rules" {
  default     = []
  description = "Default event suppression rules (override to an empty list to disable)"
  type = list(object({
    label     = string
    condition = string
  }))
}

variable "security_timebound_suppression_rules" {
  default     = []
  description = "Timebound event suppression rules (uses PagerDuty event orchestration)"
  type = list(object({
    label      = string
    condition  = string
    start_time = string # Format "2024-03-00 00:00:00 Etc/UTC"
    end_time   = string # Format "2024-03-00 00:00:00 Etc/UTC"
  }))
}
