terraform {
        required_providers { 
                docker = {       
                        source = "kreuzwerker/docker"
                        version = "3.0.2"
                }
        }
}

provider "docker" {}

resource "docker_container" "container_nginx" {
	name = "nginx"
	image = "nginx:latest"
	ports {
		internal = 80
		external = var.nginx_external_port[terraform.workspace]
	}
}

# terraform init
