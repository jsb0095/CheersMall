package com.cheers.mall.repository;

import com.cheers.mall.dto.OderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderRepository {
    @Autowired private SqlSessionTemplate sql;

    public int orderSave(OderDTO oderDTO) {
      return   sql.insert("Oder.orderSave",oderDTO);
    }
}
