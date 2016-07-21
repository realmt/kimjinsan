<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id m_delete_pro.jsp");
Mdao deletedao = new Mdao();
deletedao.mDelete(send_id);

//호출할때는 호출하려는 메서드의 매개변수 자리에 데이터타입이 들어가면 안된다. 값을 담고 있는 변수나 값을 직접 입력도 가능
response.sendRedirect(request.getContextPath()+"/user/user_list.jsp");
%>