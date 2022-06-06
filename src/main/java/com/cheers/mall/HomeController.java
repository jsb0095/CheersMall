package com.cheers.mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String mainPage(){
        return "member/cheersMain";

    }
}
