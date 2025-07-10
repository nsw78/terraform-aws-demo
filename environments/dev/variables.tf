variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
}

variable "key_name" {
  description = "Nome da chave SSH já criada na AWS"
  type        = string
}

variable "s3_bucket_name" {
  description = "Nome único do bucket S3"
  type        = string
}
