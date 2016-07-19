<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	try{
		if(resultSet.next()) {
			System.out.println("관리자 로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessioAdminId", resultSet.getString(""));
		} else {
			System.out.println("관리자 로그인 실패");
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	response.sendRedirect("");
%>
</body>
</html>