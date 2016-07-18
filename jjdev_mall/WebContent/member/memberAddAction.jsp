<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_gender = request.getParameter("m_gender");
	int m_age = Integer.parseInt(request.getParameter("m_age"));
	String m_addr = request.getParameter("m_addr");
	
/* 	System.out.println("m_id : " + m_id);
	System.out.println("m_pw : " + m_pw);
	System.out.println("m_name : " + m_name);
	System.out.println("m_gender : " + m_gender);
	System.out.println("m_age : " + m_age);
	System.out.println("m_addr : " + m_addr);
 */
 //jdbc
 
 	Connection conn = null;
 	PreparedStatement pstmt1 = null;
 	PreparedStatement pstmt2 = null;
 	ResultSet rs = null;
 	int result = 0;
 	
 	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 //01
 
 try{
 	Class.forName(driver);
 //02	
 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
 	conn.setAutoCommit(false);
 //03
 	String sql="INSERT INTO member(member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
 	pstmt1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
 	
 	pstmt1.setString(1, m_id);
 	pstmt1.setString(2, m_pw);
 	pstmt1.setString(3, m_name);
 	pstmt1.setString(4, m_gender);
 	pstmt1.setInt(5, m_age);
 	System.out.println(pstmt1);
 //04 
 	result = pstmt1.executeUpdate();
 	
 	rs = pstmt1.getGeneratedKeys();
 	
 	int lastkey = 0;
 	
 	System.out.println(lastkey);
 	if(rs.next()){
 			lastkey = rs.getInt(1);
 		}
 	System.out.println("lastkey : " + lastkey);
 	System.out.println(lastkey);
 	if(result == 1){

 		String addrSql = "INSERT INTO address (member_no, member_address) VALUES (?, ?)";
 		pstmt2 = conn.prepareStatement(addrSql);
 		
 		pstmt2.setInt(1, lastkey);
 		pstmt2.setString(2, m_addr);
 		
 		pstmt2.executeUpdate();
 	}
 	conn.commit();
 }catch(Exception e){
	 conn.rollback();
	 e.printStackTrace();
 }

%>
</body>
</html>