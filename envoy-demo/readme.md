### 安装和启动

```
$ brew tap tetratelabs/getenvoy

$ brew install envoy

将打开文件限制调整到2^20,然后启动。免得压测时报错并退出：too many open files.
$ ulimit -S -n 1048576 && envoy -c ./envoy.yaml

```


### 参考资料

https://www.envoyproxy.io/docs/envoy/latest/extending/extending

