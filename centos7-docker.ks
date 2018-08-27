#CentOS 7 with elrepo-kernel and latest stable docker
#This will install a production ready docker environment for your wishes
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

# Perform the installation in a completely non-interactive command line mode
cmdline

# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part / --asprimary --fstype="ext4" --grow --size=1

# Set root password
rootpw toor

# CentOS repos
# Install packages from latest versions available, so no yum update after install is required
repo --name=centos --mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
repo --name=centos-updates --mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates

# Add elrepo-kernel for CentOS
repo --name=elrepo-kernel --baseurl=http://elrepo.org/linux/kernel/el$releasever/$basearch/

%packages --excludedocs --retries=1 --timeout=10
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
# TODO: fix kernel-ml-headers not found
#kernel-ml-headers
# Persist elrepo-kernel after reboot
elrepo-release
%end

%post --log=/root/ks-post.log
# Install stable Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
# Enable docker service at startup
systemctl enable docker
%end
