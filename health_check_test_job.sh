#!/bin/bash
name=`date +%d%H%M%s`
set flag=0
docker run -P -d --name $name mesos-master:5000/nodejs-demo:dev
port=`docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' $name`
echo "start http request test"
sleep 5
resp=`curl -s http://localhost:$port`
if [ "Hello world" != "${resp}" ];then 
	echo "test failed, resp=${resp}" && flag=1
fi

docker stop ${name} && docker rm ${name};
docker rmi mesos-master:5000/nodejs-demo:dev
exit $flag
