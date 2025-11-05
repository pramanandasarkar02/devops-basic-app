terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Use our local image
resource "docker_image" "nginx" {
  name = "devops-hello:latest"
  build {
    path = "."
  }
}

# Run container from that image
resource "docker_container" "nginx" {
  name  = "devops-hello"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8080
  }
}
