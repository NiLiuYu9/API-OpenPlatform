package com.yupi.project.controller;


import com.yupi.project.annotation.AuthCheck;
import com.yupi.project.common.BaseResponse;
import com.yupi.project.common.ErrorCode;
import com.yupi.project.common.ResultUtils;
import com.yupi.project.exception.BusinessException;
import com.yupi.project.mapper.InterfaceInfoMapper;
import com.yupi.project.mapper.UserInterfaceInfoMapper;
import com.yupi.project.model.vo.InterfaceInfoVO;
import com.yupi.project.service.InterfaceInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 分析控制器
 *

 */
@RestController
@RequestMapping("/analysis")
@Slf4j
public class AnalysisController {

    @Resource
    private InterfaceInfoMapper interfaceInfoMapper;

    @Resource
    private InterfaceInfoService interfaceInfoService;

    @GetMapping("/top/interface/invoke")
    @AuthCheck(mustRole = "admin")
    public BaseResponse<List<InterfaceInfoVO>> listTopInvokeInterfaceInfo() {
        // 一次性查询所需数据，避免多次数据库交互
        List<InterfaceInfoVO> topInterfaceInfoList = interfaceInfoMapper.selectTopInvokeInterfaceInfo(3);

        if (CollectionUtils.isEmpty(topInterfaceInfoList)) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR);
        }

        return ResultUtils.success(topInterfaceInfoList);
    }
}
