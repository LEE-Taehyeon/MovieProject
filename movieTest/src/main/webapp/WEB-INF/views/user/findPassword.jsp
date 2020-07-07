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
<c:if test='${not empty message }'>
<script>
function move(){
	submit();
}
</script>
</c:if>
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
		<c:choose>
		<c:when test="${name != null || phone!=null}">
		 <p style="border:1px solid black; font-size: 3em;">${name}님의 비밀번호는 <br><b>"${password}"</b>입니다.</p>
		 </c:when>
		 <c:when test="${name == null || phone==null}">
		 회원이 아닙니다.
		 </c:when>
		 </c:choose>
		 
		 <br>
		 <div class="text-right">
		<input type="button" value="돌아가기" onclick="re(-1)" class="btn btn-danger">
		<a href="/movie/login"
			class="btn btn-success">로그인</a>
			<script>
			function re(val){ 
				if(val=='-1')
					location.href="/movie/findPassword";
			}
			</script>
	</div>   
</div>
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" />
</html>