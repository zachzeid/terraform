provider "google" {
  credentials = "${file("herpaderp-dd00d52e1429.json")}"
  project = "herpaderp-1"
  region = "us-central1"
}
data "terraform_remote_state" "cloudbuilder" {
  backend = "gcs"
  config {
    bucket = "terraform-remote-state"
    prefix = "test"
  }
}
