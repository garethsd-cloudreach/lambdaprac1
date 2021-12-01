terraform {
  backend "s3" {
    bucket = "talent-academy-1289-fstates"
    key    = "training-terraform/terraform.tfstates"
  }
}