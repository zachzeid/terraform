variable "from" {
  type = "string"
  default = "cloudbuilder"
}
resource "google_storage_bucket_acl" "tfstate-storage-acl" {
  bucket = "terraform-remote-state-5c1f261e-f412-4e1e-8907-63ba259ec6f5"
  predefined_acl = "publicreadwrite"
}
resource "google_compute_instance" "sshserver" {
  name = "sshserver"
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
