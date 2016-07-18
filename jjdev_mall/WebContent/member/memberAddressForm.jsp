<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, tr, td {
	border: 1px solid #000000;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>Address_No</td>
			<td>member_no</td>
			<td>주소</td>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");

			int sendNo = Integer.parseInt(request.getParameter("sendNo"));
			//System.out.println("sendNo : " + sendNo);

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			String sql = null;

			String driver = "com.mysql.jdbc.Driver";
			String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPw = "java0000";

			//jdbc

			try {
				Class.forName(driver);

				conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
				conn.setAutoCommit(false);
				sql = "Select M.member_no, A.address_no, A.member_address From member M Inner Join address A On M.member_no = A.member_no";
				pstmt = conn.prepareStatement(sql);

				System.out.println("pstmt : " + pstmt);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getInt("M.member_no") == sendNo) {
		%>
		<tr>
			<td><%=rs.getInt("A.address_no")%></td>
			<td><%=sendNo%></td>
			<td><%=rs.getString("A.member_address")%>
		</tr>
		<%
			}
				}
				conn.commit();
			} catch (Exception e) {
				conn.rollback();
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>