<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<!-- useBean : class를 import하고 id="m"을 객체참조변수로 하는 선언,생성,할당을 포함 -->
<jsp:setProperty name="m" property="*"/>
<%
	Mdao updatedao = new Mdao();	
	updatedao.mUpdate(m); 
	//<useBean id="m">에서 선언,생성,할당 하므로 mUpdate(m);에서 호출만 해서 사용가능.
	response.sendRedirect(request.getContextPath()+"/user/user_list.jsp");

%>