package com.honey52.inter;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.honey52.dao.Dao;

public class Intercep implements HandlerInterceptor {
	@Autowired
	Dao dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String mb_id = request.getParameter("mb_id");
		String mb_pwd = request.getParameter("mb_pwd");  
		int idcheck = dao.idcheck(mb_id);
		if(idcheck == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디를 다시 확인해 주세요.');  location.href='/honey52/sub/test5.go';</script>");
			out.flush();
			return false;
		}
		HashMap<String, String> map = dao.loginCheck(mb_id);
		String pw = map.get("MB_PWD");
		pw = Objects.isNull(pw)|| pw == "" ? "null" : pw;
		if(mb_pwd.equals(pw) && !pw.equals("null")) {
			session.setAttribute("user_info", map);
			session.setAttribute("user_num", map.get("MB_NUM"));
			session.setAttribute("user_id", mb_id);
			session.setAttribute("orderOk", "0");
			return true;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 다시 확인해 주세요.'); location.href='/honey52/sub/test5.go';</script>");
			out.flush();
			return false;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle 실행!");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {


	}

}
