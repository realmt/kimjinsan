<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div
	{
		border: 1px solid #000000;
		width: 50%;
		margin: 0 auto;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
%>
	<div>
		<h1>���������� �Դϴ�.</h1>
	</div>
	
	<div>
		<ul>
			<li><a href="<%=request.getContextPath() %>/admin/login/adminLogin.jsp">������ �α���</a></li>
			<li><a href="<%=request.getContextPath() %>/member/login/memberLogin.jsp">ȸ�� �α���</a></li>
		</ul>
	</div>
	

</body>
</html>