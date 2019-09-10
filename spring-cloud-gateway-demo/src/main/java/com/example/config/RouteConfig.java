package com.example.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.cloud.gateway.config.GatewayAutoConfiguration;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@AutoConfigureAfter(GatewayAutoConfiguration.class)
public class RouteConfig {

  @Value("${info.app.host}")
  private String host;

  @Value("${info.app.port}")
  private Integer port;


  @Bean
  RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
    String uri = "http://" + host + ":" + port;

    return builder.routes()
        .route("",
            r -> r.path("/proxy/demo")
                .filters(f -> f.stripPrefix(1))
                .uri(uri))
        .build();
  }
}


