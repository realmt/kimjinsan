<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	System.out.println(S_NAME + "<-- S_NAME");
	System.out.println(S_LEVEL + "<-- S_LEVEL");
%>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">
		 
		       ��ܸ޴� <br><br>		 




<%
if(S_LEVEL == null){
%>
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> 04��ǰ����Ʈ </a>
<br><br>
<form action="<%= request.getContextPath() %>/login/login_pro.jsp" method="post">
	���̵� : <input type="text" name="id">
	��� : <input type="password" name="pw">

	<input type="submit" value="�α���">
</form>

<%}else{ %>
<%	if(S_LEVEL.equals("������")){ 		%>
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> 01ȸ����� </a>
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> 04��ǰ����Ʈ </a>
<%	}else if(S_LEVEL.equals("�Ǹ���")){ %>
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> 01ȸ����� </a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> 03��ǰ��� </a>
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> 04��ǰ����Ʈ </a>	
<%	}else if(S_LEVEL.equals("������")){ %>
<a href="<%= request.getContextPath() %>/user/user_insert_form.jsp"> 01ȸ����� </a>
<a href="<%= request.getContextPath() %>/user/user_list.jsp"> 02ȸ������Ʈ </a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> 03��ǰ��� </a>
<a href="<%= request.getContextPath() %>/goods/goods_list.jsp"> 04��ǰ����Ʈ </a>
<%	} %>	
<br><br>
<%= S_NAME %> �� <%= S_LEVEL %> ���� �α��� 
<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
<%} %>






































		 </div>
		 <!-- End Header -->
		 
