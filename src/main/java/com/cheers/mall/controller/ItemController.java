package com.cheers.mall.controller;

import com.cheers.mall.dto.CartDTO;
import com.cheers.mall.dto.CommentDTO;
import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.dto.PageDTO;
import com.cheers.mall.service.CommentService;
import com.cheers.mall.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ItemService itemService;

    @GetMapping("/saveForm")
    public String itemSaveForm(){
        return "item/itemSaveForm";
    }

    @PostMapping("/saveResult")
    public String itemSave(@ModelAttribute ItemDTO itemDTO) throws IOException {
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
    public String itemDetail(@RequestParam("itemId")Long itemId,Model model){
       ItemDTO itemDTO= itemService.findItemId(itemId);
       model.addAttribute("itemDTO",itemDTO);
        List<CommentDTO> commentDTOList=commentService.findAll(itemId);
        model.addAttribute("commentList",commentDTOList);
        return "item/itemDetail";
    }
    @GetMapping("updateForm")
    public String itemUpdateForm(@RequestParam("itemId")Long itemId,Model model){
      ItemDTO itemDTO=  itemService.findItemId(itemId);
        List<ItemDTO>itemDTOList =itemService.itemList();
        model.addAttribute("itemDTOList",itemDTOList);
        model.addAttribute("updateItem",itemDTO);

        return "item/itemUpdateForm";

    }
    @PostMapping("/itemUpdate")
    public String itemUpdate(@ModelAttribute ItemDTO itemDTO,Model model) throws IOException {
        List<ItemDTO>itemDTOList =itemService.itemList();
        model.addAttribute("itemDTOList",itemDTOList);
        itemService.itemUpdate(itemDTO);
        return "redirect:/member/admin";
    }
    @GetMapping("/itemDelete")
    public String itemDelete(@RequestParam("itemId")Long itemId){
        itemService.itemDelete(itemId);
        return "redirect:/member/admin";
    }
    @GetMapping("/itemCart")
    public String saveCart(@ModelAttribute CartDTO cartDTO){
        itemService.saveCart(cartDTO);
        return "redirect:/item/itemDetail?itemId="+cartDTO.getItemId();
    }
    @PostMapping("/cartDuplicate")
    public @ResponseBody String itemDuplicate(@ModelAttribute CartDTO cartDTO){
       CartDTO result = itemService.itemDuplicate(cartDTO);
       if(result!=null) {
           return "ok";
       }else {
           return "no";
       }
    }
    @GetMapping("/cartCount")
    public String cartCount(@ModelAttribute CartDTO cartDTO){
        itemService.cartCount(cartDTO);
        return "redirect:/item/itemDetail?itemId="+cartDTO.getItemId();
    }
    @GetMapping("/cartList")
    public String cartList(@RequestParam("cheersMemberId")Long cheerMemberId, Model model){
        List<CartDTO> cartDTOList= itemService.cartFindList(cheerMemberId);
        model.addAttribute("cartDTOList",cartDTOList);
        return "item/userCart";
    }
    @PostMapping("/plus")
    public @ResponseBody boolean plus(@RequestParam("cartId")Long cartId){
       boolean result= itemService.plus(cartId);
        return result;
    }
    @PostMapping("/minus")
    public @ResponseBody boolean minus(@RequestParam("cartId")Long cartId){
     boolean result= itemService.minus(cartId);
     return  result;
    }
    @PostMapping("/cartItemDrop")
    public @ResponseBody boolean dropItem(@ModelAttribute CartDTO cartDTO){
      boolean dropResult =  itemService.dropItem(cartDTO);
        return dropResult;

    }

}
