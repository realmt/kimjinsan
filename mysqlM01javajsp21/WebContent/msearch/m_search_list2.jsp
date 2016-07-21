<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file="/msearch/m_search_form.jsp" %>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>�̸�</td><td>���̵�</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
//JDBC ���α׷� ����
//01�ܰ� :����̹� �ε� ����
Class.forName("com.mysql.jdbc.Driver");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk m_search_list.jsp");
System.out.println(sv + "<-- sv m_search_list.jsp");


try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev21db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev21id";
	String dbPass = "dev21pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	if(sk == null & sv == null){
		out.println("01 sk �� sv ���� ����");
		pstmt = conn.prepareStatement("select * from tb_member");
		//select * from tb_member; 
	}else if(sk != null & sv.equals("")){
		out.println("02 sk ���ְ� sv ���� ����");
		pstmt = conn.prepareStatement("select * from tb_member");
		//select * from tb_member; 
	}else if(sk != null & sv != null){
		out.println("03 sk sv �Ѵ� �ִ� ����");
		if(sk.equals("m_id")){
			pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
		}else if(sk.equals("m_level")){
			pstmt = conn.prepareStatement("select * from tb_member where m_level=?");
		}else if(sk.equals("m_name")){
			pstmt = conn.prepareStatement("select * from tb_member where m_name=?");
		}else if(sk.equals("m_email")){
			pstmt = conn.prepareStatement("select * from tb_member where m_email=?");
		}
		pstmt.setString(1, sv);
		//select * from tb_member where m_id='id001'; 
		//select * from tb_member where m_level='������'; 
		//select * from tb_member where m_name='ȫ02'; 
		//select * from tb_member where m_email='email03';  
	}
	out.println("<br>"+pstmt + "<--- pstmt");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_list.jsp");
	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("m_id")%></td>
		<td><%= rs.getString("m_pw")%></td>
		<td><%= rs.getString("m_level")%></td>
		<td><%= rs.getString("m_name")%></td>
		<td><%= rs.getString("m_email")%></td>
		<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">����Ŭ��</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= rs.getString("m_id")%>">����Ŭ��</a>			
		</td>
	</tr>
<%		
	}	
	
	
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. ����� Statement ����
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. Ŀ�ؼ� ����
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}












%>