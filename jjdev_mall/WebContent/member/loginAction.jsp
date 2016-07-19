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
		
	} catch (Exception e) {
		if(resultSet.next()) {
			System.out.println("로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessiMemberId", resultSet.getString(""));
		} else {
			System.out.println("로그인 실패");
		}
	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 index.jsp로 이동
	response.sendRedirect("");
%>
</body>
</html>