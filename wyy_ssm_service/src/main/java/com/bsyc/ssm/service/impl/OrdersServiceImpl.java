package com.bsyc.ssm.service.impl;

import com.bsyc.ssm.dao.IOrdersDao;
import com.bsyc.ssm.domain.Orders;
import com.bsyc.ssm.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-06 10:46
 **/
@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page, int size) throws Exception {
        //参数pageNum是页面值 参数pageSize代表是每页显示条数
        PageHelper.startPage(page,size);
        return ordersDao.findAll(page, size);
    }

    @Override
    public Orders findById(String ordersId) throws Exception {
        Orders orders = ordersDao.findById(ordersId);
        return orders;
    }
}
