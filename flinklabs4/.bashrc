export GRADLE_HOME=/home/vagrant/gradle-3.4.1
export FLINK_HOME=/home/vagrant/flink-1.5.3

alias ls='/bin/ls -F'


function eclipse() {
  nohup /home/vagrant/eclipse/eclipse&
}

function start-flink() {
  $FLINK_HOME/bin/start-cluster.sh
}
function stop-flink() {
  $FLINK_HOME/bin/stop-cluster.sh
}

function flinklog() {
  tail -f $FLINK_HOME/log/flink-vagrant-taskexecutor-0-flink1.out
}



export PATH=$FLINK_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:\
/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:\
/usr/lib/jvm/java-8-oracle/db/bin:/home/vagrant/gradle-3.4.1/bin