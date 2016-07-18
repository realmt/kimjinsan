<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
	$(document).ready(function(){
		$('#itemBtn').click(function(){
			if($('#itemName').val()==''){
				$('#itemNameHelper').text('상품명을 입력하세요');
			}else if($('#itemprice').val()==''){
				$('#itemPriceHelper').text('가격을 입력하세요');
				$('#itemNameHelper').text('');
			}else if($('#itemRate').val()==''){
				$('#itemPriceHelper').text('');
				$('#itemRateHelper').text('할인율을 입력하세요');
			}else if($('#itemRate').val()>=1){
				$('#itemRateHelper').text('');
				$('#itemRateHelper').text('1보다 큰수는 입력할수 없습니다.');	
			}else{
				$('#itemForm').submit();
			}
		});
	});
</script>
</head>
<body> 
<form id = "itemForm" action ="<%=request.getContextPath()%>/admin/item/itemInsertAction.jsp">
<h1> 회원가입 </h1>
	<div>
		<label>상품명 : </label>
		<input  name = "itemName" id = "itemName" type = "text">
		<span id = "itemNameHelper"></span>
	</div>
	<div>	
		<label>상품가격 : </label>	
		<input name = "itemPrice"id = "itemPrice" type = "text"  >
		<span id = "itemPriceHelper"></span>
	</div>
	<div>	
		<label>할인율: </label>
		<input  name = "itemRate"id = "itemRate"  type = "text">
		<span id = "itemRateHelper"></span>
	</div>	
		<input id= "itemBtn" type = "button" value = "item" >

</form>	
</body>
</html>