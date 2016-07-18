<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table, td {
		border : 1px solid ;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#item_name').focus();
		$('#addBtn').click(function(){
			if($('#item_name').val()==""){
				alert("아이템 이름을 입력해주세요.");
				$('#item_name').focus();
			}else if($('#item_price').val()==""||isNaN($('#item_price').val())){
				alert("가격을 옳바르게 입력해주세요.")
				$('#item_price').focus();
			}else if($('#item_rate').val()==""||$('#item_rate').val()>1||isNaN($('#item_rate').val())){
				alert("옳바른 할인율을 입력해주세요.")
				$('#item_rate').focus();
			}else{
				$('#addForm').submit();
			}
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
<form id="addForm" action="./itemAddAction.jsp" method="post">
<h1>Item Add</h1>
<table>
	<tr>
		<td>이름 : </td>
		<td>
			<input type="text" id="item_name" name="item_name">
		</td>
	</tr>
	<tr>
		<td>가격 : </td>
		<td>
			<input type="text" id="item_price" name="item_price">
		</td>
	</tr>
	<tr>
		<td>할인율 : </td>
		<td>
			<input type="text" id="item_rate" name="item_rate">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" id="addBtn" value="아이템 추가"></td>
	</tr>	
</table>
</form>
</body>
</html>