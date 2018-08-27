# kickstart-samples
Sample kickstart config files to automate CentOS/Fedora installs.

It includes:
  * [centos7-docker.ks](https://github.com/adrianharabula/kickstart-samples/blob/master/centos7-docker.ks) - CentOS 7 with elrepo-kernel and latest stable docker  
    This will install a production ready docker environment for your wishes.

# Instructions (under contruction)

## 1. Host kickstart file:

### HTTP server With python
```
python -m SimpleHTTPServer 8000
```
## 2. Boot any CentOS/Fedora image

Add the following kernel parameter:
```
ks=http://localhost:8000/centos7-docker.ks
```

This will start a fresh install from the kickstart file.
