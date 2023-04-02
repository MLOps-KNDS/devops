variable "name" {
  description = "Name of kubernetes cluster."
  type        = string
}

variable "node_count" {
  description = "A number of kubernetes nodes."
  type        = number
}

variable "node_size" {
  description = "A size of a kubernetes node."
  type        = string
}
