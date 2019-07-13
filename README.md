# Docker-Hands-On:

This tutorial is based mainly on the practical examples. We will cover topics based on examples, rather than just concepts. For concepts, will just provide link from the
official Docker documentation website or if there is some other reference website.

Starting with basic questions:
Q1. What is Container? 
Q2. What is Docker?
Q3. Is it same as virtualization?
Q4. How it is different from Virtual Machines?
Q5. Who uses Dockers and why?

In summary:

1. Container is a technology appeared in 2000 as freeBSD Jails with idea of partitioning the freeBSD system into multiple sub-systems or jails. It was carried on later by a project called as LXC(Linux Containers Project).
2. Docker, carry forward this technology from around 2008 by adding more tools, ideas etc. In recent times, docker and container are used interchagebly.
3. Cointainer is based on a few basic features in Linux operating System:
    a. Control Groups:
    In Short cgroups, is used to allocate resources to one or more processes. What is allow to allocate ? System resources as CPU time, Memory, Network bandwidth to a process. 
    This is what docker/LXC does, it allocates resources to containers, so that it doesnt exceed memory/cpu/network bandwidth limit and compromises the system. If you have docker installed on your system,
    you can check what is the maximum memory/cpu limit allocated to docker. Or go ahead and type this command on your system(which has docker installed):
    docker container create --help
    You will see options to limit some resources as cpu/memory to the container you want to create. This option leverages the cgroup technology.
    b. Namespaces:
    A feature used to partition kernel resources so that one process cannot see other set of processes. Why this is required ? to isolate once process with another. In the end, containers are just processes for system. So each process is isolated from another. Processes can sure communicate with each other, but as separate entities. So, when you create a container lets say:
    docker container create -it -n first  alpine: This will create a container
    docker start -a -i first: This will start the container, and log-in on it. Now, try the command, ps -ef. You will see as below:
    ```
    / # ps -ef
    PID   USER     TIME  COMMAND
    1 root      0:00 /bin/sh
    7 root      0:00 ps -ef
    / # 
    / # pwd
    /
    / # 
    ```
    So, this container cannot see anything outside of itself. This is acheived through Namespaces.
    c. Chroot:
    changes apparent root directory for current running process and its children. As you can see from above example, within this container, you can see path set as root directory "/". Now, this is not absolute path of / on the
    hosty operating system, rather it is a relevant one for the container or this process. So for container only, it is a root directory.
    d. Images:
    When you images for containers(be it docker or LXC), you will see their structure is pretty much same as your basic unix like operating system. What it contents ? basically only those files which are required for your applications to be executed. Check out this path: /var/lib/docker, see if you can see any image there. Also, can search on internet for "docker image scratch" and see for it. It will show you some basics on what basic docker images are made up of.
4. Is Docker same as virtualization ? Its rather complimentary, in virtualization, hypervisor shares hardware resources between multiple operating systems. In container, we rather share resources with processes within the same operating system. So, scale is quite reduced here. It helps in saving lots of expensive system, since just to deploy a website you wont require a full fledged operating system which will take good amount of hardware resources, but rather one or more containers on same OS. 
5. Who uses Dockers? well it is now being used by many big names of the IT industry. Rather naming them, consider this. Due to its advantages to leverage resources of same OS, you can host one or more applications
    and save resources. Hence, it had been useful in many areas, such as you can use just one machine and spin up a full fledge website with a backend light DB easily. BUT this can be done anyways without docker right ? Correct, but it wont be as portable as docker is. If you have created such scenario on a windows platform, you have re-design it for a Linux platform. But for dockers, easy peasy !

Some references:
https://itnext.io/chroot-cgroups-and-namespaces-an-overview-37124d995e3d
https://www.redhat.com/en/topics/containers/whats-a-linux-container
https://docs.docker.com/config/containers/resource_constraints/
https://blog.netapp.com/blogs/containers-vs-vms/
