package com.honey52.ctl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.honey52.fservice.Hservice;
import com.honey52.pservice.Paging_service;

@Controller
@RequestMapping(value = "/main/test")
public class MainController {
	@Autowired
	Hservice hs;
	
	@Autowired
	Paging_service ps;
	
	@GetMapping("/main.go")
	public String goMian() {
		return "/main/test/main";
	}
	
	@GetMapping("/test.go")
	public String test(@RequestParam Map<String, String> map, String mc_code, Model m) {
		m.addAttribute("page", ps.menuPaging(map, mc_code));
		m.addAttribute("mlist", hs.menuLists(map, mc_code));
		return "/main/test/test";
	}
	
	@GetMapping("/test2.go")
	public String test2(String mn_num, String mc_code, Model m) {
		m.addAttribute("dtl", hs.detailMenu(mn_num));
		m.addAttribute("mct", hs.menuCategory(mc_code));
		m.addAttribute("rm", hs.relativeMenus(mc_code));
		return "/main/test/test2";
	}
	
	@GetMapping("/menureg.go")
	public String menureg() {
		return "/main/test/menureg";
	}
	
	@PostMapping("/menureg.go")
	public String menu(@RequestParam("mn_img") MultipartFile f, @RequestParam Map<String, String> m) {
		hs.uploadImg(f, m);
		return "/main/test/menureg";
	}
	
	@GetMapping("/test3.go")
	public String goJoinForm() {
		return "/main/test/test3";
	}
	
	@PostMapping("/test3.go")
	public String memberJoin(@RequestParam Map<String, String> map) {
		hs.memberJoin(map);
		return "redirect:/main/test/test.go";
	}
	
	@GetMapping("/test6.go")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main/test/test.go";
	}
	
	@GetMapping("/test7.go")
	public void addcart(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		ArrayList<Map<String, String>> cart = 
				(ArrayList<Map<String, String>>) (session.getAttribute("cart")); 
		if(session.getAttribute("cart") == null) {
			cart = new ArrayList<Map<String, String>>();
		}
		cart.add(map);
		session.setAttribute("cart", cart);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>history.back();</script>");
		out.flush();
	}
	
	@GetMapping("/test8.go")
	public String goOrderForm() {
		return "/main/test/test4";
	}
	
	@GetMapping("/test9.go")
	public String removeOrder(HttpServletRequest request) {
		String index = request.getParameter("index");  
		if(index != null) {
		HttpSession session = request.getSession();
		ArrayList<Map<String, String>> cart = 
				(ArrayList<Map<String, String>>) (session.getAttribute("cart"));
		int in_num = Integer.parseInt(index);
		cart.remove(in_num);
		}
		return "redirect:/main/test/test8.go";
	}	
	
	@PostMapping("/test8.go")
	public String addOrder(@RequestParam Map<String, String> map, HttpServletRequest request) {
		hs.makeOrder(map, request);
		System.out.println(map.get("mb_num"));
		System.out.println(map.get("ot_menu"));
		HttpSession session = request.getSession();
		session.removeAttribute("cart");
		session.setAttribute("orderOk", "1");
		return "redirect:/main/test/test10.go";
	}
	
	@GetMapping("/test10.go")
	public String orderList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String orderOk = (String) session.getAttribute("orderOk");
		String mb_num = (String) session.getAttribute("user_num");
		if(orderOk.equals("0") || orderOk == "0") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('주문이력이 없습니다.'); history.back();</script>");
			out.flush();
			return null;
		} else {
			hs.getOrder(mb_num, request);
			return "/main/test/test5";	
		}
	}
	
	@GetMapping("/test11.go")
	public String goMemberPage(Model m, @RequestParam Map<String, String> map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mb_num = (String) session.getAttribute("user_num");
		m.addAttribute("orderlist", hs.getOrderList(map, mb_num));
		m.addAttribute("page", ps.ordersPaging(map, mb_num));
		return "/main/test/test6";
	}
	
	@PostMapping("/test11.go")
	public String updateMember(@RequestParam Map<String, String> map, HttpServletRequest request) {
		hs.updateMember(map, request);
		return "redirect:/main/test/test11.go";
	}
	
	@GetMapping("/orders.go")
	public String orderList(Model m, @RequestParam Map<String, String> map) {
		m.addAttribute("orderlist", hs.getOrderLists(map));
		m.addAttribute("page", ps.orderListPaging(map));
		return "/main/test/orders";
	}
	
	@PostMapping("/orders.go")
	public String orderUpdate(Model m, @RequestParam Map<String, String> map) {
		System.out.println(map);
		hs.updateOrder(map);
		return "redirect:/main/test/orders.go";
	}
}
