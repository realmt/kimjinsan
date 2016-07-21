package kr.or.ksmart.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;
//회원관리위한 클래스
public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//03 삭제처리 메서드 선언
	public void mDelete(String mid) throws SQLException, ClassNotFoundException{
		System.out.println("03 mDelete Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"DELETE FROM tb_member WHERE m_id=?");
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//02 수정처리 메서드 선언
	public void mUpdate(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("02 mUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_level());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_id());
		
		System.out.println(pstmt + "<-- pstmt 2");
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	//01_02 회원등록 메서드 선언
	public void mInsert(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("01_02 mInsert Mdao.java");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());	
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt mInsert Mdao.java");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//01_01 회원등록(드라이버로딩과 DB연결 후) 메서드 선언

	public void mInsert(Member m, Connection conn) throws SQLException{
		//3단계 쿼리실행준비부터 시작
		System.out.println("01_01 mInsert Mdao.java");
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());	
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt mInsert Mdao.java");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}	
}
