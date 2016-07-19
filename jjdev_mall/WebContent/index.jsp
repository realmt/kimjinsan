<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>INDEX</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessioMemberId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form action="<%=request.getContextPath()%>/member/loginAction.jsp">
			<!-- 로그인 폼 구현 -->
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=sessionMemberId%>님 반갑습니다.<a href="">[회원정보]</a><a href="">[로그아웃]</a>
<%		
	}
%>
</body>
</html>