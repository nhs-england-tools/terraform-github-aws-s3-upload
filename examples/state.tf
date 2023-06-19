terraform {
  backend "s3" {
    region         = "eu-west-2"
    bucket         = "nhs-england-tools-terraform"
    dynamodb_table = "nhs-england-tools-terraform"
    key            = "terraform.tfstate"
  }
}
