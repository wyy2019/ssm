package com.bsyc.ssm.service;

import com.bsyc.ssm.domain.Product;

import java.util.List;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-05 19:21
 **/
public interface IProductService {

    //
    public List<Product> findAll() throws Exception;


    void save(Product product);
}
