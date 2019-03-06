package com.honey52.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member")
public class LoginController {

	@PostMapping("/test5.go")
	public String login(){
		return "/sub/loginform";
	}
	
}
