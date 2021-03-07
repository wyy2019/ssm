package com.bsyc.ssm.dao;

import com.bsyc.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-06 14:19
 **/
public interface IMemberDao {

    @Select("select * from member where id = #{id}")
    public Member findById(String id) throws Exception;
}
