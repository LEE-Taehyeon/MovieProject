<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SC_Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	function checkValue() {
		inputForm = eval("document.loginInfo");
		
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}

		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>로그인 페이지</h1>
		</div>
	</div>
	<div class="wrapper" style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="container" style="padding-left: 17%">
			<div class="row text-center">
				<div class="login-box well  col-md-8">

					<form action="/movie/login" method="post" name="loginInfo" accept-charset="UTF-8" onsubmit="return checkValue()">
						<!-- <legend>로그인</legend><br> -->


						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" id="id" name="id" placeholder="아이디를 입력하세요" class="form-control" autofocus />
						</div>
						<br>

						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" class="form-control" />
						</div>
						<br>

						<button type="submit" id="login-submit" class="btn btn-default btn-block" value="로그인">로그인</button>
						<div class="text-right">
							<a href="/movie/findPassword">
								<button type="button" class="btn btn-outline-dark btn-sm">비밀번호 찾기</button>
							</a>
							<a href="/movie/addmember">
								<button type="button" class="btn btn-outline-dark btn-sm">회원가입</button>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>