provider "kubernetes" {
  config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "Webserver-Deployment" {
  metadata {
    name = "webserver-deployment"
    labels = {
      App = "Webserver"
    }
  }
  spec {
    replicas = 1
    strategy {
      type = "RollingUpdate"
    }
    selector {
      match_labels = {
        type = "webserver"
        env = "Production"
      }
    }
    template {
      metadata {
        labels = {
          type = "webserver"
          env = "Production"
        }
      }
      spec {
        container {
          name = "webserver"
          image = "wordpress"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "WordPress" {
  metadata {
    name = "wordpress-service"
  }
  spec {
    type = "NodePort"
    selector = {
      type = "webserver"
    }
    port {
      port = 80
      target_port = 80
      protocol = "TCP"
      name = "http"
    }
  }
}