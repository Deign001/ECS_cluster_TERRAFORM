# Configure the Docker & AWS Providers 
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.20.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    dockerhub = {
      source = "BarnabyShearer/dockerhub"
    }
  }
}
provider "docker" {}

provider "aws" {
  region = var.region
}
provider "dockerhub" {}
