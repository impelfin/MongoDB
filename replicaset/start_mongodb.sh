#!/bin/bash

/work/replica/mongodb/bin/mongod --config /work/replica/master.conf &
/work/replica/mongodb/bin/mongod --config /work/replica/slave1.conf &
/work/replica/mongodb/bin/mongod --config /work/replica/slave2.conf &
/work/replica/mongodb/bin/mongod --config /work/replica/arbiter.conf &
sleep 2s
ps -ef | grep mongo
sleep 3s 
netstat -ntlp
