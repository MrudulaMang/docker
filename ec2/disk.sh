growpart /dev/nvme0n1 4 #grow full size
pvresize /dev/nvme0n1p4 #i wrote coz lvextend may fail
lvextend -r -L +30G /dev/mapper/RootVG-homeVol
# xfx_growfs /home ----no need to use this command when using -r in the above

#installing terraform inbastian to execute terra cmds to run ansible playbook in mongo thru terra to install mongodb database
yum install -y yum-utils 
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
