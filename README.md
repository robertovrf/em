# Emergent Microservice

This project presents the first implementation of the Emergent Microservice concept. These dynamic microservices have the ability to adapt their internal architectural composition in real-time, enhancing performance and minimizing response time as the system operates. 

We provide scripts within this project that facilitate experimentation with our novel concept in an elastic environment, enabling the execution of emergent microservices within a Kubernetes-managed cluster. The subsequent sections details the compilation process and guide you through the execution of the Emergent Microservice.

Note that we have experimented with the concept of Emergent Microservices on Google Cloud platform. Particularly, we have setup a Google Kubernetes Engine (GKE) cluster. All scripts avaialble in this project were designed to work on a GKE cluster. If you have a different Kubernetes-managed cluster, you have to make the required changes to execute the Emergent Microservice. We executed the Emergent Microservice on a GKE cluster with the following configuration:

- Location: us-central region
- Number of nodes: 8 nodes
- Image: GKE standard Ubuntu image
    --  with 2vCPUs
    -- 4GB of memory
    -- 100GB of storage

Note we used the Ubuntu image that comes with NFS, GlusterFS, XFS, Sysdig, Debian packages, and Docker installed.

## Required Software

To execute the Emergent Microservice you will need a Kubernetes cluster, docker and the Dana programming language installed on your machine. We recommend the installation of Dana version 253. For information on how to install Dana, please refer to the [Dana website](https://projectdana.com).

## Compiling and Executing the Emergent System

We have provided a series of scripts to assist the compilation and execution of the system. The scripts are organised into three groups: compilation and container creation (scripts with names starting with "setup"), launching and executing the system (scripts with names starting with "launch"), and removing and deleting containers (scripts with names starting with "remove"). Finally, we provide a single script for populating the database (script named "populate_db.sh").

The scripts assists the interested users to compile and launch the Emergent Microservice with specialised software used to assist in the experiments. The first experiment we conduct is the Groundtruth Experiments where we explore each Emergent Microservice composition in its static composition exposed to different workloads. This is to establish that there is not a composition that is best for every single workload. The second experiment is the one that aims at exploring the Emergent Microservice learning capabilities. This experiment aims executing a single replica of the Emergent Microservice exposed to different workloads. Finally, the last set of scripts configure the Emergent Microservice and other software responsible for creating replicas whenever the executing Emergent Microservice response time surpassed a predefined threshold. The details of how to execute each one of these experiments are later described.

To excecute the following scripts to reproduce the experiments, we first need to setup, launch and populate the database. For that, we use the following commands:

```
$ chmod +x launch_db.sh
$ ./launch_db.sh
```

The above commands give execution permision to "launch_db.sh" script and execute it. Next, we need to get the public IP address. In the GKE cluster, we obtained the recentely requested public IP address by using the following command:

```
$ kubectl get service
```

As a result, you will see the "mydb" service public IP. This may take a little while. After getting the database public IP, we can populate the database using the "populate_db.sh" script, with the    following commands:

```
$ chmod +x populate_db.sh
$ ./populate_db.sh <ip>
```

This scripts takes a while to populate the database. After the script finishes execution, we need to change some YAML configuration files with the database public IP before we launch the Emergent Microservice. Change all .yaml files in the path "kubernetes/emergent-microservice" to add the database public IP addres. For instance, open the file "emergent-microservice.yaml" and replace the IP address that is on "value" to the database public IP:  

```
- name: DATABASE_HOST
            value: "34.123.235.149"
```

Now create an updated version of the Emergent Microservice container by executing the script: setup_em_all.sh, using the following command:

```
$ chmod +x setup_em_all.sh
$ ./setup_em_all.sh <dockerhub username>
```

Now it is time to execute the container. We do this by executing the "launch_em.sh" script:

```
$ chmod +x launch_em.sh
$ ./launch_em.sh
```

After a little while, check to see if the container is up and running by using the following command:

```
$ kubectl get deploy
```

This command should give you the status of the Kubernetes deployment we have just created. If you have issues interpreting "kubectl" output, check [this link](https://kubernetes.io/docs/reference/kubectl/).

Once the container is up and running, we need to log into the container to gain access to the _IneractiveEmergentSys_ tool. But first we have to get the POD ID:

```
$ kubectl get pods
```

Copy the emergent-microservice POD_ID from the result "kubectl" output. Then run the following command replacing <emergent-microservice-POD-ID> to the POD ID:

```
$ kubectl exec -it <emergent-microservice-POD-ID> -- /bin/bash 
```

Now you should have access to a terminal inside the container. Now execute the _InteractiveEmergentSys_ tool. This tool grants you access to the executing emergent microservice, allowing you to change the microservice composition, listing the available composition, getting the measured response time for the executing microservice compositions, and so on. To execute the tool, type the following command:

```
$ dana InteractiveEmergentSys
```

Now you should have access to a terminal to interact with the executing Emergent Microservice. Type "help" for a list of available commands. We recommend the new user to explore the different commands to familirize themselves with the Emergent Microservice. 

To send requests to the executing emergent microservice, we should first find the emergent microservice public IP by using the following command:

```
$ kubectl get service
```

This command should output a list of IPs for each executing container. Copy the public IP address of the emergent microservice deployment, open the client programs in the path "clients" and change the _SERVERADDR_ variable to the microservice's public IP address. After changing the _SERVERADDR_ variable to point to the microservice's IP, you should compile all client programs. To compile the client programs, go to the "clients" folder  use the following command:

```
$ dnc . -v
```

To execute any of the client programs, execute the following command:

```
$ dana Trace1.o
```

For more information, feel free to get in contact by sending an email to: roberto.filho [at] ufsc.br