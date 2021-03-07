package com.bsyc.ssm.dao;

import com.bsyc.ssm.domain.Member;
import com.bsyc.ssm.domain.Orders;
import com.bsyc.ssm.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-06 10:48
 **/
public interface IOrdersDao {

    @Select("select * from orders")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId", javaType = Product.class, one = @One(select = "com.bsyc.ssm.dao.IProductDao.findById")),
    })
    public List<Orders> findAll(int page, int size) throws Exception;

    //涉及多表查询
    @Select("select * from orders where id = #{ordersId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product", column = "productId", javaType = Product.class, one = @One(select = "com.bsyc.ssm.dao.IProductDao.findById")),
            @Result(property = "member", column = "memberId", javaType = Member.class, one = @One(select = "com.bsyc.ssm.dao.IMemberDao.findById")),
            // 订单-游客是多对多的关系，要查travellers，需要拿id到中间表去查travellerId
            @Result(property = "travellers", column = "id", javaType = java.util.List.class, many = @Many(select = "com.bsyc.ssm.dao.ITravellerDao.findByOrdersId"))
    })
    public Orders findById(String ordersId) throws Exception;
}
