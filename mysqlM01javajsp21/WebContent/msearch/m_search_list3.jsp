<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/msearch/m_search_form.jsp"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	String sv = request.getParameter("sv");
	String sk = request.getParameter("sk");
	System.out.println("sv : "+sv);
	System.out.println("sk : "+sk);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
    	String jdbcDriver = "jdbc:mysql://localhost:3306/dev21db?" +
            	"useUnicode=true&characterEncoding=euckr";
    	String dbUser = "dev21id";
    	String dbPass = "dev21pw";
    	
    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        System.out.println(conn + "<-- conn");
        System.out.println(conn.getClass() + "<-- conn.getClass()");
        //sk:�÷���, sv:�Է°�
        
        if(sk == null && sv == null){
        	out.println("01 sk �� sv ���� ����");
        	pstmt = conn.prepareStatement("select * from tb_member");
        	
        //�˻�Ű(sk) ���� �˻���(sv) ���� ����. �÷���, �Է°� �Ѵ� �Է��� �ȵ� ��Ȳ	
        }else if((sk != null && sv == null) ||(sk == null && sv != null)){
        	out.println("02 sk ���ְ� sv ���� ����");
        	pstmt = conn.prepareStatement("select * from tb_member");
        	
        //�˻�Ű(sk) �ִ� �˻���(sv) ���� ����. �˻�Ű(sk) ���� �˻���(sv) �ִ� ����. �÷��� or �Է°� ���߿� �ϳ��� �Էµ� ��Ȳ        	
        }else{
        	out.println("03 sk sv �Ѵ� �ִ� ����");
        	pstmt = conn.prepareStatement("select * from tb_member where " + sk + " like ?");
        	pstmt.setString(1, "%" + sv + "%");
        	
        //�˻�Ű(sk) �ִ� �˻���(sv) �ִ� ����. �÷���, �Է°� �Ѵ� �Է��� �� ��Ȳ
        //select * from tb_member where m_id='id001';
        //select * from tb_member where m_pw='pw001';
        //select * from tb_member where m_level='������';
        //select * from tb_member where m_name='ȫ02';
        //select * from tb_member where m_email='email03';
        
        
        
        }
        System.out.println(pstmt + "<-- pstmt 1");
        rs = pstmt.executeQuery();
        
        out.print("<table border=1>");
        out.print("<tr>");
    	out.print("<th>���̵�</th>");
    	out.print("<th>��й�ȣ</th>");
    	out.print("<th>����</th>");
    	out.print("<th>�̸�</th>");
    	out.print("<th>�̸���</th>");
    	out.print("</tr>");
    	
        while(rs.next()){
        	out.print("<tr>");
        	out.print("<td>" + rs.getString("m_id")+ "</td>");
        	out.print("<td>" + rs.getString("m_pw")+ "</td>");
        	out.print("<td>" + rs.getString("m_level")+ "</td>");
        	out.print("<td>" + rs.getString("m_name")+ "</td>");
        	out.print("<td>" + rs.getString("m_email")+ "</td>");
        	out.print("</tr>");
        }
        out.print("</table>");
    	
	}finally{
        //06�ܰ� :statement �Ǵ� prepareStatement��ü ����(close())
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        //07�ܰ� :Connection ��ü ����(close())
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }	
    	
%>


