<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화관 추가창</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	var ischk = 0;//영화관 중복체크 여부
	
	function initChk(){
		ischk = 0;//영화관 이름 바꾸면 중복체크 여부 초기화
		//alert("중복 여부 초기화:"+ischk);
	}
	
	function chkTheater(){
		var theater_area = document.getElementById('theater_area').value;
		var theater_name = document.getElementById('theater_name').value;
		var screen_name = document.getElementById('screen_name').value;
		var param = 'theater_area='+theater_area+'&theater_name='+theater_name+'&screen_name='+screen_name;
		
		if(theater_name=="" && screen_name==""){
			alert('영화관과 상영관 모두를 입력하세요');
			document.getElementById('theater_name').focus();
		}else if(theater_name==""){
			alert('영화관을 입력하세요');
			document.getElementById('theater_name').focus();
		}else if(screen_name==""){
			alert('상영관을 입력하세요');
			document.getElementById('screen_name').focus();
		}else{
			$.ajax({
			    url:'/movie/TheaterChk', // 요청 할 주소
			    data:param,// 전송할 데이터
			    success:function(result) {
			    	if(result.length==0){
			    		alert("등록 가능한 영화관입니다.");
			    		ischk=1;
			    	}else{
			    		alert("등록된 영화관이 있습니다.");
			    		document.getElementById('screen_name').value="";
			    	}
			    },
			    error:function(request,status,error){
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	}

	function registTheater() {
		if(ischk==0){
			alert("영화관 중복 체크하세요");
			return false;
		}else if(seatTF==0){
			alert('좌석을 등록하세요');
			return false;
		}else{
			var yN = confirm('영화관을 등록하시겠습니까?');
			if (yN) {
				alert('영화관이 등록되었습니다.');
				return true;
			}else{
				return false;
			}
		}
	}
	
	function seatSelect(){
		var ranNum1 = Math.floor((Math.random() * 90)) + 10;
		var ranNum2 = Math.floor((Math.random() * 90)) + 10;
		var ranNum3 = Math.floor((Math.random() * 90)) + 10;

		var randomNumber = 'S'+ranNum1+ranNum2+ranNum3;
		var str = "";
		str += '<div class="form-group row">';
		str += '<label class="col-sm-2">좌석 코드</label>';
		str += '<div class="col-sm-6">';
		str += '<input type="text" id="seat_code" name="seat_code" class="form-controlz" value="'+randomNumber+'" readonly required>';
		str += '</div>';
		str += '</div>';
		str += '<div id="select_seat"></div>';
		str += '<div id="select_seat"></div>';
		str += '<table>';
		str += '<tr>';
		str += '<td></td>';
		
		for(var i=1;i<=16;i++){
			str += '<td><input type="checkbox" name="allChk'+i+'" id="allChk'+i+'" onclick="allCheckNum('+"'"+i+"'"+')">'+i+'</td>';
		}
		str += '</tr>';
		str += '<tr>';

		for (var i = 0; i < 16; i++) {
			str += '<td><input type="checkbox" name="allChk'+String.fromCharCode('A'.charCodeAt()+i)+'" id="allChk'+String.fromCharCode('A'.charCodeAt()+i)+'" onclick="allCheckAlpa('+"'"+String.fromCharCode('A'.charCodeAt()+i)+"'"+')">'+String.fromCharCode('A'.charCodeAt()+i)+'</td>'
			for(var j=1;j<=16;j++){
				str += '<td><input type="button" name="'+String.fromCharCode('A'.charCodeAt()+i)+j+'" id="'+String.fromCharCode('A'.charCodeAt()+i)+j+'"style="background-color:white" value="'+String.fromCharCode('A'.charCodeAt()+i)+j+'" onclick="clickBtn('+"'"+String.fromCharCode('A'.charCodeAt()+i)+j+"'"+')">'+String.fromCharCode('A'.charCodeAt()+i)+j+'</td>'
			}
			str += '</tr>';
		}
		str += '</table>';
		str += '<button type="button" name="save_seat" id="save_seat" class="btn btn-info" onclick="seatSave()">좌석저장</button>';
		str += '<button type="button" name="reset_seat" id="reset_seat" class="btn btn-info" onclick="seatReset()">좌석 초기화</button>';

		$('#seatTable').html(str);
	}
	
	//좌석 생성 관련 function
	function allCheckAlpa(alpa){
		var alpabet = alpa
		for(var i=1;i<=20;i++){
			if ($('#allChk'+alpabet).prop("checked")) {
				document.getElementById(alpabet+i).style.backgroundColor = "green";
				$('input[name='+alpabet+i+']').addClass("selected");
			} else {
				document.getElementById(alpabet+i).style.backgroundColor = "white";
				$('input[name='+alpabet+i+']').removeClass("selected");
			}
		}
	}
	
	function allCheckNum(num){
		var number = num;
		for(var i=0;i<26;i++){
			if ($('#allChk'+number).prop("checked")) {
				document.getElementById(String.fromCharCode('A'.charCodeAt()+i)+number).style.backgroundColor = "green";
				$('input[name='+String.fromCharCode('A'.charCodeAt()+i)+number+']').addClass("selected");
			} else {
				document.getElementById(String.fromCharCode('A'.charCodeAt()+i)+number).style.backgroundColor = "white";
				$('input[name='+String.fromCharCode('A'.charCodeAt()+i)+number+']').removeClass("selected");
			}
		}
		
	}
	
	function clickBtn(id){
		var getId = id;
		if($("input[name="+getId+"]").hasClass("selected")===true){
			document.getElementById(getId).style.backgroundColor = "white";
			$("input[name="+getId+"]").removeClass("selected");
		}else{
			document.getElementById(getId).style.backgroundColor = "green";
			$("input[name="+getId+"]").addClass("selected");
		}	
	}
	
	var seatTF = 0;//영화관 등록 전에 좌석이 등록되었는지 확인하기 위함
	function seatSave(){
		var seat_code = document.getElementById('seat_code').value;
		var elements = document.getElementsByClassName('selected');
		var qur = 'seat_Code='+seat_code;
		document.getElementById('seat_hidden_code').value = seat_code;
		
		if(elements.length==0){
			alert('선택된 좌석이 없습니다.');
		}else{
			for(var i=0;i<elements.length;i++){
				qur += '&seat='+elements[i].value;
			}
			
			var param = qur;
			
			$.ajax({
			    url:'/movie/SaveSeat', // 요청 할 주소
			    data:param,// 전송할 데이터
			    success:function(result) {
			    	if(result.length==0){
			    		alert("좌석이 등록되었습니다.");
			    		seatTF = 1;
			    	}else{
			    		alert("해당 좌석코드로 등록된 좌석이 있습니다.");
			    	}
			    },	    
			});
		}
	}
	
	
	function seatReset(){
		var elements = document.getElementsByClassName('selected');
		var ranNum1 = Math.floor((Math.random() * 90)) + 10;
		var ranNum2 = Math.floor((Math.random() * 90)) + 10;
		var ranNum3 = Math.floor((Math.random() * 90)) + 10;

		var randomNumber = 'S'+ranNum1+ranNum2+ranNum3;
		document.getElementById('seat_code').value = randomNumber
		
		for (var i = 0; i < elements.length; i++) {
			elements[i].style.backgroundColor = "white";
		}
		seatTF = 0;
		$('input[class="selected"').removeClass("selected");
	}
</script>
</head>
<body>
	<%
		int num1 = (int) (Math.random() * 90) + 10;
		int num2 = (int) (Math.random() * 90) + 10;
		int num3 = (int) (Math.random() * 90) + 10;
	
		String t_code = "T" + num1 + num2 + num3;
		
	%>
	
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>영화관 등록</h1>
		</div>
	</div>
	
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="container">
		<form action="TheaterInsert" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">영화관코드</label>
				<div class="col-sm-6">
					<input type="text" id="theater_code" name="theater_code" class="form-controlz" value="<%=t_code%>" readonly required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">지역</label>
				<div class="col-sm-6">
					<select id="theater_area" name="theater_area" class="custom-select">
						<optgroup label="지역선택">지역선택</optgroup>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="강원">강원</option>
							<option value="대전/충청">대전/충청</option>
							<option value="대구">대구</option>
							<option value="부산/울산">부산/울산</option>
							<option value="경상">경상</option>
							<option value="광주/전라/제주">광주/전라/제주</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화관</label>
				<div class="col-sm-6">
					<input type="text" id="theater_name" name="theater_name" class="form-control" onchange="initChk()" required>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상영관</label>
				<div class="col-sm-6">
					<input type="text" id="screen_name" name="screen_name" class="form-control" required>
				</div>
			</div>
			
			<!-- id,name명이 함수명과 같으면 인식이 안됨 -->
			<button type="button" id="chkTheaterBtn" name="chkTheaterBtn" onclick="chkTheater()">영화관 중복체크</button>
			<button type="button" name="add" id="add" class="btn btn-info" onclick="seatSelect()">좌석생성</button>
			<input type="hidden" name="seat_hidden_code" id="seat_hidden_code" value="">
			<input type="submit" class="btn btn-primary" onclick="return registTheater()" value="영화관 등록">
			<a href="/movie/managecinema" class="btn btn-info">되돌아가기</a>
		</form>
		<div id="seatTable">

		</div>
	</div>
	</div>
	<jsp:include page="../include/footer.jsp" />


</body>
</html>







