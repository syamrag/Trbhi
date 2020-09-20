# Trbhi
Cloud operation Engineer-Tasks

Each task has been having put in different folders. 

Exercise 1. This folder contains two folders. One for Automation script and the other for VM metrics collection

Automationscript

Automation script will create two Ubuntu machines with in the same Virtual network in Azure using Ansible. This script assumes that the Ansible is already connected to an Azure subscription either via Az login or Azure service principal and default subscription has been chosen on the System where this playbook is supposed to run.

To run the automation script type the below command

ansible-playbook script.yml

Vmmetricescript. This folder contains the scripts to collect the VM matrices

It has two files. First one is "vmmetrices.yml" and the second one  "subscript.yml". I created the VM metrics collection scrip in such a way that the variables are included in the "vmmetrices.yml" file and it includes the second file "vmmetrices.yml" which is used to collect the Vm Disk usage, CPU usage and network in and out usage. It has to be noted that two files "subscript.yml" and "vmmetrices.yml" must be present in the same directory otherwise the include path for subscript.yml must be explicitly specified in the vmmetrices.yml file. This script uses Azure CLI to get VM metrics so az must be installed and a default subscription must be set before running this ansible script. To get the VM matrices of the Virtual machines created in the previous task, run the below command. 

ansible-plabook vmmetrices.yml

Exercise 2

This folder contains two subfolders.

Bashscript

This folder contains the bash script to install Docker on an empty Ubuntu system and pulls the Elastic search container and starts it using a volume to persist the data. This script waits for 45 seconds after running docker run command to make sure that docker container is up. After 45 seconds the script will check for the health status of the Elastic search container using CURL command. The CURL command will be retried up 5 times until untill a non zero exit code occurs.

healthcheck-command

This folder contains the same CURL command used to get the health status of Elastic search container used in the script

Exercise 3

This folder has a note which contains the details like troubleshooting steps, what went wrong, and how did I resolve the Redis issue on the Linux server.

Exercise 4

This folder has a note which contains the details like troubleshooting steps, what went wrong, and how did I resolve the IIS issue on the Windows server.
