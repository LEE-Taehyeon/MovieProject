<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 달력나타내기(공부 좀 더 하기) -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function chkId(){
		var id = document.getElementById('id').value;
	
		if(id==""){
			alert('아이디를 입력하세요.');
			$('#id').focus();
		}
	
		if(id!=""){
			var form = {
				id : $("#id").val()
	        }
			
	        $.ajax({
	            url: "/movie/chkAdminId",
	            type: "POST",
	            data: form,
	            success: function(data){
	            	if (data == 1) {
	            		alert('사용 불가한 아이디입니다.');
						document.getElementById('id').value="";
						document.getElementById('idChk').value=0;
					} else if(data == 0) {
						alert('사용 가능한 아이디입니다.');
						document.getElementById('idChk').value=1;
					}else{
						alert('중복된 아이디가 있습니다.');
						document.getElementById('id').value="";
						document.getElementById('idChk').value=0;
					}
	            },
	            error: function(){
	                alert("simpleWithObject err");
	            }
	        });
		}
	
	}

	//비밀번호 일치,불일치 확인
	function chkPwd(){
		var password = document.userInfo.password.value;
		var passwordConfirm = document.userInfo.passwordConfirm.value;
	
		if(password==""){
			alert('비밀번호를 입력하세요.');
			$('#password').focus();
		}
		if(password!="" && passwordConfirm==""){
			alert('비밀번호 확인을 입력하세요.');
			$('#passwordConfirm').focus();
		}
		if(password!="" && passwordConfirm!=""){
			if(password==passwordConfirm){
				$("#pwdComent").text("비밀번호가 일치합니다.");
				$("#pwdComent").attr("style", "color:#00f");
				document.getElementById('passwordChk').value=1;
			}else{
				$("#pwdComent").text("비밀번호가 일치하지 않습니다.");
				$("#pwdComent").attr("style", "color:#f00");
				document.getElementById('passwordChk').value=0;
			}
		}
	
	}



	function onsub(){
		var idChk = document.getElementById('idChk').value;
		var password = document.userInfo.password.value;
		var passwordConfirm = document.userInfo.passwordConfirm.value;
		var passwordChk = document.getElementById('passwordChk').value;
	
		if(idChk==0){
			alert('아이디 중복확인을 (다시)실행하세요.');
			return false;
		}
		if(password!=passwordConfirm){
			alert('비밀번호를 동일하게 입력하세요.');
			return false;
		}else{
			if(passwordChk==0){
				alert('비밀번호 확인을 (다시)실행하세요');
				return false;
			}
		}
		if(idChk==1 && password==passwordConfirm){
			confirm('관리자를 생성하시겠습니까?');
		}
	}
	

</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 생성</h1>
		</div>
	</div>
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="container">
			<!-- 내용 -->
			<form action="/movie/adminJoin" name="userInfo" id="userInfo" method="post" class="form-horizontal" onsubmit="return onsub()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" name="id" id="id" class="form-control" placeholder="id" required>
						<button type="button" class="btn btn-success sm-3 mt-2 mb-1" onclick="chkId()">중복확인</button>
					</div>
				</div>
				<!-- 중복체크 안했으면 회원가입 안되게 -->
				<input type="hidden" name="idChk" id="idChk" value="0">
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="password" id="password" class="form-control" placeholder="password" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호확인</label>
					<div class="col-sm-3">
						<input type="password" name="passwordConfirm" id="passwordConfirm" class="form-control" placeholder="password confirm" required>
						<!-- 비밀번호 비밀번호확인 비교 -->
						<button type="button" onclick="chkPwd()" class="btn btn-success sm-3 mt-2 mb-1">비밀번호 확인</button>
					</div>
					<!-- 비밀번호 비밀번호확인 비교 결과출력 -->
					<span id="pwdComent"></span>
					<!-- 비밀번호확인 안했으면 회원가입 안되게 -->
					<input type="hidden" name="passwordChk" id="passwordChk" value="0">
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" name="name" id="name" class="form-control" placeholder="name" required>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">권한</label>
					<div class="col-sm-3">
						<select name="power" id="power" class="form-control" required>
							<option value="2">PRO</option>
							<option value="3">SEMI-PRO</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
						<a href="/movie/adminMain">
							<button class="btn btn-primary">되돌아가기</button>
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>