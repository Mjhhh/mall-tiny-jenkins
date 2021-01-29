#!/usr/bin/env bash
app_name='mall-tiny-jenkins'
docker stop ${app_name}
echo '----stop container----'
docker rm ${app_name}
echo '----rm container----'
docker run -p 8088:8088 --name ${app_name} \
--link mysql:db \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/${app_name}/logs:/var/logs \
-d 101.200.216.3:2375/${app_name}:1.0-snapshot
echo '----start container----'