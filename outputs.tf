#output "abc1" {
#  value = "Hello\nWorld"
#}
#
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
#
## String Data type
#variable "sample1" {
#  default = "Hello World"
#}
#
## Number data type
#variable "sample2" {
#  default = 100
#}
#
## Boolean Data type
#variable "sample3" {
#  default = true
#}
#
#output "sample1" {
#  value = "Value of sample1 = ${var.sample1}"
#}
#
#output "sample2" {
#  value = var.sample2
#}
#
#output "sample3" {
#  value = " Value of sample3 = ${var.sample3}"
#}
#
#variable "samplex" {
#  default =  [
#    "Hello",
#    1000,
#    true,
#    "World"
#  ]
#}
#
#variable "sampley" {
#  default =  {
#    string = "Hello",
#    number = 100,
#    boolean = true
#  }
#}
#
#output "samplex" {
#  value = "Value 1 = ${var.samplex[0]}, Value 3 = ${var.samplex[2]}"
#}
#
#output "sampley" {
#  value = "String = ${var.sampley["string"]}, Number = ${var.sampley["number"]}, Boolean = ${var.sampley["boolean"]}"
#}

#variable "a" {}
#
#output "a" {
#  value = var.a
#}

variable "y" {
  default = 852
}

output "y" {
  value = var.y
}