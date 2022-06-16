package com.cheers.mall.service;

import com.cheers.mall.dto.OderDTO;
import com.cheers.mall.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;


@Service
public class OrderService {
    @Autowired private OrderRepository orderRepository;

    public String orderSave(OderDTO oderDTO) {
        oderDTO.setOderInvoice(System.currentTimeMillis());
     int result =  orderRepository.orderSave(oderDTO);
        if(result>0){
            return "yes";
        }else{
            return "no";
        }
    }

    public void orderDrop(Long oderId) {
        orderRepository.orderDrop(oderId);
    }
}
