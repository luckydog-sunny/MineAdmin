#!/usr/bin/env bash
docker run --name mysql -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true -d mysql:${MYSQL_VERSION} --bind-address=0.0.0.0 --default-authentication-plugin=mysql_native_password &
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:${PGSQL_VERSION} &
docker run --name redis -p 6379:6379 -d redis &
docker run -d --restart=always --name rabbitmq -p 4369:4369 -p 5672:5672 -p 15672:15672 -p 25672:25672 rabbitmq:management-alpine &
wait
sleep 10
docker ps -a