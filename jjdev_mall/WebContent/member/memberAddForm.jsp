<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td {
		border:1px solid #000000;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#m_id').focus();
		$('#addBtn').click(function(){
			if($('#m_id').val()==""){
				alert("ID 를 입력해주세요.");
				$('#m_id').focus();				
			}else if($('#m_pw').val()==""){
				alert("비밀번호를 입력해주세요.");
				$('#m_pw').focus();	
			}else if($('#m_name').val()==""||!(isNaN($('#m_name').val()))){
				alert("이름 입력해주세요.");
				$('#m_name').focus();	
			}else if($('.m_gender:checked').length==0){
				alert("성별을 선택해주세요.");
			}else if($('#m_age').val()==""||isNaN($('#m_age').val())){
				alert("옳바른 나이를 입력해주세요.");
				$('#m_age').focus();
			}else if($('#m_addr').val()==""){
				alert("주소를 입력해주세요.");
			}else{
				$('#addForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form id="addForm" action="<%=request.getContextPath() %>/member/memberAddAction.jsp" method="post">
<h1>Member Add</h1>
<table>	
	<tr>
		<td>ID :</td>
		<td><input type ="text" id="m_id" name="m_id"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type ="password" id="m_pw" name="m_pw"></td>
	</tr>
	<tr>
		<td>이름 </td>
		<td><input type ="text" id="m_name" name="m_name"></td>
	</tr>
	<tr>
		<td>성별 :</td>
		<td>
			<input type ="radio" class="m_gender" name="m_gender" value="남자">남자
			<input type ="radio" class="m_gender" name="m_gender" value="여자">여자		
		</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type ="text" id="m_age" name="m_age"></td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td><input type ="text" id="m_addr" name="m_addr"></td>
	</tr>
	<tr>
		<td colspan="2"><input type ="button" id="addBtn" value="memberAdd"></td>
	</tr>
</table>
</form>
</body>
</html>