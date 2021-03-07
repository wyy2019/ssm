package com.bsyc.ssm.service;

import com.bsyc.ssm.domain.SysLog;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-07 20:13
 **/
public interface ISysLogService {

    public void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;
}
