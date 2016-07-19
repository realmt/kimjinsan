<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체member select</title>
</head>
<style>
table, td {border : 1px solid pink}
</style>
<body>
<%@ include file="/admin/item/itemAddForm.jsp" %>
<%// 입력 삭제 수정 가능하게 
	request.setCharacterEncoding("utf-8");

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	String sql = "Select * from item";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		connection = DriverManager.getConnection(Url, dbId, dbPw);
		connection.setAutoCommit(false);

		statement = connection.prepareStatement(sql);
		
		resultSet = statement.executeQuery();
				
		connection.commit();
%>
<h1>회원리스트</h1>
<form>
<table>
	<tr>
		<td>상품번호</td>
		<td>상품명</td>
		<td>상품가격</td>
		<td>할인률</td>
		<td>삭제</td>
		<td>수정</td>
		
	</tr>
	<%
		while (resultSet.next()) {
	%>
	<tr>
		<td><%=resultSet.getInt("item_no")%></td>
		<td><%=resultSet.getString("item_name")%></td>
		<td><%=resultSet.getInt("item_price")%></td>
		<td><%=resultSet.getDouble("item_rate")%></td>
		<td><a href ="<%=request.getContextPath()%>/admin/item/itemDelete.jsp?deleteNo=<%=resultSet.getInt("item_no")%>">삭제하기</a></td>
		<td><a href ="<%=request.getContextPath()%>/admin/item/itemUpdateform.jsp?itemNo=<%=resultSet.getInt("item_no")%>&itemName=<%=resultSet.getString("item_name")%>&itemPrice=<%=resultSet.getInt("item_price")%>&itemRate=<%=resultSet.getDouble("item_rate")%>">수정하기</a></td>	
	</tr>
	<%
		}
	} catch (Exception e) {//예외시
		connection.rollback();//롤백
		e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
	} finally {
		// 6. 사용한 Statement 종료
		if (statement != null)try {statement.close();} catch (SQLException ex) {}
		// 7. 커넥션 종료
		if (connection != null)try {connection.close();} catch (SQLException ex) {}
	}
%>
</table>
</form>
</body>
</html>