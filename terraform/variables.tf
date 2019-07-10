variable "vultr_seattle" {
  description = "Vultr Seattle Region"
  default = "4"
}

# variable "vultr_seattle" {
#   description = "Vultr Seattle Region"
#   default = "6"
# }

variable "docker_centos" {
  description = "Docker on CentOS 7"
  default = 215
}
# variable "one_cpu_one_gb_ram" {
#   description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
#   default = 200
# }
variable "one_cpu_one_gb_ram" {
  description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
  default = 201
}
variable "hostname" {
  description = "the hostname for the vps"
  default = "condor-wordpress"
}
variable "api_key" {}

variable "ssh_key" {}

variable "condor-key" {
  default ="test"
}