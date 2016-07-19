<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
			$('#addBtn').click(function(){
				$('#addForm').submit();
			});
		});
		</script>
	</head>
	<body>
	
	<%
	
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	String itemNo = request.getParameter("send_no");
	
	System.out.println(sessionMemberId);
	System.out.println(itemNo);
	if(sessionMemberId == null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	} else {	
		// SELECT JDBC 코드
				
		request.setCharacterEncoding("utf-8");
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		
		String itemName = null;
		int itemPrice = 0;
		double itemRate = 0;
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jjdevmall?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPw = "java0000";
		
		Class.forName(driver);
		try{
		
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		
		String sql = "select * from item where item_no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, itemNo);
		
		rs = stmt.executeQuery();
		
		if(rs.next()){
		itemName = rs.getString("item_name");
		itemPrice = rs.getInt("item_price");
		itemRate = rs.getDouble("item_rate");
		
		}
	%>
		<form id = "addForm" action="<%= request.getContextPath()%>/orders/ordersAddAction.jsp" method="post">
			<div>
				itemNo : 
				<input name = "itemNo" type="text" value="<%=itemNo%>" readonly="readonly"/>
			</div>
			<div>
				itemName : 
				<input name = "itemName"type="text" value="<%=itemName%>" readonly="readonly"/>
			</div>
			<div>
				itemPrice :
				<input name = "itemPrice" value="<%=itemPrice%>" readonly="readonly">
				할인가-<%=(itemPrice*(100-itemRate))*(0.01)%>원
				<span>정가-<%=itemPrice%>원</span>
			</div>
			<div>
				할인율<input type="text" name = "itemRate" value="<%=itemRate%>">
			</div>
			<div>
				ordersQuantity :
				<select id = "ordersQuantity" name = "ordersQuantity">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div>
				count : 
				<input id = "count" type="text" value="" readonly="readonly"/>
			</div>
			<div>
				<input id = "addBtn" type="button" value="주문"/>
			</div>
		</form>
	<%
		}catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 사용한 Statement 종료
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			
			// 7. 커넥션 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	%>
	</body>
</html>