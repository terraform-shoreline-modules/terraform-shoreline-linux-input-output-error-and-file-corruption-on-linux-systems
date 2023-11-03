terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "input_output_error_and_file_corruption_on_linux_systems" {
  source    = "./modules/input_output_error_and_file_corruption_on_linux_systems"

  providers = {
    shoreline = shoreline
  }
}