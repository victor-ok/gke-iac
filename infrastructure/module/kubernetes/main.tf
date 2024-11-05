resource "kubernetes_namespace" "time-app" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "flask_app" {
  metadata {
    name      = "flask-app"
    namespace = kubernetes_namespace.time-app.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "flask-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }
      spec {
        container {
          image = "victorok/datetime"
          name  = "flask-app"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_service" {
  metadata {
    name      = "flask-app-service"
    namespace = kubernetes_namespace.time-app.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.flask_app.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 5000
    }
  }
}

# resource "kubernetes_service" "flask_service" {
#   metadata {
#     name = "flask-app-service"
#     namespace = kubernetes_namespace.time-app.metadata[0].name
#   }
#   spec {
#     selector = {
#       app = "flask-app"
#     }
#     ports {
#       port = 80
#       target_port = 5000
#     }
#     type = "LoadBalancer"
#   }
# }