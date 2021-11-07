#output "abc" {
#  value = "Hello"
#}
#
#output "abc1" {
#  value = "Hello\nWorld"
#}

#variable "abc" {
#  default = "100"
#}
#
#output "abc" {
#  value = var.abc
#}
#
#variable "xyz" {}
#
#output "xyz" {
#  value = var.xyz
#}

# String Data type
variable "sample1" {
  default = "Hello World"
}

# Number data type
variable "sample2" {
  default = 100
}

# Boolean Data type
variable "sample3" {
  default = true
}

output "sample1" {
  value = "Value of sample1 = ${var.sample1}"
}

output "sample2" {
  value = var.sample2
}

output "sample3" {
  value = " Value of sample3 = ${var.sample3}"
}