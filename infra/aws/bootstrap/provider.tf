provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Project     = "kendrix-entity-resolution"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}