provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.1.0"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks.eks_cluster.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.eks_cluster.id]
      command     = "aws"
    }
  }
}