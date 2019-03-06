package com.honey52.pservice;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honey52.dao.Dao;

@Service
public class Paging_service {
	// dao
	@Autowired
	Dao dao;
	// 메뉴 페이징
	public HashMap<String, String> menuPaging(Map<String, String> map, String mc_code) {
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		String code = mc_code;
		
		if(mc_code == "" || Objects.isNull(mc_code)) {
			code = "0";
		} else {
			code = mc_code;
		}
		
		if(bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "6";
		} else {
			bEanum = map.get("bEa");
		}
		
		if(pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";	
		} else {
			pgnum = map.get("pg");
		}
		
		HashMap<String, String> page = dao.boardCount(bEanum, code);
		String entbcnt = page.get("ct");
		String lstbnum = page.get("cp");
		int pgN = Integer.parseInt(pgnum);
		
		int stn = ((pgN-1)/10)*10 + 1;
		int endn = stn + 10 - 1;
		
		HashMap<String, String> paging = new HashMap<String, String>();
		
		paging.put("mc_code", code);
		paging.put("pg", pgnum);
		paging.put("bEa", bEanum);
		paging.put("stn", Integer.toString(stn));
		paging.put("endn", Integer.toString(endn));
		paging.put("entbcnt", entbcnt);
		paging.put("lstbnum", lstbnum);
		
		return paging; 
	}
	

	// 주문이력 페이징
	public HashMap<String, String> ordersPaging(Map<String, String> map, String mb_num) {
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		
		if(bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "5";
		} else {
			bEanum = map.get("bEa");
		}
		
		if(pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";	
		} else {
			pgnum = map.get("pg");
		}
		
		HashMap<String, String> page = dao.odsCount(mb_num);
		String entbcnt = page.get("ct");
		String lstbnum = page.get("cp");
		int pgN = Integer.parseInt(pgnum);
		
		int stn = ((pgN-1)/10)*10 + 1;
		int endn = stn + 10 - 1;
		
		HashMap<String, String> paging = new HashMap<String, String>();
		
		paging.put("pg", pgnum);
		paging.put("bEa", bEanum);
		paging.put("stn", Integer.toString(stn));
		paging.put("endn", Integer.toString(endn));
		paging.put("entbcnt", entbcnt);
		paging.put("lstbnum", lstbnum);
		
		return paging; 
	}
	
	// 주문리스트 페이징
	public HashMap<String, String> orderListPaging(Map<String, String> map) {
		String pgnum = map.get("pg");
		String bEanum = map.get("bEa");
		
		if(bEanum == "" || Objects.isNull(bEanum)) {
			bEanum = "10";
		} else {
			bEanum = map.get("bEa");
		}
		
		if(pgnum == "" || Objects.isNull(pgnum)) {
			pgnum = "1";	
		} else {
			pgnum = map.get("pg");
		}
		
		HashMap<String, String> page = dao.odListCount();
		String entbcnt = page.get("ct");
		String lstbnum = page.get("cp");
		int pgN = Integer.parseInt(pgnum);
		
		int stn = ((pgN-1)/10)*10 + 1;
		int endn = stn + 10 - 1;
		
		HashMap<String, String> paging = new HashMap<String, String>();
		
		paging.put("pg", pgnum);
		paging.put("bEa", bEanum);
		paging.put("stn", Integer.toString(stn));
		paging.put("endn", Integer.toString(endn));
		paging.put("entbcnt", entbcnt);
		paging.put("lstbnum", lstbnum);
		
		return paging; 
	}


	
	
}
