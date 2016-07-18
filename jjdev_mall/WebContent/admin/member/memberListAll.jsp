<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table, td {
		border : 1px solid #000000;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td>No</td><td>ID</td><td>비밀번호</td><td>이름</td><td>성별</td><td>나이</td>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 //jdbc
 	 	try{
 	 	Class.forName(driver);
 	 //02	
 	 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
 	 	conn.setAutoCommit(false);
 	 //03
 	 	String sql="select * from member";
 	 	pstmt = conn.prepareStatement(sql);
 	 	 
 	 	System.out.println(pstmt);
 	 //04 
 	 	rs = pstmt.executeQuery();
 	 	while(rs.next()){%>
 	 		<tr>
 	 		<td><%=rs.getInt("member_no")%></td>
 	 		<td><%=rs.getString("member_id")%></td>
 	 		<td><%=rs.getString("member_pw")%></td>
 	 		<td><a href ="<%=request.getContextPath()%>/member/memberAddressForm.jsp?sendNo=<%=rs.getInt("member_no")%>"><%=rs.getString("member_name")%></a></td>
 	 		<td><%=rs.getString("member_sex")%></td>
 	 		<td><%=rs.getInt("member_age")%></td>	 	
 	 	<% }
 	 	

 	 	conn.commit();
 	 }catch(Exception e){
 		 conn.rollback();
 		 e.printStackTrace();
 	 }
 	
 	
%>
</table>
</body>
</html>