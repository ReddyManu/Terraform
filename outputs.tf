#output "abc" {
#  value = "Hello"
#}
#
#output "abc1" {
#  value = "Hello\nWorld"
#}

variable "abc" {
  default = "100"
}

output "abc" {
  value = var.abc
}

variable "xyz" {}

output "xyz" {
  value = var.xyz
}