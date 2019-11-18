variable "identifier" {
  description = "(required) Globally unique identifier to be used on the S3 buckets"
  default     = ""
}

variable "tags" {
  description = "(optional) Additional tags applied to all resources"
  default     = {}
}
