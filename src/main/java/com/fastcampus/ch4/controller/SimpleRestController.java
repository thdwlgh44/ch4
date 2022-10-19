package com.fastcampus.ch4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SimpleRestController {

//    @GetMapping("/ajax")
//    public String ajax() {
//        return "ajax"; //뷰 이름
//    }

    @GetMapping("/test")
    public String test() {
        return "test"; //뷰 이름
    }
}
