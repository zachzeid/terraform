
resource "google_compute_instance" "sshserver" {
  name = "sshserver-${var.project-name}-${var.from}"
  machine_type = "n1-standard-1"
  zone = "us-central1-b"
  labels = {
    deployed = "${var.from}"
    project = "${var.project-name}"
    repo = "${var.updated-from}"

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
