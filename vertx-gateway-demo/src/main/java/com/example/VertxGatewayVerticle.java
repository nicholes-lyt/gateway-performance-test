package com.example;

import com.example.toolkit.PathUtil;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.http.HttpClient;
import io.vertx.core.http.HttpClientOptions;
import io.vertx.core.http.HttpClientRequest;
import io.vertx.core.json.JsonObject;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class VertxGatewayVerticle extends AbstractVerticle {

  @Override
  public void start() {
    vertx.fileSystem().readFile(PathUtil.getPathString("config.json"), res -> {
      if (res.succeeded()) {
        try {
          JsonObject config = res.result().toJsonObject();
          Integer listenPort = config.getInteger("server.port");
          String host = config.getString("info.app.host");
          Integer port = config.getInteger("info.app.port");
          HttpClient client = vertx.createHttpClient(new HttpClientOptions());
          vertx.createHttpServer().requestHandler(req -> {
            HttpClientRequest c_req = client.request(
                req.method(),
                port,
                host,
                req.uri(),
                c_res -> {
                  req.response().setChunked(true);
                  req.response().setStatusCode(c_res.statusCode());
                  req.response().headers().setAll(c_res.headers());
                  c_res.handler(data -> {
                    req.response().write(data);
                  });
                  c_res.endHandler((v) -> req.response().end());
                }
            );
            c_req.setChunked(true);
            c_req.headers().setAll(req.headers());
            req.handler(c_req::write);
            req.endHandler((v) -> c_req.end());
          }).listen(listenPort);
        } catch (Exception e) {
          log.warn(e.getMessage());
        }
      } else {
        log.warn("读取配置文件失败");
      }
    });
  }

  @Override
  public void stop() {
  }
}
