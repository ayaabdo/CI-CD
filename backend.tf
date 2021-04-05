terraform {
    backend "s3" {
        bucket = "ayaterraformbucket"
        key = "iti/lab/terraform.tfstate"
        region  = "us-east-1"
        dynamodb_table = "block"
    }
}