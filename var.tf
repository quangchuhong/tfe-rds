variable "db_password" {
  description = "RDS root user password"
  type        = string
  default = ""
}


variable "instance_class" {
  description = "RDS instance"
  type        = string
  default = ""
}

variable "engine_version" {
  description = "RDS engine instance"
  type        = string
  default = ""
}

