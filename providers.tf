provider "google" {
  credentials = "${file("herpaderp-dd00d52e1429.json")}"
  project = "herpaderp-1"
  region = "us-central1"
}
terraform {
  backend "gcs" {
    bucket = "terraform-remote-state-5c1f261e-f412-4e1e-8907-63ba259ec6f5"
  }
}
