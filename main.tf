provider "aws" {
  alias      = "cloud"
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "first" {
  source    = "./modules/ssm"
  name      = "first"
  data      = "{\"password\": \"Secret123!@#\"}"
  providers = {
    aws = aws.cloud
  }
}

module "second" {
  source    = "./modules/ssm"
  name      = "second"
  data      = "random"
  providers = {
    aws = aws.cloud
  }
}
