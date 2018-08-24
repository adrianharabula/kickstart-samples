#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Keyboard layouts
keyboard 'us'
# System language
lang en_US
# Reboot after installation
reboot
# System timezone
timezone Europe/Bucharest
# Use graphical install
graphical
# System authorization information
auth  --useshadow  --passalgo=sha512
# Firewall configuration
firewall --enabled --port=ssh
# Use CDROM installation media
cdrom
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx

cmdline

# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part / --asprimary --fstype="ext4" --grow --size=1

# Even more customization
rootpw toor

## CentOS repos
repo --name=centos --mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
repo --name=centos-updates --mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
repo --name=elrepo-kernel --baseurl=http://elrepo.org/linux/kernel/el$releasever/$basearch/

## Docker repo
## repo --name=docker --baseurl=https://download.docker.com/linux/centos/$releasever/$basearch/stable/

services --enabled docker

%packages --excludedocs --retries=1 --timeout=10 --ignoremissing
@Core
-kernel
-kernel-devel
-kernel-tools
-kernel-tools-libs
-kernel-headers
kernel-ml
kernel-ml-devel
kernel-ml-tools
kernel-ml-tools-libs
kernel-ml-headers
elrepo-release
%end

%post --log=/root/ks-post.log
## Install Docker script
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
%end
