package com.example;


import io.vertx.core.Vertx;

/**
 * 该类只是开发环境启动使用,没有什么实际的用处
 */
public class Main {

  public static void main(String[] args) {
    Vertx vertx = Vertx.vertx();
    vertx.deployVerticle(VertxGatewayVerticle.class.getName());
  }
}
