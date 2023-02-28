provider "aws"{
region = "us-east-1"
access_key = "AKIAWYJVMLUM5LZIAUXU"
secret_key = "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"
}

provider "aws"{
region = "ap-south-1"
alias = "mumbai"
access_key = "AKIAWYJVMLUM5LZIAUXU"
secret_key = "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"
}


resource "aws_instance" "uinstance" {
ami = "ami-0dfcb1ef8550277af"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
tags = {
Name = "US-INSTANCE"
Environment = "DEV"
}
count = 5
root_block_device{
volume_size = 10
}
}

resource "aws_instance" "minstance" {
provider = "aws.mumbai"
ami = "ami-0e742cca61fb65051"
instance_type = "t2.micro"
availability_zone = "ap-south-1a"
tags = {
Name = "Mumbai-INSTANCE"
Environment = "PROD"
}
root_block_device{
volume_size = 10
}
}
