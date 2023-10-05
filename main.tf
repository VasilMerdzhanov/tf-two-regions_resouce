terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"  # First AWS region
}

resource "aws_instance" "example_us_west_2" {
  ami           = "ami-830c94e3"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance-us-west-2"
  }
}

provider "aws" {
  alias  = "us_east_1"  # Alias for the second AWS region
  region = "us-east-1"  # Second AWS region
}

resource "aws_instance" "example_us_east_1" {
  provider      = aws.us_east_1  # Use the aliased provider
  ami           = "ami-067d1e60475437da2"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance-us-east-1"
  }
}
