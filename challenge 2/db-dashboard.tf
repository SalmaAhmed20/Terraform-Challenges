resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  image = "phpmyadmin/phpmyadmin"
  hostname= "phpmyadmin"
  networks_advanced {
    name=docker_network.private_network.name
  }
  ports {
    internal=80
    external=8081
    ip="0.0.0.0"
  }
  labels {
    label = "challenge"
    value ="second"
  }
  volumes{
    host_path = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path="/var/www/html"
  }
  depends_on = [
    docker_container.mariadb
  ]
  links = [
    docker_container.mariadb.name
  ]
}
