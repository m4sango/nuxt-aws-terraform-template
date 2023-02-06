resource "aws_ecs_cluster" "default" {
  name = "nuxt-aws-terraform-template"
  #   capacity_providers = ["FARGATE"]
  #   default_capacity_provider_strategy {
  #     capacity_provider = "FARGATE"
  #   }
  #   setting {
  #     name  = "containerInsights"
  #     value = "enabled"
  #   }
}

resource "aws_ecs_cluster_capacity_providers" "default" {
  cluster_name = aws_ecs_cluster.default.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}


resource "aws_ecs_task_definition" "default" {
  family       = "nuxt-aws-terraform-template"
  network_mode = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "nuxt"
      image     = "${var.repository_url}:latest"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
        }
      ]
    }
  ])

  #   volume {
  #     name      = "service-storage"
  #     host_path = "/ecs/service-storage"
  #   }

  #   placement_constraints {
  #     type       = "memberOf"
  #     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  #   }
}
