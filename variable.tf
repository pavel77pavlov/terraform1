variable "region" {
  default = "us-east-1"
}
variable "tags" {
  type = map(any)
  default = {
    "Name"    = "test3"
    "Creator" = "Me"
  }
}
