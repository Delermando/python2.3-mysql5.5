up:
	docker run -d --name="link-mysql-python3" -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v `pwd`/mysql-data/var/lib/mysql:/var/lib/mysql:rw mysql:5.5;
	docker run -d -i -t  --name="python3"  --link link-mysql-python3:mysql -v `pwd`:/home/python3  python2.3-mysql5.5 /bin/bash;

down:
	docker rm  link-mysql-python3 python3 ;

kill:
	docker kill python3 link-mysql-python3;

restart:
	docker restart link-mysql-python3 python3 ;

status:
	docker ps -a;

connectPython:
	docker exec -it python3 bash;

connectMysql:
	docker exec -it link-mysql-python3 bash;

mysqlIp:
	docker exec -it python3	 env | grep MYSQL_PORT_3306_TCP_ADDR