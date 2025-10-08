package com.yupi.yuapigateway.filter;

import com.yupi.yuapicommon.model.entity.InterfaceInfo;
import com.yupi.yuapicommon.service.InnerInterfaceInfoService;
import lombok.extern.slf4j.Slf4j;

import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 接口验证过滤器
 */
@Component
@Slf4j
@Order(1)
public class InterfaceValidationFilter implements GlobalFilter, Ordered {

    @DubboReference
    private InnerInterfaceInfoService innerInterfaceInfoService;

    private static final String INTERFACE_HOST = "http://localhost:8090";

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();

        String path = INTERFACE_HOST + request.getPath().value();
        String method = request.getMethod().toString();

        // 查询接口信息
        InterfaceInfo interfaceInfo;
        try {
            interfaceInfo = innerInterfaceInfoService.getInterfaceInfo(path, method);
        } catch (Exception e) {
            log.error("getInterfaceInfo error", e);
            return handleNoAuth(response);
        }

        if (interfaceInfo == null) {
            return handleNoAuth(response);
        }

        // 将接口ID放入exchange中，供后续过滤器使用
        exchange.getAttributes().put("interfaceInfoId", interfaceInfo.getId());
        return chain.filter(exchange);
    }

    private Mono<Void> handleNoAuth(ServerHttpResponse response) {
        response.setStatusCode(HttpStatus.FORBIDDEN);
        return response.setComplete();
    }

    @Override
    public int getOrder() {
        return 1;
    }
}