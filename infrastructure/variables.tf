variable "env" {
  type    = string
#   default = "dev"
}

variable "scan_on_push" {
  type    = bool
  default = true
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "image_name" {
  type    = string
  default = "nuxt-aws-terraform-template"
}

