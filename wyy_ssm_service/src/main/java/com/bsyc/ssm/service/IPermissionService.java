package com.bsyc.ssm.service;

import com.bsyc.ssm.domain.Permission;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-07 09:35
 **/
public interface IPermissionService {
    List<Permission> findAll() throws Exception;

    void save(Permission permission) throws Exception;
}
