# kickstart-samples
Sample kickstart config files to automate CentOS/Fedora installs.

It includes:
  * [centos7-docker.ks](https://github.com/adrianharabula/kickstart-samples/blob/master/centos7-docker.ks) - CentOS 7 with elrepo-kernel and latest stable docker  
    This will install a production ready docker environment for your wishes.

# Instructions (under contruction)

## 1. Make the Kickstart file available on a web server

The absolutely fastest way to get a simple web server up and running using Python, for development purposes:
```
python -m SimpleHTTPServer 8000
```
## 2. Boot minimal CentOS image

Then just add the following kernel parameter use the kickstart file served over the web server above:
```
ks=http://machine-hostname-or-ip:8000/centos7-docker.ks
```

This will start a fresh install from the kickstart file. Attached hdd on the machine will be erased.
