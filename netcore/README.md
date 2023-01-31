Installing DOTNET in ubuntu 22.04 and centos 7
----------------------------------------------

Below are the Manual steps for ubuntu 22.04
------------------------------------
`````
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-6.0
`````
* And also for Webpage  [referhere](https://medium.com/@alperonline/how-to-install-dotnet-6-to-ubuntu-154a9010fa9d).
  
 Below are the Manual steps for centos 7
-----------------------------------

  #Before we install .NET, Run the below commands to add the Microsoft package signing key to your list of trusted keys and add the Microsoft package repository.

* install Microsoft packages repository to the system, allowing you to install Microsoft products on your CentOS 7 machine.
* And Also for Webpage [referhere](https://learn.microsoft.com/en-us/dotnet/core/install/linux-centos).
````
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
````
* Install dotnet-sdk-7.
  ````
  sudo yum install dotnet-sdk-7.0
  ````
  
PLAYBOOK FOR UBUNTU AND CENTOS
------------------------------

``````
---
- name: install dotnet core 6.0
  become: yes
  hosts: all
  vars:
    dotnet_ubuntu: "6.0"
    dotnet_centos: "7.0"
  tasks:
    - name: Install apt transport https
      ansible.builtin.apt:
        name: apt-transport-https
        update_cache: yes 
        state: present   
      when: "'Ubuntu' in ansible_facts['distribution']"    
    - name: Install dotnet core
      ansible.builtin.apt:
        name: dotnet-sdk-{{ dotnet_ubuntu }}
        update_cache: yes 
        state: present
      when: "'Ubuntu' in ansible_facts['distribution']"  
    - name: install redhat package manager
      ansible.builtin.package:
        name: https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
        update_cache: yes 
        state: present
      when: "'CentOS' in ansible_facts['distribution']"    
    - name: install dotnet
      ansible.builtin.yum:    
        name: dotnet-sdk-{{ dotnet_centos }}
        update_cache: yes 
        state: present
      when: "'CentOS' in ansible_facts['distribution']"  

``````