<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	
	/* 달력나타내기(공부 좀 더 하기) */
	$(function(){
		$(".datepicker").datepicker({
			dateFormat: "yy-mm-dd",//텍스트 필드에 입력되는 날짜 형식
			prevText: "이전달",
			nextText: "다음달",
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],// 월의 한글형식
			dayNamesMin: ['일','월','화','수','목','금','토'],//요일의 한글 형식
			changeMonth: true,//월을 바꿀 수 있는 셀렉트 박스를 표시한다
			changeYear: true,//년을 바꿀 수 있는 셀렉트 박스를 표시한다
			showMonthAfterYear: true,//월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다
			yearRange: "c-100:c"
		});
	});
	
	
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
		            url: "/movie/chkId",
		            type: "POST",
		            data: form,
		            success: function(data){
		            	if (data == 1) {
							alert('중복된 아이디가 있습니다.');
							document.getElementById('id').value="";
							document.getElementById('idChk').value=0;
						} else if(data == 0) {
							alert('사용 가능한 아이디입니다.');
							document.getElementById('idChk').value=1;
						}else{
							alert('사용 불가한 아이디입니다.');
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
	
	/* 본인인증 : 이름 성별 생년월일 이 같은지 확인 */
	function chkConfirm(){
		var name = document.getElementById('name').value;
		var birth = document.getElementById('birth').value;
		
		if(name==""){
			alert('이름을 입력하세요.');
		}
		if(name!="" && birth==""){
			alert('생년월일을 입력하세요.');
		}
		
		if(name!="" && birth!=""){
			var form = {
					name : $("#name").val(),
					gender : $('input[name="gender"]:checked').val(),
		 			birth : $("#birth").val()
		        }
				
		        $.ajax({
		            url: "/movie/chkConfirm",
		            type: "POST",
		            data: form,
		            success: function(data){
		            	if (data == 1) {
							alert('본인인증에 실패하였습니다. 이미 등록한 회원입니다.');
							document.getElementById('name').value="";
							document.getElementById('birth').value="";
							document.getElementById('confirmChk').value=0;
						} else {
							alert('본인인증에 성공하였습니다.');
							document.getElementById('confirmChk').value=1;
						}
		            },
		            error: function(){
		                alert("simpleWithObject err");
		            }
		        });
		}
		
	}
	
	function onsub(){
		var idChk = document.getElementById('idChk').value;
		var password = document.userInfo.password.value;
		var passwordConfirm = document.userInfo.passwordConfirm.value;
		var passwordChk = document.getElementById('passwordChk').value;
		var confirmChk = document.getElementById('confirmChk').value;
		
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
		if(confirmChk==0){
			alert('본인인증을 (다시)실행하세요.');
			return false;
		}
		
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="container">
			<!-- 내용 -->
			<form action="/movie/join" name="userInfo" id="userInfo" method="post" class="form-horizontal" onsubmit="return onsub()">
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
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input type="text" name="phone" id="phone" class="form-control" placeholder="(-)없이 입력하세요" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
						<input type="radio" name="gender" value="남" checked required>남
						<input type="radio" name="gender" value="여">여
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생년월일</label>
					<div class="col-sm-3">
						<input type="text" name="birth" id="birth" class="datepicker form-horizontal" required>
						<!-- 본인인증 -->
						<button type="button" onclick="chkConfirm()" class="btn btn-success sm-3 mt-2 mb-1">본인인증</button>
					</div>
				</div>
				<!-- 본인인증 결과출력 -->
				<div id="result"></div>
				<!-- 본인인증 안했으면 회원가입 안되게 -->
				<input type="hidden" name="confirmChk" id="confirmChk" value="0">
				
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-3">
						<input type="text" name="mail" maxlength="50" class="form-control" placeholder="mail" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-5">
						<input type="text" name="zipcode" id="postcode" class="form-control" placeholder="zipcode" required>
						<a href="javascript:execDaumPostcode()" class="btn btn-secondary" role="button"> 우편번호 &raquo;</a>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">주소1</label>
					<div class="col-sm-5">
						<input type="text" name="address" id="address" class="form-control" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상세주소</label>
					<div class="col-sm-5">
						<input type="text" name="addressdetail" id="detailAddress" class="form-control" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">참고</label>
					<div class="col-sm-5">
						<input type="text" name="extraAddress" id="extraAddress" class="form-control" required>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
						<a href="/movie/main">
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>