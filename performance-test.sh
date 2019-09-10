#!/usr/bin/env bash

#c: 连接数，d:测试时间，r：tps，length:消息包大小

#测试的维度:
#c: 500, d:30s, r:1000, length:128
#c: 1000, d:30s, r:1000, length:128
#c: 500, d:30s, r:5000, length:128
#c: 1000, d:30s, r:10000, length:128
#c: 500, d:30s, r:5000, length:10240


# 直接访问后端服务

wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9091/demo?delay=50&length=10240"



# 通过spring cloud gateway 访问后端服务
wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=10240"