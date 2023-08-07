provider "aws" {
  alias      = "cloud"
  region     = var.region
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
