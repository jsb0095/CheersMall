package com.cheers.mall.controller;

import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.dto.PageDTO;
import com.cheers.mall.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @GetMapping("/saveForm")
    public String itemSaveForm(){
        return "item/itemSaveForm";
    }

    @PostMapping("/saveResult")
    public String itemSave(@ModelAttribute ItemDTO itemDTO) throws IOException {
        System.out.println("itemDTO = " + itemDTO);
        itemService.itemSave(itemDTO);
        return "member/admin";
    }


    @GetMapping("/paging")
    public String paging(@RequestParam(value="page",required = false,defaultValue = "1")int page, Model model){
    List<ItemDTO>itemDTOList=itemService.pagingList(page);
    PageDTO pageDTO=itemService.paging(page);
    model.addAttribute("itemDTOList",itemDTOList);
    model.addAttribute("paging",pageDTO);
    return "member/cheersMain";
}
    @PostMapping("/search")
    public String search(@RequestParam("q")String q,Model model){
       List<ItemDTO> itemDTOList= itemService.search(q);
       model.addAttribute("itemDTOList",itemDTOList);
    return "member/cheersMain";
    }
    @GetMapping("/itemDetail")
    public String itemDetail(@RequestParam("itemId")Long findId,Model model){
       ItemDTO itemDTO= itemService.findItemId(findId);
        System.out.println(itemDTO);
       model.addAttribute("itemDTO",itemDTO);
        return "item/itemDetail";
    }
}
