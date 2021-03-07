package com.bsyc.ssm.dao;

import com.bsyc.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-06 14:26
 **/
public interface ITravellerDao {

    @Select("SELECT * FROM traveller WHERE id IN(SELECT travellerId FROM order_traveller WHERE orderId = #{ordersId} )")
    public List<Traveller> findByOrdersId(String ordersId) throws Exception;
}
