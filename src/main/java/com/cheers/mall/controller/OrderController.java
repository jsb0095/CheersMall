package com.cheers.mall.controller;

import com.cheers.mall.dto.OderDTO;
import com.cheers.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired private OrderService orderService;
    @PostMapping("/orderSave")
    public @ResponseBody String orderSave(@ModelAttribute OderDTO oderDTO){
       String result = orderService.orderSave(oderDTO);
        return result;
    }
    @GetMapping("/drop")
    public String orderDrop(@RequestParam("oderId")Long oderId, HttpSession httpSession){
        Long cheersMemberId=(Long)httpSession.getAttribute("getId");
        orderService.orderDrop(oderId);
        return "redirect:/member/myPage?cheersMemberId="+cheersMemberId;
    }
}
