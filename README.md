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

#### run `spring-cloud-gateway-demo`

```
java -Xms4g -Xmx4g -XX:+UseG1GC -jar spring-cloud-gateway-demo/build/libs/spring-cloud-gateway-demo-1.0.0.jar
```

#### run `vertx-gateway-demo`

```
java -Xms4g -Xmx4g -XX:+UseG1GC -jar vertx-gateway-demo/build/libs/vertx-gateway-demo-1.0.0.jar
```

#### run `envoy-demo`

```
ulimit -S -n 1048576 && envoy -c ./envoy.yaml
```


### 第四步

#### benchmark with `wrk2`

安装wrk2

```
brew install wrk2
```

```bash
./performance-test.sh > performance-test.txt

```

### 第五步
查看输出数据 performance-test.txt

