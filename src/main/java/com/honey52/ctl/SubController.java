package com.honey52.ctl;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.honey52.fservice.Hservice;

@Controller
@RequestMapping(value = "/sub")
public class SubController {
	@Autowired
	Hservice hs;
	
	@GetMapping("/test4.go")
	public String checkId(String mb_id, Model m) {
		m.addAttribute("mb_id", mb_id);
		m.addAttribute("result", hs.idcheck(mb_id));
		return "/sub/idcheck";
	}
	
	@GetMapping("/test5.go")
	public String loginPop() {
		return "/sub/loginform";
	}
	
	@GetMapping("/test8.go")
	public String goCart() {
		return "/sub/cart";
	}
	
	@GetMapping("/test9.go")
	public String delCart(@RequestParam String index, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<Map<String, String>> cart = 
				(ArrayList<Map<String, String>>) (session.getAttribute("cart"));
		int in_num = Integer.parseInt(index);
		cart.remove(in_num);
		return "redirect:/sub/test8.go";
	}
	
	@GetMapping("/test10.go")
	public String goReceipt(@RequestParam String ot_num, Model m) {
		m.addAttribute("rct", hs.getReceipt(ot_num));
		m.addAttribute("rctd", hs.getReceiptDetail(ot_num));
		return "/sub/receipt";
	}
}
