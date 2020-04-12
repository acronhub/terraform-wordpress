# General
variable "project_name" {
    type = "string"
    description = "プロジェクト名"
    default = "example"
}
variable "domain" {
    type = "string"
    description = "公開するドメイン"
    default = "example.com"
}
variable "region" {
    type = "string"
    description = "AWS 構築するリージョンを指定"
    default = "ap-northeast-1"
}

# VPC
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "vpc_public-a" {
    default = "10.0.0.0/18"
}
variable "vpc_public-c" {
    default = "10.0.64.0/18"
}

variable "ssh_key_name" {
    type = "string"
    description = "AWS EC2インスタンスにログインすうための秘密鍵の名前"
    default = "example-wordpress"
}
