<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<-- id login_pro.jsp");
System.out.println(pw + "<-- pw login_pro.jsp");
// ���Ե� ȸ������ ���� Start
String dbid = null;
String dbpw = null;
String dbname = null;
String dblevel = null; 
// ���Ե� ȸ������ ���� End


try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	
	String sql = "select m_pw,m_level,m_name from tb_member where m_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		System.out.println("01���̵���ġ");
		
		dbpw = rs.getString("m_pw");
		dbname = rs.getString("m_name");
		dblevel = rs.getString("m_level"); 
		
		if(pw.equals(dbpw)){
			System.out.println("03�α��μ���");
			//session������ �̸��� ������ ����
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			//session������ �̸��� ������ ����
			//index.jsp�� �̵�
//response.sendRedirect(request.getContextPath()+"/user/index.jsp");
%>
<script type="text/javascript">
	alert("�α��μ���");
	location.href = "<%= request.getContextPath() %>/user/index.jsp";
</script>
<%		
		}else{
			System.out.println("04�������ġ");
%>
<script type="text/javascript">
	alert("�������ġ");
	location.href = "<%= request.getContextPath() %>/user/index.jsp";
</script>
<%			
		}
	}else{
		System.out.println("02���̵����ġ");
%>
<script type="text/javascript">
	alert("���̵� ����ġ");
	location.href = "<%= request.getContextPath() %>/user/index.jsp";
</script>
<%		
	}
	
} catch(SQLException ex) {
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







