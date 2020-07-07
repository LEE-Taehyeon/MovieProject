<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="dbconn.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>Insert title here</title>
<style>
.btn-info-addMovie{
	color: #1DDB16;
	background-color: #B7F0B1;
	border: 1px solid #22741C;
}

.btn-info-backPage{
	color: #353535;
	background-color: #BDBDBD;
	border: 1px solid #000000;
}
.btn-info-addMovie:hover{
	cursor: pointer;
	color: white;
	background-color: #22741C;
}

.btn-info-backPage:hover{
	cursor: pointer;
	color: white;
	background-color: #000000;
}
</style>
<script src="./resources/js/jquery.js"></script>
<!-- 달력나타내기(공부 좀 더 하기) -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<%
	int num1 = (int) (Math.random() * 90) + 10;
	int num2 = (int) (Math.random() * 90) + 10;
	int num3 = (int) (Math.random() * 90) + 10;

	String m_Code = "MF" + num1 + num2 + num3;

%>

<script>
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

	function registMovie() {
		var yN = confirm('영화를 등록하시겠습니까?');
		if (yN) {
			alert('영화가 등록되었습니다.');
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1>개봉예정 영화 등록</h1>
		</div>
	</div>

	<!-- content -->
	<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto;">
	<div class="container">
		<form action="/movie/insertMovie" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">영화코드</label>
				<div class="col-sm-3">
					<input type="text" id="m_code" name="m_code" class="form-controlz" value="<%=m_Code%>" readonly required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화제목</label>
				<div class="col-sm-3">
					<input type="text" id="m_name" name="m_name" class="form-control" required autofocus>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">감독</label>
				<div class="col-sm-3">
					<input type="text" id="m_director" name="m_director" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배우</label>
				<div class="col-sm-3">
					<input type="text" id="m_actor" name="m_actor" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화사</label>
				<div class="col-sm-3">
					<input type="text" id="m_company" name="m_company" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">런닝타임</label>
				<div class="col-sm-3">
					<input type="text" id="m_time" name="m_time" class="form-control" placeholder="(min)" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">개봉일</label>
				<div class="col-sm-3">
					<input type="text" name="m_playDate" id="m_playDate" class="datepicker form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">줄거리</label>
				<div class="col-sm-3">
					<textarea cols="50" rows="10" id="m_description" name="m_description" class="form-controls" required></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화 포스터</label>
				<div class="col-sm-3">
					<input type="file" id="m_poster" name="m_poster" class="form-controls" required>
				</div>
			</div>
			<input type="submit" class="btn btn-primary" value="영화 등록">
			<a href="adminMovie.jsp" class="btn btn-info">되돌아가기</a>
		</form>
	</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
	
	
	
</body>
</html>
