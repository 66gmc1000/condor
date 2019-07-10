variable "vultr_seattle" {
  description = "Vultr Seattle Region"
  default = "4"
}

# variable "vultr_atlanta" {
#   description = "Vultr Atlanta Region"
#   default = "6"
# }

variable "ubuntu_os" {
  description = "Docker on CentOS 7"
  default = 215
}
# note - no public IP included in this plan (internal boxes only)
# variable "one_cpu_512_mb_ram" {
#   description = "512 MB RAM,10 GB SSD,500 MB BW"
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