package com.yupi.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yupi.yuapicommon.model.entity.InterfaceInfo;
import com.yupi.project.model.entity.Post;

/**
* @author Netis
* @description 针对表【interface_info(接口信息)】的数据库操作Service
* @createDate 2025-09-02 16:32:18
*/
public interface InterfaceInfoService extends IService<InterfaceInfo> {

    void validInterfaceInfo(InterfaceInfo interfaceInfo, boolean add);
}
