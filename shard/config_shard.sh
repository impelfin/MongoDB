#!/bin/bash

# defalut mongdb daemon stop.
systemctl stop mongod

# remove data directory
if [ -f data ]
then
	rm -rf ./data
fi

# Config Server
mkdir -pv /work/shard/data/configdb
mkdir -pv /work/shard/data/logs
touch /work/shard/data/logs/configsvr.log

mongod --config /work/shard/mongodConfig.conf &
sleep 1s

# Router Server
touch /work/shard/data/logs/mongorouter.log

mongos --config /work/shard/mongodRouter.conf &
sleep 3s

# Shard1 Server
mkdir -pv /work/shard/data/shard1db
touch /work/shard/data/logs/shard1.log

mongod --config /work/shard/mongodShard1.conf &
sleep 1s

# Shard2 Server
mkdir -pv /work/shard/data/shard2db
touch /work/shard/data/logs/shard2.log

mongod --config /work/shard/mongodShard2.conf &
sleep 1s

# process status 
ps -ef | grep mongo
sleep 3s

# netstatus
netstat -ntlp
