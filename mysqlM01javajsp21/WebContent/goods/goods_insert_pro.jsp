<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>


<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt_select = null;
	ResultSet rs = null;
//ȭ�鿡�� �Է��ڷ� �޾Ƽ� �ܼ�â�� ��� ����
	//String g_code = request.getParameter("g_code");
	String g_name = request.getParameter("g_name");
	String g_cate = request.getParameter("g_cate");
	String g_price = request.getParameter("g_price");
	String g_desc = request.getParameter("g_desc");
	//System.out.println(g_code + "<-- g_code /goods/goods_insert_pro.jsp");
	System.out.println(g_name + "<-- g_name /goods/goods_insert_pro.jsp");
	System.out.println(g_cate + "<-- g_cate /goods/goods_insert_pro.jsp");
	System.out.println(g_price + "<-- g_price /goods/goods_insert_pro.jsp");
	System.out.println(g_desc + "<-- g_desc /goods/goods_insert_pro.jsp");
//ȭ�鿡�� �Է��ڷ� �޾Ƽ� �ܼ�â�� ��� ��	
	//JDBC ���α׷� ����
	//01�ܰ� :����̹� �ε� ����
	//01�ܰ� :����̹� �ε� ��
	
	String g_code = "gcode_1";
	
	try{
//02�ܰ� :DB����(Connection)����
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + "<-- conn");

		
		pstmt_select = conn.prepareStatement(
				"select MAX(substring(g_code,7)) from tb_goods");
			
		
		rs = pstmt_select.executeQuery();
		
		String temp = "gcode_";
		
		int result = 0;
		//System.out.println(rs.next() + "<-- rs.next()");
		if(rs.next()){
			result = rs.getInt(1);	//�ִ밪 ���� ��� 2
			System.out.println(result + "<-- result goods_insert_pro.jsp");
			result = result + 1;	//�ִ밪 2 ���ϱ� 1�� 3
		}
	
		g_code = temp + result;		//gcode_3
		
		System.out.println(g_code + "<-- g_code goods_insert_pro.jsp");

		pstmt = conn.prepareStatement(
				"insert into tb_goods values(?,?,?,?,?)");

		pstmt.setString(1, g_code);
		pstmt.setString(2, g_name);
		pstmt.setString(3, g_cate);
		pstmt.setString(4, g_price);
		pstmt.setString(5, g_desc);
//03�ܰ� :Query������ ���� statement �Ǵ� prepareStatement��ü���� ��
//04�ܰ� :Query���� ����
		pstmt.executeUpdate();

		//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
%>		
	<script>
		alert('�Է¼���');
		location.href = "<%= request.getContextPath() %>/goods/goods_list.jsp";
	</script>	
<%		
		
		

//04�ܰ� :Query���� ��
//05�ܰ� :Query������ ��� (insert�� ��� ���� ���ɴܰ�)

	}finally{
		//06�ܰ� :statement �Ǵ� prepareStatement��ü ����(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (pstmt_select != null) try { pstmt_select.close(); } catch(SQLException ex) {}

		//07�ܰ� :Connection ��ü ����(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>