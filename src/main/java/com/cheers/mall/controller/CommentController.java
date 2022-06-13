package com.cheers.mall.controller;

import com.cheers.mall.dto.CommentDTO;
import com.cheers.mall.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired private CommentService commentService;


    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> commentSave(@ModelAttribute CommentDTO commentDTO){
        commentService.commentSave(commentDTO);
        List<CommentDTO> commentDTOList=commentService.findAll(commentDTO.getItemId());
        return commentDTOList;
    }
    @GetMapping("/delete")
    public String commentDelete(@RequestParam("commentId")Long commentId, @RequestParam("commentItemId")Long commentItemId){
    commentService.commentDelete(commentId);
        return "redirect:/item/itemDetail?itemId="+commentItemId;
    }
    @PostMapping("/update")
    public String commentUpdate(@ModelAttribute CommentDTO commentDTO){
        System.out.println("CommentController.commentUpdate");
        System.out.println("commentDTO = " + commentDTO);
    commentService.commentUpdate(commentDTO);
    return "redirect:/item/itemDetail?itemId="+commentDTO.getItemId();
    }
}
