package com.bsyc.ssm.service;

import com.bsyc.ssm.domain.Role;
import com.bsyc.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-06 16:51
 **/
public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    List<Role> findOtherRoles(String userid) throws Exception;

    void addRoleToUser(String userId, String[] roleIds) throws Exception;
}
