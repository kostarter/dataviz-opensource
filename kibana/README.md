Kibana

Une application Web qui se branche sur un custer elasticsearch.
Elle permet de faire tout ce qui est possible de faire via l'API REST c'est à dire des recherches, des aggrégations mais aussi de créer des diagrammes de visualisation et des dashboards. Elle permet aussi de monitorer le cluster.
Chez nos clients on l'uitilse souvent pour de l'analyse de logs.
On peut également l'utiliser pour l'analyse de click stream, d'ou vient le traffic sur mon site web, qui génére tel type d'erreurs, etc...

Ce qui fait que Elasticsearch n'est plus juste un outil de recherche, il est aussi un puissant couteau suisse pour faire de l'analytique.


+ Installation Java 8

sudo yum install java-1.8.0-openjdk-devel

+ Installation nano + unzip

+ Installation Elasticsearch 7

Import the public key of elasticsearch :

sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

sudo nano /etc/yum.repos.d/elasticsearch.repo



[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md



sudo yum install -y elasticsearch

sudo nano /etc/elasticsearch/elasticsearch.yml

node.name: node-1
network.host: 0.0.0.0
discovery.seed_hosts: ["127.0.0.1"]
cluster.initial_master_nodes: ["node-1"]
xpack.security.enabled: false

+ Lancement Elasticsearch :

sudo systemctl start elasticsearch.service

Check the version : curl -XGET 'localhost:9200'

####

sudo yum install -y kibana

sudo nano /etc/kibana/kibana.yml
server.host: "0.0.0.0"

sudo systemctl start kibana.service

