# 测试过程 

###  第一步  

```bash
./build.sh
```

### 第二步

#### run `backend-service-demo`

```
java  -Xms4g -Xmx4g -XX:+UseG1GC -jar backend-service-demo/build/libs/backend-service-demo-1.0.0.jar
```

### 第三步

#### run `gateway-demo`

```
java -Xms4g -Xmx4g -XX:+UseG1GC -jar gateway-demo/build/libs/gateway-demo-1.0.0.jar
```

### 第四步

#### benchmark with `wrk2`

安装wrk2

```
brew install wrk2
```

#### Test response with 100 characters
```bash
# 直接访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:9091/demo?delay=50&length=128" --latency
Running 30s test @ http://127.0.0.1:9091/demo?delay=50&length=128
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    61.10ms   51.38ms 789.50ms   98.20%
    Req/Sec   217.20     30.92   242.00     85.56%
  Latency Distribution
     50%   54.84ms
     75%   56.40ms
     90%   57.90ms
     99%  358.56ms
  102226 requests in 30.10s, 26.22MB read
  Socket errors: connect 0, read 135, write 0, timeout 0
Requests/sec:   3395.80
Transfer/sec:      0.87MB

# 通过spring cloud gateway 访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:9092/proxy/demo?delay=50&length=128" --latency
Running 30s test @ http://127.0.0.1:9092/proxy/demo?delay=50&length=128
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    81.35ms   71.15ms   1.11s    95.08%
    Req/Sec   165.27     49.62   242.00     67.34%
  Latency Distribution
     50%   61.75ms
     75%   80.41ms
     90%  117.04ms
     99%  427.83ms
  76788 requests in 30.04s, 17.94MB read
  Socket errors: connect 0, read 185, write 0, timeout 0
Requests/sec:   2555.82
Transfer/sec:    611.51KB

```

#### Test response with 10240 characters
```bash
# 直接访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:9091/demo?delay=50&length=10240" --latency
Running 30s test @ http://127.0.0.1:8081/demo?delay=50&length=10240
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    58.85ms    3.40ms  74.01ms   67.73%
    Req/Sec   204.10     42.25   242.00     78.71%
  Latency Distribution
     50%   58.75ms
     75%   61.26ms
     90%   63.17ms
     99%   66.95ms
  97722 requests in 30.09s, 0.94GB read
Requests/sec:   3247.59
Transfer/sec:     32.16MB


# 通过spring cloud gateway 访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:8082/proxy/demo?delay=50&length=10240" --latency
Running 30s test @ http://127.0.0.1:9091/demo?delay=50&length=10240
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    60.45ms   18.13ms 287.48ms   92.72%
    Req/Sec   202.36     42.61   242.00     82.51%
  Latency Distribution
     50%   55.84ms
     75%   58.64ms
     90%   70.85ms
     99%  143.49ms
  96294 requests in 30.10s, 0.93GB read
  Socket errors: connect 0, read 117, write 5, timeout 0
Requests/sec:   3198.78
Transfer/sec:     31.67MB

```

#### Test response with 40960 characters

```bash
# 直接访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:9091/demo?delay=50&length=40960" --latency
Running 30s test @ http://127.0.0.1:9091/demo?delay=50&length=40960
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    70.38ms   47.31ms 601.81ms   94.07%
    Req/Sec   187.40     54.97   242.00     81.47%
  Latency Distribution
     50%   59.15ms
     75%   63.95ms
     90%   77.58ms
     99%  320.49ms
  88626 requests in 30.09s, 3.39GB read
  Socket errors: connect 0, read 1, write 0, timeout 0
Requests/sec:   2945.30
Transfer/sec:    115.45MB



# 通过spring cloud gateway 访问后端服务
$ wrk -t16 -c200 -d30s "http://127.0.0.1:9092/proxy/demo?delay=50&length=40960" --latency
Running 30s test @ http://127.0.0.1:9092/proxy/demo?delay=50&length=40960
  16 threads and 200 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   155.33ms  224.02ms   1.65s    91.60%
    Req/Sec   132.57     45.66   232.00     71.78%
  Latency Distribution
     50%   82.63ms
     75%  115.18ms
     90%  294.97ms
     99%    1.25s
  55664 requests in 30.10s, 2.13GB read
  Socket errors: connect 0, read 159, write 0, timeout 0
Requests/sec:   1849.49
Transfer/sec:     72.46MB

```



