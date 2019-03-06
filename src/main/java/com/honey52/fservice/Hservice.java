package com.honey52.fservice;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.honey52.dao.Dao;

@Service
public class Hservice {

	@Autowired
	String upath;
	
	@Autowired
	Dao dao;
	
	// 파일(이미지)업로드처리
	public Map<String,String> uploadImg(MultipartFile f, Map<String, String> m) {
		// 정보출력
		System.out.printf("이미지이름 : %s", f.getOriginalFilename());	
		
		// 초기
		UUID uid = UUID.randomUUID();	// 랜덤아이디 생성
		String oname = f.getOriginalFilename();
		String fname = uid.toString() + "_" + oname;	// 유일한 이름

		// 리턴 맵
		 Map<String, String> finfos = new HashMap<String, String>(){{ put("oname",
		 oname); put("fname", fname); }};
		
		// DB에 이미지이름 저장
		dao.insertImg(fname, m);
		
		// 파일처리
		File file = new File(upath, fname);
		try {
			FileCopyUtils.copy(f.getBytes(), file);
			return finfos;
		} catch (Exception e) {
			return null;
		}
	}
	
	// menulist
	public ArrayList<HashMap<String, String>> menuLists(Map<String, String> map, String mc_code){
		return dao.selectMenus(map, mc_code);
	}
	
	// 관련 메뉴
	public ArrayList<HashMap<String, String>> relativeMenus(String mc_code){
		return dao.relativeMenu(mc_code);
	}
	
	public HashMap<String, String> detailMenu(String mn_num) {
		return dao.selectMenu(mn_num);
	}
	
	public HashMap<String, String> menuCategory(String mc_code) {
		return dao.selectCode(mc_code);
	}
	
	public int idcheck(String mb_id) {
		return dao.idcheck(mb_id);
	}
	
	public void memberJoin(Map<String, String> map) {
		dao.insertMember(map);
	}
	
	public void updateMember(Map<String, String> map, HttpServletRequest request) {
		dao.updateMember(map);
		HttpSession session = request.getSession();
		session.setAttribute("user_info", dao.loginCheck(map.get("mb_id")));
	}
	
	public void makeOrder(Map<String, String> map, HttpServletRequest request) {
		String lst_s_n = dao.makeOrder(map);
		dao.insertOrderDetail(request, lst_s_n);
	}
	
	// 최근 주문 내역 가져오기
	public void getOrder(String mb_num, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("oList", dao.getOrder(mb_num));
		String ot_num = dao.getOrder(mb_num).get("OT_NUM");
		session.setAttribute("odList", dao.getOrderDetail(ot_num));
	}
	
	// 주문 번호로 영수증 가져오기
	public HashMap<String, String> getReceipt(String ot_num) {
		return dao.getReceipt(ot_num);
	}
	
	// 주문 번호로 영수증세부내용 가져오기
	public ArrayList<HashMap<String, String>> getReceiptDetail(String ot_num) {
		return dao.getOrderDetail(ot_num);
	}
	
	// 전체 주문 가져오기
	public ArrayList<HashMap<String, String>> getOrderLists(Map<String, String> map) {
		return dao.getOrderLists(map);
	}
	
	// 회원의 전체 주문 가져오기
	public ArrayList<HashMap<String, String>> getOrderList(Map<String, String> map, String mb_num) {
		return dao.getOrderList(map, mb_num);
	}
	
	public void updateOrder(Map<String, String> map) {
		for(int i = 0; i < 10; i++) {
			System.out.println(map.get("pm_code"+i));
			dao.updateOrder(map.get("pm_code"+i), map.get("ps_code"+i), map.get("ost_code"+i), map.get("ot_num"+i));
		}
	}

}
