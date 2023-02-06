module "ecr" {
  source="./modules/ecr"

  env=var.env
  scan_on_push=var.scan_on_push
}

resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 833397274469.dkr.ecr.ap-northeast-1.amazonaws.com"
  }

  provisioner "local-exec" {
    command = "docker build -t ${var.image_name} ../"
  }

  provisioner "local-exec" {
    command = "docker tag ${var.image_name}:latest ${module.ecr.repository_url}"
  }

  provisioner "local-exec" {
    command = "docker push ${module.ecr.repository_url}"
  }
}