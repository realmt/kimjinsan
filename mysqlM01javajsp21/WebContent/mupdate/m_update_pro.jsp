<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<!-- useBean : class�� import�ϰ� id="m"�� ��ü���������� �ϴ� ����,����,�Ҵ��� ���� -->
<jsp:setProperty name="m" property="*"/>
<%
	Mdao updatedao = new Mdao();	
	updatedao.mUpdate(m); 
	//<useBean id="m">���� ����,����,�Ҵ� �ϹǷ� mUpdate(m);���� ȣ�⸸ �ؼ� ��밡��.
	response.sendRedirect(request.getContextPath()+"/user/user_list.jsp");

%>