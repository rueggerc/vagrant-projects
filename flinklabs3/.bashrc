export DERBY_HOME=/home/vagrant/db-derby-10.14.2.0-bin
export GRADLE_HOME=/home/vagrant/gradle-3.4.1
export DERBY_OPTS=-Dderby.system.home=/home/vagrant/DerbyDB
export KAFKA_HOME=/home/vagrant/kafka_2.11-1.1.0
export FLINK_HOME=/home/vagrant/flink-1.5.0

alias ls='/bin/ls -F'

function derby() {
    startNetworkServer -h 0.0.0.0
}

function eclipse() {
  nohup /home/vagrant/eclipse/eclipse&
}

function start-flink() {
  $FLINK_HOME/bin/start-cluster.sh
}
function stop-flink() {
  $FLINK_HOME/bin/stop-cluster.sh
}


function start-zoo() {
  echo Starting zookeeper...
  $KAFKA_HOME/bin/zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties
}

function stop-zoo() {
  $KAFKA_HOME/bin/zookeeper-server-stop.sh
}

function start-kafka() {
  nohup $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > /dev/null 2>&1 &
}

function stop-kafka() {
  $KAFKA_home/bin/kafka-server-stop.sh 
}

function create-topic() {
  echo Topic=$1 Partition=$2 Replication-Factor=$3
  $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor $3 --partitions $2 --topic $1
}

function topics() {
  $KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper localhost:2181
}

function delete-topic() {
  $KAFKA_HOME/bin/kafka-topics.sh --delete --zookeeper vagrant-ubuntu-trusty-64:2181 --topic $1
}

function producer() {
  $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list vagrant-ubuntu-trusty-64:9092 --topic $1
}

function consumer() {
  $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server vagrant-ubuntu-trusty-64:9092 --topic $1 --from-beginning
}



export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:\
/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:\
/usr/lib/jvm/java-8-oracle/db/bin:/home/vagrant/gradle-3.4.1/bin:/home/vagrant/db-derby-10.14.2.0-bin/bin:\
/home/vagrant/gradle-3.4.1/bin
