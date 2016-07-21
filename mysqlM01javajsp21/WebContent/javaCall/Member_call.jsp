<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
Member m = new Member();
m.setM_id("id001");
m.setM_pw("pw001");
m.setM_level("관리자");
m.setM_name("홍길동");
m.setM_email("email01");
%>