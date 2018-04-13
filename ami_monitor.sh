#!/bin/sh
# This is a comment!
while true
do
        clear
        top -n 1 > top.txt
        value3=`head -n 3 top.txt | tail -n 1`
        value4=`head -n 4 top.txt | tail -n 1`
        valueIP=`hostname -i`
        cDate=`date`
        #payload="{'cpuStats':'$value3','memoryStats': '$value4' ,'date':'$cDate'}"
        :>top.txt
        #echo "{'ipAddress':'$valueIP','cpuStats':'$value3','memoryStats': '$value4' ,'date':'$cDate'}"
        curl -d "{'ipAddress':'$valueIP','cpuStats':'$value3','memoryStats': '$value4' ,'date':'$cDate'}" -H "Content-Type: application/json" -X POST http://13.229.202.92:8080/HealthMonitor/data/send_data.action
        sleep 10
done