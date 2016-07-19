<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	<%
	
	request.setCharacterEncoding("utf-8");
	
	String sessionMemberNo = (String)session.getAttribute("sessionMemberNo");
	int itemNo = Integer.parseInt(request.getParameter("itemNo"));
	double ordersRate = Double.parseDouble(request.getParameter("itemRate"));
	int ordersQuantity = Integer.parseInt(request.getParameter("ordersQuantity"));

	System.out.println(sessionMemberNo + "<--sessionMemberNo");
	System.out.println(itemNo + "<--itemNo");
	System.out.println(ordersRate + "<--ordersRate");
	System.out.println(ordersQuantity + "<--ordersQuantity");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/jjdevmall?" +
			"useUnicode=true&characterEncoding=utf8";
	String dbUser = "root";
	String dbPass = "java0000";
	Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	String sql = "insert into orders(item_no, member_no, orders_quantity, orders_rate, orders_date)values(?,?,?,?,SYSDATE())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, itemNo);
	stmt.setString(2, sessionMemberNo);
	stmt.setInt(3, ordersQuantity);
	stmt.setDouble(4, ordersRate);
	
	stmt.executeUpdate();
	
	%>
	</body>
</html>