// terraform {
//   required_providers {
//     azurerm = {
//       source  = "hashicorp/azurerm"
//       version = "=3.16.0"
//     }
//   }
// }

// provider "azurerm" {
//   subscription_id = "60d38622-38ad-40a0-984a-3f7ac52dd133"
  
//   features {}
// }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.87.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  features {}
}