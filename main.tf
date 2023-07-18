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

resource "aws_ssm_parameter" "prod-flywheel-fetcher-producer-free-tier-chunks-daf" {
  name  = var.name   # e.g. prod-flywheel-fetcher-producer-free-tier-chunks
  type  = "String"
  value = "REDACTED-BY-FIREFLY:5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9:sha256"
}

