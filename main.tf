provider "google" {
  
  project = "herpaderp-1"
  region = "us-central1"
}

resource "google_compute_instance" "sshserver" {
  name = "sshserver1"
  machine_type = "n1-standard-1"
  zone = "us-central1-b"
  tags = ["deployed from", "{var.deployed_from}"]
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
