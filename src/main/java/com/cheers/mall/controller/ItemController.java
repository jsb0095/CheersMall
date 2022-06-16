package com.cheers.mall.controller;

import com.cheers.mall.dto.*;
import com.cheers.mall.service.CommentService;
import com.cheers.mall.service.ItemService;
import com.cheers.mall.service.MemberService;
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
    private MemberService memberService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ItemService itemService;

    @GetMapping("/saveForm")
    public String itemSaveForm() {
        return "item/itemSaveForm";
    }

    @PostMapping("/saveResult")
    public String itemSave(@ModelAttribute ItemDTO itemDTO) throws IOException {
        itemService.itemSave(itemDTO);
        return "redirect:/member/admin";
    }


    @GetMapping("/paging")
    public String bestPaging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<ItemDTO> itemDTOList = itemService.bestPagingList(page);
        PageDTO pageDTO = itemService.bestPaging(page);
        System.out.println(itemDTOList);
        System.out.println(pageDTO);
        model.addAttribute("itemDTOList", itemDTOList);
        model.addAttribute("paging", pageDTO);
        return "item/pagingList";
    }

    @PostMapping("/search")
    public String search(@RequestParam("q") String q, Model model) {
        List<ItemDTO> itemDTOList = itemService.search(q);
        model.addAttribute("itemDTOList", itemDTOList);
        return "member/cheersMain";
    }

    @GetMapping("/itemDetail")
    public String itemDetail(@RequestParam("itemId") Long itemId, Model model) {
        ItemDTO itemDTO = itemService.findItemId(itemId);
        model.addAttribute("itemDTO", itemDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(itemId);
        model.addAttribute("commentList", commentDTOList);
        return "item/itemDetail";
    }

    @GetMapping("updateForm")
    public String itemUpdateForm(@RequestParam("itemId") Long itemId, Model model) {
        ItemDTO itemDTO = itemService.findItemId(itemId);
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);
        model.addAttribute("updateItem", itemDTO);

        return "item/itemUpdateForm";

    }

    @PostMapping("/itemUpdate")
    public String itemUpdate(@ModelAttribute ItemDTO itemDTO, Model model) throws IOException {
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);
        itemService.itemUpdate(itemDTO);
        return "redirect:/member/admin";
    }

    @GetMapping("/itemDelete")
    public String itemDelete(@RequestParam("itemId") Long itemId) {
        itemService.itemDelete(itemId);
        return "redirect:/member/admin";
    }

    @GetMapping("/itemCart")
    public String saveCart(@ModelAttribute CartDTO cartDTO) {
        itemService.saveCart(cartDTO);
        return "redirect:/item/itemDetail?itemId=" + cartDTO.getItemId();
    }

    @PostMapping("/cartDuplicate")
    public @ResponseBody String itemDuplicate(@ModelAttribute CartDTO cartDTO) {
        CartDTO result = itemService.itemDuplicate(cartDTO);
        if (result != null) {
            return "ok";
        } else {
            return "no";
        }
    }

    @GetMapping("/cartCount")
    public String cartCount(@ModelAttribute CartDTO cartDTO) {
        itemService.cartCount(cartDTO);
        return "redirect:/item/itemDetail?itemId=" + cartDTO.getItemId();
    }

    @GetMapping("/cartList")
    public String cartList(@RequestParam("cheersMemberId") Long cheerMemberId, Model model) {
        List<CartDTO> cartDTOList = itemService.cartFindList(cheerMemberId);
        model.addAttribute("cartDTOList", cartDTOList);
        return "item/userCart";
    }

    @PostMapping("/plus")
    public @ResponseBody boolean plus(@RequestParam("cartId") Long cartId) {
        boolean result = itemService.plus(cartId);
        return result;
    }

    @PostMapping("/minus")
    public @ResponseBody boolean minus(@RequestParam("cartId") Long cartId) {
        boolean result = itemService.minus(cartId);
        return result;
    }

    @PostMapping("/cartItemDrop")
    public @ResponseBody boolean dropItem(@ModelAttribute CartDTO cartDTO) {
        boolean dropResult = itemService.dropItem(cartDTO);

        return dropResult;

    }

    @GetMapping("/ranking")
    public String rakingPage(Model model) {
        List<ItemDTO> rankingList = itemService.itemRankingList();
        model.addAttribute("rankinList", rankingList);
        return "item/rankingList";
    }

    @GetMapping("/rank")
    public String rankingAdd(@ModelAttribute ItemDTO itemDTO) {

        itemService.rankingAdd(itemDTO);

        return "redirect:/item/ranking";
    }
    @GetMapping("/kkoPay")
    public String kkoPay(@RequestParam("cheersMemberId")Long cheersMemberId,@RequestParam("cartId")Long cartId,Model model){
    MemberDTO memberDTO= memberService.findById(cheersMemberId);
    CartDTO cartDTO= itemService.findByCartId(cartId);
    model.addAttribute("memberDTO",memberDTO);
    model.addAttribute("cartDTO",cartDTO);

    return "member/kkoPay";
    }
    @GetMapping ("/simpleBuy")
    public String simpleBuy(@RequestParam("itemId")Long itemId){
        itemService.simpleBuy(itemId);
        return "redirect:/item/itemDetail?itemId="+itemId;
    }
    @PostMapping("/kkoPayCount")
    public @ResponseBody String kkoPayCount(@ModelAttribute CartDTO cartDTO){
       String result = itemService.kkoPayCount(cartDTO);
        return result;
    }
}
