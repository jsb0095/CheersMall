package com.cheers.mall;

import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private ItemService itemService;
    @GetMapping("/")
    public String mainPage(Model model){
        List<ItemDTO> itemDTOList =itemService.itemList();
        model.addAttribute("itemDTOList",itemDTOList);
        return "member/cheersMain";

    }
}
