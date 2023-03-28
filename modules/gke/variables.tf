variable "project_id" {
  description = "A GCP project ID."
  type        = string
}

variable "node_count" {
  description = "A number of kubernetes nodes."
  type        = number
  default     = 1
}

variable "node_size" {
  description = "A size of a kubernetes node."
  type        = string
  default     = "g1-small"
}
