package com.honey52.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.honey52.commons.Db;

@Component
public class Dao {

	// count
	public HashMap<String, String> boardCount(String bEanum, String mc_code) {
		String sql = String.format("SELECT COUNT(*) ct, CEIL(COUNT(*)/%s) cp FROM v_sd_menu_%s", bEanum, mc_code);
		return Db.boardCount(sql);
	}

	// 메뉴 INSERT
	public void insertImg(String mn_img, Map<String, String> m) {
		String sql = String.format("insert into sd_menu "
				+ "values(SQ_SD_MN.NEXTVAL, %s, '%s', '%s', '%s', '%s', '%s', '%s', %s, %s, '%s', %s, %s, %s, %s, %s, %s, %s, %s)",
				m.get("mc_code"), mn_img, m.get("mn_title"), m.get("mn_description"), m.get("mn_origin1"),
				m.get("mn_origin2"), m.get("mn_origin3"), m.get("mn_kcal"), m.get("mn_cost"), m.get("mn_allergy"),
				m.get("mn_gram"), m.get("mn_pro"), m.get("mn_proper"), m.get("mn_na"), m.get("mn_naper"),
				m.get("mn_su"), m.get("mn_fat"), m.get("mn_fatper"));
		Db.executeUpdate(sql);
	}

	// 메뉴 LIST
	public ArrayList<HashMap<String, String>> selectMenus(Map<String, String> map, String mc_code) {
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		String code = mc_code;
		if (bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "6";
		} else {
			bEanum = map.get("bEa");
		}
		
		if (code == "" || Objects.isNull(code)) {
			code = "1";
		} else {
			code = mc_code;
		}

		if (pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";
		} else {	
			pgnum = map.get("pg");
		}
		String sql = String.format("SELECT * FROM v_sd_menu_%s WHERE F_PAGETEST(R, %s, %s) = 1", code, pgnum, bEanum);
		return Db.selectListMap(sql);
	}


	public HashMap<String, String> selectMenu(String mn_num) {
		String sql = String.format("SELECT * FROM sd_menu WHERE mn_num = %s", mn_num);
		return Db.selectList(sql);
	}
	
	public HashMap<String, String> selectCode(String mc_code) {
		String sql = String.format("SELECT * FROM sd_menu_code WHERE mc_code = %s", mc_code);
		return Db.selectList(sql);
	}

	
	// 관련 메뉴 선택
	public ArrayList<HashMap<String, String>> relativeMenu(String mc_code) {
		String sql = String.format("SELECT * FROM sd_menu WHERE mc_code = %s", mc_code);
		return Db.selectListMap(sql);

	}
	
	// 아이디check
	public int idcheck(String mb_id) {
		String sql = String.format("SELECT mb_id FROM sd_member WHERE mb_id = '%s'", mb_id);
		return Db.idcheck(sql);
	}
	
	// 회원가입
	public void insertMember(Map<String, String> map) {
		String mb_tel = map.get("tel1") + "-" + map.get("tel2") + "-" + map.get("tel3");
		String mb_email = map.get("e_f") + "@" + map.get("e_b");
		String mb_birth = map.get("mb_birth").replace("-", "");
		String sql = String.format("insert into sd_member values(SQ_SD_MB.NEXTVAL, "
				+ "'%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",
				map.get("mb_name"),
				map.get("mb_gender"),
				mb_birth,
				map.get("mb_id"),
				map.get("mb_pwd"),
				mb_email,
				map.get("mb_eopen"),
				map.get("mb_adok"),
				mb_tel,
				map.get("mb_zipno"),
				map.get("mb_rap1"),
				map.get("mb_adt"),
				map.get("mb_rap2")
				);
		Db.executeUpdate(sql);
	}
	
	// login check
	public HashMap<String, String> loginCheck(String mb_id) {
		String sql = String.format("SELECT * FROM sd_member WHERE mb_id = '%s'", mb_id);
		return Db.selectList(sql);
	}
	
	// 회원 업데이트
	public void updateMember(Map<String, String> map) {
		String mb_tel = map.get("tel1") + "-" + map.get("tel2") + "-" + map.get("tel3");
		String mb_email = map.get("e_f") + "@" + map.get("e_b");
		String sql = String.format("UPDATE sd_member set "
				+ "mb_pwd = '%s', mb_email = '%s', mb_eopen = '%s', mb_adok = '%s', mb_tel = '%s',"
				+ "mb_zipno = '%s', mb_rap1 = '%s', mb_rap2 = '%s', mb_adt = '%s' where mb_num = %s",
				map.get("mb_pwd"),
				mb_email,
				map.get("mb_eopen"),
				map.get("mb_adok"),
				mb_tel,
				map.get("mb_zipno"),
				map.get("mb_rap1"),
				map.get("mb_rap2"),
				map.get("mb_adt"),
				map.get("mb_num")
				);
		Db.executeUpdate(sql);
	}
	
	
	
	// 주문 접수 번호 생성
	public String makeOrder(Map<String, String> map) {
		String ot_tel = map.get("tel1") + "-" + map.get("tel2") + "-" + map.get("tel3");
		String sql = String.format("insert into SD_ORDERTOTAL "
				+ "(ot_num, mb_num, ot_price, ot_tel, ot_zipno, ot_rap1, ot_adt, ot_rap2, ot_require, pm_code, ot_menu)"
				+ " values(SQ_SD_OT.NEXTVAL, %s, %s, '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s')",
				map.get("mb_num"),
				map.get("ot_price"),
				ot_tel,
				map.get("mb_zipno"),
				map.get("mb_rap1"),
				map.get("mb_adt"),
				map.get("mb_rap2"),
				map.get("ot_require"),
				map.get("pm_code"),
				map.get("ot_menu")
				);
		Db.executeUpdate(sql);
		
		HashMap<String, String> m = Db.selectList("select LAST_NUMBER lt from user_sequences where SEQUENCE_NAME = 'SQ_SD_OT'");
		String lst_sq = m.get("LT");
		return lst_sq;
	}
	
	
	// 상세 주문 내역 입력
	public void insertOrderDetail(HttpServletRequest request, String lst_sq) {
		HttpSession session = request.getSession();
		String lst_sq_num = ""+(Integer.parseInt(lst_sq) - 1);
		ArrayList<Map<String, String>> cart = 
				(ArrayList<Map<String, String>>) (session.getAttribute("cart"));
		for(Map<String, String> m : cart) {
		String sql = String.format("insert into SD_ORDERDETAIL values"
				+ "(SQ_SD_OD.NEXTVAL, %s, %s, %s, %s)",
				lst_sq_num,
				m.get("menu_num"),
				m.get("count"),
				m.get("cost")
				);
		Db.executeUpdate(sql);
		};
	}
	
	// 최근 주문 받아오기
	public HashMap<String, String> getOrder(String mb_num) {
		String sql = String.format("SELECT * FROM RECENT_ORDER WHERE MB_NUM = %s and rownum = 1", mb_num);
		return Db.selectList(sql);
	}
	
	// 최근 주문 상세내역 받아오기
	public ArrayList<HashMap<String, String>> getOrderDetail(String ot_num) {
		String sql = String.format("SELECT * FROM RECENT_ORDER_DT WHERE OT_NUM = %s", ot_num);
		return Db.selectListMap(sql);
	}

	
	// 주문번호로 주문이력 조회
	public HashMap<String, String> getReceipt(String ot_num) {
		String sql = String.format("SELECT * FROM RECENT_ORDER WHERE ot_num = %s", ot_num);
		return Db.selectList(sql);
	}
	
	// 회원 번호로 전체 주문 이력 조회
	public ArrayList<HashMap<String, String>> getOrderList(Map<String, String> map, String mb_num) {
		
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		if (bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "5";
		} else {
			bEanum = map.get("bEa");
		}
		if (pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";
		} else {	
			pgnum = map.get("pg");
		}
		String sql = String.format("SELECT * FROM (SELECT ROWNUM R, P.*" + 
				" FROM (SELECT * FROM RECENT_ORDER WHERE MB_NUM = %s) P)"
				+ "WHERE F_PAGETEST(R, %s, %s) = 1", mb_num, pgnum, bEanum);
		return Db.selectListMap(sql);
	}
	
	// 주문리스트 조회
	public ArrayList<HashMap<String, String>> getOrderLists(Map<String, String> map) {
		
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		if (bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "10";
		} else {
			bEanum = map.get("bEa");
		}
		if (pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";
		} else {	
			pgnum = map.get("pg");
		}
		String sql = String.format("SELECT * FROM V_RECENT_ORDER WHERE F_PAGETEST(R, %s, %s) = 1", pgnum, bEanum);
		return Db.selectListMap(sql);
	}
	
	
	// 주문리스트 페이지 카운드
	public HashMap<String, String> odListCount() {
		return Db.boardCount("SELECT COUNT(*) ct, CEIL(COUNT(*)/10) cp FROM RECENT_ORDER");
	}
	
	// 주문내역 카운드
	public HashMap<String, String> odsCount(String mb_num) {
	String sql = String.format("SELECT COUNT(*) ct, CEIL(COUNT(*)/5) cp FROM RECENT_ORDER WHERE MB_NUM = %s", mb_num);
	return Db.boardCount(sql);
	}
	
	// 주문리스트 수정
	public void updateOrder(String pm_code, String ps_code, String ost_code, String ot_num) {
		String sql = String.format("update sd_ordertotal set pm_code = %s, ps_code = %s, ost_code = %s where ot_num = %s"
				, pm_code, ps_code, ost_code, ot_num);
		Db.executeUpdate(sql);
	}
	
}
