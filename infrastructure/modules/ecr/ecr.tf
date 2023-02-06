resource "aws_ecr_repository" "default" {
  name                 = "${var.env}nuxt-aws-terraform-template"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}