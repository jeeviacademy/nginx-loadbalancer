# Create LoadBalancer Using Vagrant Tool 

Vagrant is a tool for building and managing virtual machine environments in a single workflow. In short, Vagrant tools will make life easier for developer who wants to setup a virtual machine in a short period. As part of DevOps in Depth Course structure, we are building NGINX Loadbalancer using Vagrant Tool. To know more about the course [DevOps in Depth]

> IF YOU DONT WANT TO FOLLOW THE BELOW STEPS 
> YOU CAN CLONE THE REPO AND JUST RUN VAGRANT UP
> MAKE SURE PREREQUISITE AND PLUGIN SHOULD ALREADY BE INSTALLED

## Prerequisite

- VirtualBox 6
- Linux OS
- Basic Linux Knowledge

## Features

- Easy to Setup Virtual Machine Faster
- Building and Managing Development environment Easily
- Easy to destroy Virtaul Machine once development is completed

## Plugins
In order to use this Vagrantfile, You need to install [Landrush] & [hostmanager] as a pre-requisite packages.

Install pre-requistie dependencie Packages.

```sh
vagrant plugin install landrush
vagrant plugin install hostmanager
```
Create a Directory
```sh
mkdir nginx-loadbalancer
```
cd to directory:
```sh
cd nginx-loadbalancer
```
Create or copy vagrantfile fron repo

```sh
cp Vagrantfile .
```

Run Vagrant up Command to bring up 3 VM

```sh
Vagrant up
```
To check the status of the machine
```sh
Vagrant status
```

## License

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
   [DevOps in Depth]: <https://www.jeeviacademy.com/devops-in-depth/>
   [Landrush]: <https://github.com/vagrant-landrush/landrush>
   [hostmanager]: <https://github.com/devopsgroup-io/vagrant-hostmanager>
   
