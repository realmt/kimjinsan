<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionMemberId = (String)session.getAttribute("sessioAdminId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp">
			<!-- 로그인 폼 구현 -->
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<ol>
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a>
			<li><a href="">상품관리</a></li>
			<li><a href="">주문관리</a></li>
			<li><a href="">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>