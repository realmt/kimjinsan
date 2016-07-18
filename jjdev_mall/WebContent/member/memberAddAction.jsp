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
	
/* 	System.out.println("m_id : " + m_id);
	System.out.println("m_pw : " + m_pw);
	System.out.println("m_name : " + m_name);
	System.out.println("m_gender : " + m_gender);
	System.out.println("m_age : " + m_age);
 */
 //jdbc
 
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	
 	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 //01
 	Class.forName(driver);
 //02	
 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
 //03
 	String sql=
 	"INSERT INTO member (member_id, member_pw, member_name, member_sex, member_age) VALUES (?, ?, ?, ?, ?)";
 	pstmt = conn.prepareStatement(sql);
 	
 	pstmt.setString(1, m_id);
 	pstmt.setString(2, m_pw);
 	pstmt.setString(3, m_name);
 	pstmt.setString(4, m_gender);
 	pstmt.setInt(5, m_age);
 //04 
 	pstmt.executeUpdate();

%>
</body>
</html>