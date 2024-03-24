# Provider
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
# default var
variable "namespace" {
  description = "Name of namespace for k8s"
  default     = "application"
}

variable "pod-cpu" {
  description = "Pod cpu limits on namespace"
  default     = "200m"
}

variable "pod-memory" {
  description = "Pod memory limits on namespace"
  default     = "1024Mi"
}

variable "pvc" {
    description = "Storage limits on namespace"
    default = "24M"
  
}

variable "container-cpu" {
    description = "Container cpu limits on namespace"
    default = "24M"
}

variable "container-mem" {
    description = "Container cpu limits on namespace"
    default = "24Mi"
}

# Create namespace
resource "kubernetes_namespace" "app" {
  metadata {
    name = var.namespace
    labels = {
      name = "app-namespace"
    }
  }
}

# Add namespace limits
resource "kubernetes_limit_range" "example" {
  metadata {
    name = "app-application"
    namespace = var.namespace
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = var.pod-cpu
        memory = var.pod-memory
      }
    }
    limit {
      type = "PersistentVolumeClaim"
      min = {
        storage = var.pvc
      }
    }
    limit {
      type = "Container"
      default = {
        cpu    = var.container-cpu
        memory = var.container-mem
      }
    }
  }
}
