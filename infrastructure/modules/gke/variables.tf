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

variable "network" {
  description = "A name of a network."
  type        = string
}
  
variable "subnet" {
  description = "A name of a subnet."
  type        = string
}

variable "region" {
  description = "A region name."
  type        = string
}