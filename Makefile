up:
	docker run -d --name="link-mysql-python2" -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v `pwd`/mysql-data/var/lib/mysql:/var/lib/mysql:rw mysql:5.5;
	docker run -d -i -t  --name="python2"  --link link-mysql-python2:mysql -v `pwd`:/home/python2  python2.3-mysql5.5 /bin/bash;

down:
	docker rm  link-mysql-python2 python2 ;

kill:
	docker kill python2 link-mysql-python2;

restart:
	docker restart link-mysql-python2 python2 ;

status:
	docker ps -a;

connectPython:
	docker exec -it python2 bash;

connectMysql:
	docker exec -it link-mysql-python2 bash;

mysqlIp:
	docker exec -it python2 env | grep MYSQL_PORT_3306_TCP_ADDR