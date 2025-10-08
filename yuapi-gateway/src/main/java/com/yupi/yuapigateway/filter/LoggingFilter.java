package com.yupi.yuapigateway.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 请求日志过滤器
 */
@Component
@Slf4j
@Order(-2) // 优先级最高，最先执行
public class LoggingFilter implements GlobalFilter, Ordered {

    private static final String INTERFACE_HOST = "http://localhost:8123";

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        String path = INTERFACE_HOST + request.getPath().value();
        String method = request.getMethod().toString();

        log.info("请求唯一标识：{}", request.getId());
        log.info("请求路径：{}", path);
        log.info("请求方法：{}", method);
        log.info("请求参数：{}", request.getQueryParams());
        log.info("请求来源地址：{}", request.getRemoteAddress());

        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return -2;
    }
}