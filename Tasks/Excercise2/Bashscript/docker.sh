#!/bin/bash
REQUIRED_PKG="docker-ce"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
  sudo apt-get update
  sudo apt-get --yes install $REQUIRED_PKG
  sudo groupadd docker
  sudo systemctl enable docker
  sudo usermod -aG docker $USER
fi
echo "Pulling Elastic image and starting the container"
sudo docker run -d -p 9200:9200 -p 9300:9300 -v elsticvolume:/usr/share/elasticsearch/data -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.9.1
echo ""
echo "Waiting for container to spin up"
sleep 45
echo ""
echo "Checking the Elasticsearch health status"
echo ""
for i in {1..5}; do curl -X GET "localhost:9200/_cluster/health?wait_for_status=yellow&timeout=50s&pretty" && break || sleep 15; done
