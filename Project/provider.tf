// terraform {
//   required_providers {
//     azurerm = {
//       source  = "hashicorp/azurerm"
//       version = "3.87.0"
//     }
//   }
// }

// terraform {
//   required_providers {
//     azurerm = {
//       source  = "hashicorp/azurerm"
//       version = "~> 3.0"
//     }
//   }
// }

// # Configure the Microsoft Azure Provider
// provider "azurerm" {
//   features {}
// }

terraform {
  required_version = ">= 1.7.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0, < 4.0"
    }

    // random = {
    //   source  = "hashicorp/random"
    //   version = "~> 3.150.0"
    // }
  }

  backend "azurerm" {
    resource_group_name  = "Vikar-Terra-RG"
    storage_account_name = "vikarterrastatefile"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }

  // required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}