#!/usr/bin/env bash

#c: 连接数，d:测试时间，r：tps，length:消息包大小

#测试的维度:
#c: 500, d:30s, r:1000, length:128
#c: 1000, d:30s, r:1000, length:128
#c: 500, d:30s, r:5000, length:128
#c: 1000, d:30s, r:10000, length:128
#c: 500, d:30s, r:5000, length:10240


# 直接访问后端服务

echo "直接访问后端服务"

echo "直接访问后端服务   连接数: 500, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"

echo "直接访问后端服务  连接数: 1000, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"

echo "直接访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"

echo "直接访问后端服务  连接数: 1000, 测试时间: 30s, tps: 10000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9091/demo?delay=50&length=128"

echo "直接访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 10240  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9091/demo?delay=50&length=10240"



# 通过 spring cloud gateway 访问后端服务
echo "通过 spring cloud gateway 访问后端服务"

echo "通过 spring cloud gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"

echo "通过 spring cloud gateway 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"

echo "通过 spring cloud gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"

echo "通过 spring cloud gateway 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 10000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=128"

echo "通过 spring cloud gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 10240  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9092/proxy/demo?delay=50&length=10240"


# 通过 vertx gateway 访问后端服务
echo "通过 vertx gateway 访问后端服务"

echo "通过 vertx gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9093/demo?delay=50&length=128"

echo "通过 vertx gateway 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9093/demo?delay=50&length=128"

echo "通过 vertx gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9093/demo?delay=50&length=128"

echo "通过 vertx gateway 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 10000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9093/demo?delay=50&length=128"

echo "通过 vertx gateway 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 10240  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9093/demo?delay=50&length=10240"


# 通过 envoy 访问后端服务
echo "通过 envoy 访问后端服务"

echo "通过 envoy 访问后端服务  连接数: 500, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 1000 --latency "http://127.0.0.1:9095/demo?delay=50&length=128"

echo "通过 envoy 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 1000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 1000 --latency "http://127.0.0.1:9095/demo?delay=50&length=128"

echo "通过 envoy 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 128  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9095/demo?delay=50&length=128"

echo "通过 envoy 访问后端服务  连接数: 1000, 测试时间: 30s, tps: 10000, 消息包大小: 128  "
wrk2 -t 16 -c 1000 -d 30s --rate 10000 --latency "http://127.0.0.1:9095/demo?delay=50&length=128"

echo "通过 envoy 访问后端服务  连接数: 500, 测试时间: 30s, tps: 5000, 消息包大小: 10240  "
wrk2 -t 16 -c 500 -d 30s --rate 5000 --latency "http://127.0.0.1:9095/demo?delay=50&length=10240"

