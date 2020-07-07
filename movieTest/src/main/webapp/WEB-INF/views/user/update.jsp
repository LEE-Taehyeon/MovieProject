<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC_Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>회원정보 수정</h1>
		</div>
	</div>

<div class="container"><!-- 내용 -->
		<form name="regForm" method="post" action="update" class="form-horizontal">
		<div class="form-group row">
  <label class="col-sm-2">아이디</label>
  <div class="col-sm-3">
						<input type="text" name="id" size="15"  readonly="readonly" class="form-control" value="${customer.id}" > 
					</div>
			</div>
				<div class="form-group row">
  <label class="col-sm-2">이름</label>
  <div class="col-sm-3">
					<input type="text" name="name" size="15"  readonly="readonly" class="form-control" value="${customer.name}">
				 </div>
		</div>
		
		<div class="form-group row">
  <label class="col-sm-2">생일</label>
  <div class="col-sm-3">
					<input type="text" name="birth" size="15"  readonly="readonly" class="form-control" value="${customer.birth}">
				 </div>
		</div>
		
		<div class="form-group row">
  <label class="col-sm-2">성별</label>
  <div class="col-sm-3">
					<input type="text" name="gender" size="15"  readonly="readonly" class="form-control" value="${customer.gender}">
				 </div>
		</div>
		
				<div class="form-group row">
  <label class="col-sm-2">비밀번호</label>
  <div class="col-sm-3">
					<input type="password" name="password" size="15" class="form-control" placeholder="password">
				</div>
		</div>
				
<div class="form-group row">
  <label class="col-sm-2">비밀번호확인</label>
  <div class="col-sm-3">
				<input type="password" name="repassword" size="15" class="form-control" placeholder="password">
				</div>
</div>
				
				
				<div class="form-group row">
  <label class="col-sm-2">전화번호</label>
  <div class="col-sm-3">
					<input type="text" name="phone" size="20" class="form-control" placeholder="phone">
				</div>
</div>
				 
              <div class="form-group row">
  <label class="col-sm-2">이메일</label>
  <div class="col-sm-3">
			  	<input type="text" name="mail" maxlength="30" class="form-control" placeholder="mail">
			  </div>
</div>
			<div class="form-group row">
  <label class="col-sm-2">우편번호</label>
  <div class="col-sm-5">
			  	<input type="text" name="zipcode" id="postcode" class="form-control" placeholder="zipcode">
			  	<a href="javascript:execDaumPostcode()" class="btn btn-secondary" role="button"> 우편번호 &raquo;</a>
			  	</div>
</div>
			  <div class="form-group row">
  <label class="col-sm-2">주소1</label>
  <div class="col-sm-5">
			  	<input type="text" name="address" id="address" class="form-control" placeholder="address" >
			  </div>
</div>
			<div class="form-group row">
  <label class="col-sm-2">상세주소</label>
  <div class="col-sm-5">  
			  	<input type="text" name="addressdetail" id="detailAddress" class="form-control" placeholder="address">
			 </div>  
</div>
<div class="form-group row">
  <label class="col-sm-2">참고</label>
  <div class="col-sm-5">
			  	<input type="text" name="extraAddress" id="extraAddress" class="form-control" placeholder="address">
			  </div>  
</div>
				<div class="form-group row">
  <div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="수정완료" class="btn btn-primary" />
						&nbsp;&nbsp;
						<input type="button" value="수정취소" class="btn btn-primary" onclick="re(1)"/>
					</div>  
			</div>
		</form>
	</div>
	<script>
	function re(val){ 
		if(val=='1')
			location.href="/movie/";
	}
	</script>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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