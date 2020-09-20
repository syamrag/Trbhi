# Trbhi
Cloud operation Engineer-Tasks

Each task has been has put in diffrent folders. 

Excercise 1. This folder contains two folders. One for Automation script and the other for VM metrcis collection

Automationscript

Automation script will create two Ubuntu machies with in the same Virutal network in Azure using Ansible. This script assumes that the Ansible is already connected to an Azure subscribtion either via Az login or Azure service principal and default subscribtio has been choosen on the System where this playbook is supposed to run.

To run the automation script type the below command

ansible-playbook script.yml

Vmmetricescript. This folder contains the scripts to collect the VM metrices

It has two files.First one is "vmmetrices.yml" and the second one  "subscript.yml". I created the Vm metrics collection scrip in such a way that the the variables are included in the "vmmetrices.yml" file and it include the second file "vmmetrices.yml" whcih is used to collect the Vm Disk ussage, CPU ussage and network in and out ussage. It has to be noted that two files "subscript.yml" and "vmmetrices.yml" must be presend in the same directory other wise the the include path for subscript.yml must be explictly specified. This script use Azure CLI to get VM metrics so az must be installed and a default subscribtion must be set prior to running this ansible script. To get the Vm metrices of the Virtual machines created in the previous task, run the below command. 

ansible-plabook vmmetrices.yml

Excercise 2

This folder contains two sub folders.

Bashscript

This folder contains the bash script to install Docker on an empty Ubuntu system and pulls the Elastic search container starts it using a volume to persist the data. This script wait for 45 seconds after running docker pull command to make sure that docker container is up. After 45 seconds the script will check for the health status of the docker container using CURL command. The CURL command wil be retried up 5 times untill untill a non zero exit code occures.

healthcheck-command

This folder contains the same CURL command used to get the health status of Elastic search used in the script

Excercise 3

This folder has a note which contains the details like troubleshooting stpes, what wen wrong, and how did I resolved the redis issue on the Linux server.

Excercise 4

This folder has a note which contains the details like troubleshooting stpes, what wen wrong, and how did I resolved the IIS issue on the Windows server.
