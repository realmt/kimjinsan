<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//�α��� �ϱ����� �Է¹��� ȸ�� ���̵�� �н����带 �޾ƿɴϴ�.
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	boolean memberLogin = false;
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass = "java0000";
	
	Connection conn = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs = null;
	try{
		//����̹��ε�
		Class.forName(driver);
		//DB����
		conn = DriverManager.getConnection(url, dbUser, dbPass);
		
		//ȸ�������� select�Ͽ� id�� pw�� ���Ͽ� 
		String loginSql = "SELECT member_no, member_id, member_pw FROM member WHERE member_id=? AND member_pw=?";
		pstmt1 = conn.prepareStatement(loginSql);
		pstmt1.setString(1, memberId);
		pstmt1.setString(2, memberPw);
		
		rs = pstmt1.executeQuery();
		System.out.println(pstmt1);
		
		// �´� ȸ���������� �α���ó��
		if(rs.next()){
			//���ǿ� �α��� ���� ����
			memberLogin = true;
			session.setAttribute("memberId", rs.getString("member_id"));
			session.setAttribute("memberNo", rs.getString("member_no"));
			session.setAttribute("memberLogin", memberLogin);
			//������ �̵�
			response.sendRedirect(request.getContextPath()+"/member/memberIndex.jsp");
		}else{
			//�α����� �߾ȵǾ��ٸ� ȸ������������� �̵�
			response.sendRedirect(request.getContextPath()+"/member/memberAddForm.jsp");
		}
	}finally {
		// ����� Statement ����
		if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
		
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		
		// Ŀ�ؼ� ����
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}	
	
	
%>

</body>
</html>