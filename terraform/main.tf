provider "vultr" {
  # In your .bashrc you need to set
  # export VULTR_API_KEY="Your Vultr API Key"
}

resource "vultr_ssh_key" "condor-key" {
  name = "condor-key"
  ssh_key = "${var.ssh_key}"
}

resource "vultr_startup_script" "deb-python-install" {
			name = "deb-python-install"
			type = "boot"
			script = "apt install python -y"
		}
    
resource "vultr_server" "my_server" {
  plan_id = "${var.one_cpu_one_gb_ram}"
  region_id = "${var.vultr_seattle}"
  os_id = "${var.docker_centos}"
  label = "${var.hostname}"
  enable_ipv6 = true
  auto_backup = true
  enable_private_network = true
  notify_activate = false
  ddos_protection = true
  tag = "tag"
  script_id = "${vultr_startup_script.deb-python-install.id}"
  ssh_key_ids = ["${vultr_ssh_key.condor-key.id}"]
  firewall_group_id = "${vultr_firewall_group.fwg.id}"
}

resource "vultr_firewall_group" "fwg" {
  description = "docker-fwg"
}

resource "vultr_firewall_rule" "http" {
  firewall_group_id = "${vultr_firewall_group.fwg.id}"
  protocol = "tcp"
  network = "0.0.0.0/0"
  //network = "${vultr_server.my_server.main_ip}/32"
  from_port = "80"
}
resource "vultr_firewall_rule" "https" {
  firewall_group_id = "${vultr_firewall_group.fwg.id}"
  protocol = "tcp"
  network = "0.0.0.0/0"
  from_port = "443"
}
resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = "${vultr_firewall_group.fwg.id}"
  protocol = "tcp"
  network = "0.0.0.0/0"
  from_port = "22"
}

# resource "vultr_dns_domain" "my_domain" {
#   domain = "tf-domain.com"
#   server_ip = "${vultr_server.my_server.main_ip}"
# }

# resource "vultr_dns_record" "a-record" {
#   data = "${vultr_server.my_server.main_ip}"
#   domain = "${vultr_dns_domain.my_domain.id}"
#   name = "www"
#   type = "A"
#   ttl = "3600"
# }