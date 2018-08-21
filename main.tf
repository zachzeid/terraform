provider "google" {
  credentials = "${file("herpaderp-dd00d52e1429.json")}"
  project = "herpaderp-1"
  region = "us-central1"
}

resource "google_compute_instance" "sshserver" {
  name = "sshserver1"
  machine_type = "n1-standard-1"
  zone = "us-central1-b"
  tags = ["deployed", "{var.from}"]
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
