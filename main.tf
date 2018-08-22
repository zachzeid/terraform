variable "from" {
  type = "string"
  default = "cloudbuilder"
}
resource "google_compute_instance" "sshserver" {
  name = "sshserver-${"PROJECT_ID"}"
  machine_type = "n1-standard-1"
  zone = "us-central1-b"
  labels = {
    deployed = "${var.from}"

    }
  boot_disk = {
    initialize_params = {
      image = "debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }


}
