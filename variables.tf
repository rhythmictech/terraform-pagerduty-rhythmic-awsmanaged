variable "awsorg_name" {
  description = "AWS Organization Name (can be nickname or formal name)"
  type        = string
}

variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "slack_compliance_team_channel" {
  description = "The Slack channel ID for the compliance team"
  type        = string
}

variable "slack_compliance_quarantine_channel" {
  description = "The Slack channel ID for the compliance team quarantined alerts"
  type        = string
}

variable "slack_security_team_channel" {
  description = "The Slack channel ID for the security team"
  type        = string
}

variable "slack_security_quarantine_channel" {
  description = "The Slack channel ID for the security team quarantined alerts"
  type        = string
}

variable "slack_service_delivery_team_channel" {
  description = "The Slack channel ID for the service delivery team"
  type        = string
}

variable "slack_service_delivery_quarantine_channel" {
  description = "The Slack channel ID for the service delivery team quarantined alerts"
  type        = string
}

variable "slack_workspace_id" {
  description = "The Slack workspace ID"
  type        = string
}

variable "enable_quarantine" {
  default     = false
  description = "Override to quarantine alerts"
  type        = bool
}
