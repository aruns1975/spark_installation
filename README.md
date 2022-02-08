# spark_installation
1) Check VAgrantfile for the number of worker and worker configuration
2) Adjust the memory and cpu alloted to the Virtual Files
3) Adjust memory to the worker nodes by adjusting the script\start_worker.sh

Refer to the link https://spark.apache.org/docs/latest/spark-standalone.html

4) IPS
    - 10.1.0.100 - Master Node
    - 10.1.0.101 - Worker Node 1
    - 10.1.1.102 - Worker Node 2
5) http://10.1.0.100:8080 - To access the Spark control center