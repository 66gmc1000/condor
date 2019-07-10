# condor

                         .___            
  ____  ____   ____    __| _/___________ 
_/ ___\/  _ \ /    \  / __ |/  _ \_  __ \
\  \__(  <_> )   |  \/ /_/ (  <_> )  | \/
 \___  >____/|___|  /\____ |\____/|__|   
     \/           \/      \/             
                                         

Quickly deploy a containerized Wordpress/MariaDB instance on Vultr

Note: This script works on debian distros only at this point (planned feature)

Features:
- Ubuntu 16.04 Server base image
- Latest MariaDB and Wordpress stable releases
- Terraform provisioning of Vultr VM and associated resources
- Ansible configuration of VM:
    - nginx reverse proxy
    - docker-engine
    - mariadb and wordpress linked containers
    - persistant wordpress and mariadb storage
- Automated installation of required provisioning tools
- Configuration of Vultr firewall rules
- Supports customization of hostname/label
- Security minded design choices


Prereqs:
- Valid Vultr subscription
- Vultr API key

To Deploy:
- Clone image: `git clone https://github.com/66gmc1000/condor.git`
- Switch to the repo root directory: `cd condor`
- Execute `./deploy-condor.sh` with required parameters:

./deploy-condor.sh --apikey=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
--hostname=MyCustomHostname

- Visit http://IPADDRESS/wp-admin to configure your newly install Wordpress instance

Defaults (can be edited via ansible/roles/deploy/tasks/main.yml):

- MYSQL_ROOT_PASSWORD: wordpress
- MYSQL_DATABASE: wordpress
- MYSQL_USER: wordpress
- MYSQL_PASSWORD: wordpress