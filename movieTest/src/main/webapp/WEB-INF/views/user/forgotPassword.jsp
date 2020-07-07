<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<script>
function move(){
	
	var name = findForm.name.value;
	var phone = findForm.phone.value; 
	
	if(name == "" || phone==""){
		alert('빈칸을 채워 주세요.')
		return false;
	}
	submit();		
}

function back(){
	location.href='/movie/login';
}

</script>
<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>비밀번호 찾기</h1>
		</div>
</div>
<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto;">
	<div class="container" style="padding-left: 17%">
	<div class="row text-center">
	<div class="login-box well  col-md-8">
		<form action="findPassword" method="post" name="findForm">
		
		<div class="input-group">
			<input name="name" id="name" type="text" placeholder="이름을 입력하세요" class="form-control"/>
		</div><br>
			
		<div class="input-group">
			<input name="phone" id="phone" type="text" placeholder="전화번호를 입력하세요" class="form-control"/>
		</div><br>
			<div class="text-right">
			<button onclick="return move();" class="btn btn-info">
				비밀번호 찾기
			</button>
			<a href="/movie/login" ><button type="button" class="btn btn-danger">돌아가기</button></a>
			</div>
		</form><br>		
			
	</div>   
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" />
</html>