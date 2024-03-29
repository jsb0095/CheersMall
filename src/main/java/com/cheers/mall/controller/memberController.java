package com.cheers.mall.controller;

import com.cheers.mall.dto.CartDTO;
import com.cheers.mall.dto.ItemDTO;
import com.cheers.mall.dto.MemberDTO;
import com.cheers.mall.dto.OderDTO;
import com.cheers.mall.service.ItemService;
import com.cheers.mall.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class memberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private ItemService itemService;

    @GetMapping("/cheersMain")
    public String cheersMall(Model model) {
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);

        return "/member/cheersMain";
    }

    @GetMapping("/saveForm")
    public String saveForm() {
        return "member/saveForm";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO, Model model) {
        model.addAttribute("memberDTO", memberDTO);
        memberService.save(memberDTO);
        return "member/loginForm";
    }

    @GetMapping("admin")
    public String adminPage(Model model) {
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);
        return "member/admin";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession httpSession, Model model) {
        MemberDTO loginResult = memberService.login(memberDTO);
        if (loginResult != null) {
            httpSession.setAttribute("getId", loginResult.getCheersMemberId());
            httpSession.setAttribute("getMemberId", loginResult.getMemberId());
            model.addAttribute("loginResult", loginResult);
            List<ItemDTO> itemDTOList = itemService.itemList();
            model.addAttribute("itemDTOList", itemDTOList);
            if (loginResult.getMemberId().equals("admin")) {
                return "member/admin";
            }
            return "member/cheersMain";
        } else {
            return "member/loginForm";

        }
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("duplicateMemberId") String memberId) {
        String result = memberService.duplicateCheck(memberId);
        return result;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);
        session.invalidate();

        return "member/cheersMain";
    }

    @GetMapping("/myPage")
    public String myPage(@RequestParam("cheersMemberId") Long cheersMemberId, Model model) {
        List<OderDTO> oderDTOList = memberService.myPage(cheersMemberId);

        model.addAttribute("findId", oderDTOList);
        return "member/myPage";
    }

    @GetMapping("/findById")
    public void findById(@RequestParam("cheersMemberId") Long cheersMemberId) {
        memberService.findById(cheersMemberId);
    }

    @GetMapping("/updateForm")
    public String updateForm(@RequestParam("cheersMemberId") Long cheersMemberId, Model model) {
        MemberDTO memberDTO = memberService.findById(cheersMemberId);
        model.addAttribute("userData", memberDTO);
        return "member/updateForm";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean updateResult = memberService.update(memberDTO);
        if (updateResult) {
            return "redirect:/member/updateForm?cheersMemberId=" + memberDTO.getCheersMemberId();
        } else {
            return "member/updateForm";
        }

    }

    @GetMapping("/delete")
    public String delete(@RequestParam("cheersMemberId") Long cheersMemberId,Model model,HttpSession session) {
        List<ItemDTO> itemDTOList = itemService.itemList();
        model.addAttribute("itemDTOList", itemDTOList);
        session.invalidate();

        memberService.delete(cheersMemberId);
        return "member/cheersMain";
    }


    @GetMapping("/userFindAll")
    public String userFindAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.userFindAll();
        model.addAttribute("userList", memberDTOList);
        return "member/userFindAll";
    }

}