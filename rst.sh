#!/bin/sh

killall -9 uwsgi
cd /home/ubuntu/site01/
#nohup uwsgi --socket ${dir}site01.socket --module ${dir}site01.wsgi --chmod-socket=666 &
nohup uwsgi --socket site01.socket --module site01.wsgi --chmod-socket=666 &

