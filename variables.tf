variable "awsorg_name" {
  description = "AWS Organization Name (can be nickname or formal name)"
  type        = string
}

variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "core_outputs" {
  description = "Core Outputs"
  type        = map(any)
}
