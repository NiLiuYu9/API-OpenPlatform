package com.yupi.yuapigateway.filter;

import com.yupi.yuapicommon.service.InnerUserInterfaceInfoService;
import lombok.extern.slf4j.Slf4j;

import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 响应处理过滤器 - 使用 .then() 方法
 * 负责记录响应日志和调用次数统计
 */
@Slf4j
@Component
public class ResponseProcessingFilter implements GlobalFilter, Ordered {

    @DubboReference
    private InnerUserInterfaceInfoService innerUserInterfaceInfoService;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        // 从exchange属性中获取之前过滤器存储的数据
        Long userId = (Long) exchange.getAttributes().get("userId");
        Long interfaceInfoId = (Long) exchange.getAttributes().get("interfaceInfoId");

        // 如果鉴权或接口验证失败，直接继续处理
        if (userId == null || interfaceInfoId == null) {
            return chain.filter(exchange);
        }

        // 记录请求开始时间（可选，用于计算耗时）
        long startTime = System.currentTimeMillis();
        exchange.getAttributes().put("startTime", startTime);

        // 继续执行过滤器链，并在响应完成后执行后续操作
        return chain.filter(exchange).then(Mono.fromRunnable(() -> {
            // 获取响应信息
            HttpStatus statusCode = exchange.getResponse().getStatusCode();
            
            // 计算请求耗时（可选）
            long duration = System.currentTimeMillis() - startTime;
            
            // 记录响应日志
            log.info("响应状态码: {}, 处理耗时: {}ms", statusCode, duration);
            
            // 如果响应成功，调用次数 +1
            if (statusCode == HttpStatus.OK) {
                try {
                    innerUserInterfaceInfoService.invokeCount(interfaceInfoId, userId);
                    log.info("接口调用次数统计成功, 接口ID: {}, 用户ID: {}", interfaceInfoId, userId);
                } catch (Exception e) {
                    log.error("调用次数统计失败: {}", e.getMessage());
                    // 这里可以根据需要决定是否抛出异常或进行其他处理
                }
            } else {
                log.warn("响应状态非200，不统计调用次数。状态码: {}", statusCode);
            }
        }));
    }

    @Override
    public int getOrder() {
        // 此过滤器应该在主要处理之后执行，顺序号较大
        return Ordered.LOWEST_PRECEDENCE;
    }
}