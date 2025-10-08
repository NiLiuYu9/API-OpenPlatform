package com.yupi.yuapigateway.filter;

import com.yupi.yuapiclientsdk.utils.SignUtils;
import com.yupi.yuapicommon.model.entity.User;
import com.yupi.yuapicommon.service.InnerUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 用户鉴权过滤器
 */
@Component
@Slf4j
@Order(0)
public class AuthFilter implements GlobalFilter, Ordered {

    @DubboReference
    private InnerUserService innerUserService;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        HttpHeaders headers = request.getHeaders();
        ServerHttpResponse response = exchange.getResponse();

        String accessKey = headers.getFirst("accessKey");
        String nonce = headers.getFirst("nonce");
        String timestamp = headers.getFirst("timestamp");
        String sign = headers.getFirst("sign");
        String body = headers.getFirst("body");

        // 查询用户信息
        User invokeUser;
        try {
            invokeUser = innerUserService.getInvokeUser(accessKey);
        } catch (Exception e) {
            log.error("getInvokeUser error", e);
            return handleNoAuth(response);
        }

        if (invokeUser == null) {
            return handleNoAuth(response);
        }

        // 验证随机数
        if (Long.parseLong(nonce) > 10000L) {
            return handleNoAuth(response);
        }

        // 验证时间戳
        Long currentTime = System.currentTimeMillis() / 1000;
        final Long FIVE_MINUTES = 60 * 5L;
        if ((currentTime - Long.parseLong(timestamp)) >= FIVE_MINUTES) {
            return handleNoAuth(response);
        }

        // 验证签名
        String secretKey = invokeUser.getSecretKey();
        String serverSign = SignUtils.genSign(body, secretKey);
        if (sign == null || !sign.equals(serverSign)) {
            return handleNoAuth(response);
        }

        // 将用户ID放入exchange中，供后续过滤器使用
        exchange.getAttributes().put("userId", invokeUser.getId());
        return chain.filter(exchange);
    }

    private Mono<Void> handleNoAuth(ServerHttpResponse response) {
        response.setStatusCode(HttpStatus.FORBIDDEN);
        return response.setComplete();
    }

    @Override
    public int getOrder() {
        return 0;
    }
}