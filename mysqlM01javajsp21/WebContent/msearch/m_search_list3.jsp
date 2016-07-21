<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/msearch/m_search_form.jsp"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	String sv = request.getParameter("sv");
	String sk = request.getParameter("sk");
	System.out.println("sv : "+sv);
	System.out.println("sk : "+sk);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
    	String jdbcDriver = "jdbc:mysql://localhost:3306/dev21db?" +
            	"useUnicode=true&characterEncoding=euckr";
    	String dbUser = "dev21id";
    	String dbPass = "dev21pw";
    	
    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        System.out.println(conn + "<-- conn");
        System.out.println(conn.getClass() + "<-- conn.getClass()");
        //sk:컬럼명, sv:입력값
        
        if(sk == null && sv == null){
        	out.println("01 sk 널 sv 널인 조건");
        	pstmt = conn.prepareStatement("select * from tb_member");
        	
        //검색키(sk) 없다 검색값(sv) 없다 조건. 컬럼명, 입력값 둘다 입력이 안된 상황	
        }else if((sk != null && sv == null) ||(sk == null && sv != null)){
        	out.println("02 sk 값있고 sv 널인 조건");
        	pstmt = conn.prepareStatement("select * from tb_member");
        	
        //검색키(sk) 있다 검색값(sv) 없다 조건. 검색키(sk) 없다 검색값(sv) 있다 조건. 컬럼명 or 입력값 둘중에 하나만 입력된 상황        	
        }else{
        	out.println("03 sk sv 둘다 있는 조건");
        	pstmt = conn.prepareStatement("select * from tb_member where " + sk + " like ?");
        	pstmt.setString(1, "%" + sv + "%");
        	
        //검색키(sk) 있다 검색값(sv) 있다 조건. 컬럼명, 입력값 둘다 입력이 된 상황
        //select * from tb_member where m_id='id001';
        //select * from tb_member where m_pw='pw001';
        //select * from tb_member where m_level='관리자';
        //select * from tb_member where m_name='홍02';
        //select * from tb_member where m_email='email03';
        
        
        
        }
        System.out.println(pstmt + "<-- pstmt 1");
        rs = pstmt.executeQuery();
        
        out.print("<table border=1>");
        out.print("<tr>");
    	out.print("<th>아이디</th>");
    	out.print("<th>비밀번호</th>");
    	out.print("<th>권한</th>");
    	out.print("<th>이름</th>");
    	out.print("<th>이메일</th>");
    	out.print("</tr>");
    	
        while(rs.next()){
        	out.print("<tr>");
        	out.print("<td>" + rs.getString("m_id")+ "</td>");
        	out.print("<td>" + rs.getString("m_pw")+ "</td>");
        	out.print("<td>" + rs.getString("m_level")+ "</td>");
        	out.print("<td>" + rs.getString("m_name")+ "</td>");
        	out.print("<td>" + rs.getString("m_email")+ "</td>");
        	out.print("</tr>");
        }
        out.print("</table>");
    	
	}finally{
        //06단계 :statement 또는 prepareStatement객체 종료(close())
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        //07단계 :Connection 객체 종료(close())
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }	
    	
%>


