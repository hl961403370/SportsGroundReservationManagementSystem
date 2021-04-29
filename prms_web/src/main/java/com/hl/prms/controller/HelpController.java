package com.hl.prms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("helpController")
@RequestMapping("/help")
public class HelpController {

    @RequestMapping(value = "/systemIntroduction")
    public String showSystemIntroduction(){
        return "help_systemIntroduction";
    }

    @RequestMapping(value = "/introductionAndUse")
    public String showIntroductionAndUse(){
        return "help_introductionAndUse";
    }

    @RequestMapping(value = "/commonProblem")
    public String showCommonProblem(){
        return "help_commonProblem";
    }
}
