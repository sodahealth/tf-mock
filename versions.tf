terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.25.0"
    }
  }
}

# the PAT to make this work is: ghp_A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0uVwXyZ
