#!/bin/bash

mongod --config /work/shard/mongodConfig.conf &
mongos --config /work/shard/mongodRouter.conf &
sleep 3s
mongod --config /work/shard/mongodShard1.conf &
mongod --config /work/shard/mongodShard2.conf &
sleep 2s
ps -ef | grep mongo
sleep 3s
netstat -ntlp
