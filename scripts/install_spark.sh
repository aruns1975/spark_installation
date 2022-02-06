KUBERNETES_VERSION="spark-3.2.1/spark-3.2.1-bin-hadoop2.7.tgz "


wget https://downloads.apache.org/spark/$KUBERNETES_VERSION
tar xvf spark-*
sudo mv spark-3.2.1-bin-hadoop2.7 /opt/spark


echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
echo "export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin" >> ~/.bashrc
echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.bashrc

source ~/.bashrc