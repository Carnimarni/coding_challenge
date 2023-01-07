# Resource
variable "prefix" {
  description = "Prefix of the application resources."
  type        = string
}

variable "intervall" {
  description = "The execution intervall defines how often the function shall be executed. Default: 120 minutes"
  type        = number
  default     = 120
}