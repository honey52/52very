package com.honey52.commons;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class Db {

	// 멤버변수
	static String url = "jdbc:oracle:thin:@10.0.0.64:1521:orcl";
	static String user = "scott";
	static String pwd = "Tiger07#";
	static Connection c = null;
	static Statement s = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;

	// 정적초기화 블럭
	static {
		/* 1. jdbc 로딩 */
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("1. jdbc 로딩 예외 : " + e.getMessage());
		}
	}
	
	// 전체 페이지와 전체 리스트갯수 조회
	public static HashMap<String, String> boardCount(String sql) {
		HashMap<String, String> map = new HashMap<>();
		getConnection();
		try {
			s = c.createStatement();
			rs = s.executeQuery(sql);
			while(rs.next()) {
				map.put("ct", rs.getString("ct"));
				map.put("cp", rs.getString("cp"));
			}
			System.out.println(rs.getString("ct"));
			System.out.println(rs.getString("cp"));
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	

	// DML을 전달받아 실행시키는 메서드
	public static int executeUpdateSp(String pname) {
		// db연결
		getConnection();
		// sql 실행
		CallableStatement s = null;
		try {
			s = c.prepareCall(String.format("{CALL %s}", pname));
			// 프로시져실행
			return s.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// close
			closeConnection();
		}
		return 0;

	}

	// DML을 전달받아 실행시키는 메서드
	public static int executeUpdate(String sql) {
		// db연결
		getConnection();
		// sql 실행
		try {
			s = c.createStatement();
			return s.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// close
			closeConnection();
		}
		return 0;

	}

	// 쿼리를 전달받아 결과 listMap으로 리턴
	public static ArrayList<HashMap<String, String>> selectListMap(String sql) {
		// db연결
		getConnection();

		/* 3.2. SELECT SQL실행 */
		ResultSet rs = null;
		try {
			s = c.createStatement();
			rs = s.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("3. SQL실행 예외 : " + e.getMessage());
		}
		// ResultSet을 ArrayList화
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = null;
		try {
			while (rs.next()) {
				map = new HashMap<String, String>();
				// 열의 개수 가져오기
				ResultSetMetaData rm = rs.getMetaData();
				int c_count = rm.getColumnCount();
				for (int i = 1; i <= c_count; i++) {
					map.put(rm.getColumnName(i), rs.getString(i));
				}
				//
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println("ResultSet을 ArrayList화 예외 : " + e.getMessage());
		}
		// close
		closeConnection();
		// return
		return list;
	}
	
	
	// 쿼리를 전달받아 결과 HashMap으로 리턴
	public static HashMap<String, String> selectList(String sql) {
		// db연결
		getConnection();

		/* 3.2. SELECT SQL실행 */
		ResultSet rs = null;
		try {
			s = c.createStatement();
			rs = s.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("3. SQL실행 예외 : " + e.getMessage());
		}
		// ResultSet을 ArrayList화
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			while (rs.next()) {
				// 열의 개수 가져오기
				ResultSetMetaData rm = rs.getMetaData();
				int c_count = rm.getColumnCount();
				for (int i = 1; i <= c_count; i++) {
					map.put(rm.getColumnName(i), rs.getString(i));
				}
			}
		} catch (SQLException e) {
			System.out.println("ResultSet을 ArrayList화 예외 : " + e.getMessage());
		}
		// close
		closeConnection();
		// return
		return map;
	}
	
	
	

	// 연결메서드
	static void getConnection() {
		/* 2.연결 */
		try {
			c = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			System.out.println("2. 연결 예외 : " + e.getMessage());
		}
	}

	// 연결 종료메서드
	static void closeConnection() {
		/* 4. DB접속 마무리 */
		try {
			if (!Objects.isNull(s) && !s.isClosed()) {
				s.close();
				if (!Objects.isNull(c) && !c.isClosed()) {
					c.close();
				}
			}
		} catch (SQLException e) {
			System.out.println("4. DB접속 마무리 예외 : " + e.getMessage());
		}
	}

	
	
	// idcheck
	public static int idcheck(String sql) {
		// db연결
		getConnection();
		int result = -1;
		// sql 실행
		try {
			s = c.createStatement();
			rs = s.executeQuery(sql);
			if (rs.next()) {
				result = 1;
				c.commit();
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// close
			closeConnection();
		}
		return result;

	}
}
