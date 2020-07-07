<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="theaterList" value="${theaterList}"/>
<c:set var="total_theater" value="${total_theater}"/>
<script>/* 예약좌석 표시 */
window.onload = function(){

}

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화관 관리</title>
<style>
.btn-info-addMovie {
	color: #1DDB16;
	background-color: #B7F0B1;
	border: 1px solid #22741C;
}

.btn-info-backPage {
	color: #353535;
	background-color: #BDBDBD;
	border: 1px solid #000000;
}

.btn-info-addMovie:hover {
	cursor: pointer;
	color: white;
	background-color: #22741C;
}

.btn-info-backPage:hover {
	cursor: pointer;
	color: white;
	background-color: #000000;
}
</style>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script>
	function allCheck() {
		if ($('#chkAll').prop("checked")) {
			$("input[name=chk]").prop("checked", true);
		} else {
			$("input[name=chk]").prop("checked", false);
		}
	}

	function delchk() {
		var delchk = [];
		$('#chk:checked').each(function() {//each:반복문
			delchk.push($(this).val());//delchk에다가 $(this).value(=$("#chk:checked"))를 넣는다
		});

		if (delchk.length == 0) {
			alert('선택하신 영화관이 없습니다.');
			return false;
		} else {
			var loc = "/movie/TheaterDelete?";
			var qur = '';

			if (confirm('선택하신 영화관 ' + delchk.length + '개의 항목을 삭제하시겠습니까?')){
				for (var i = 0; i < delchk.length; i++) {
					if (i == (delchk.length - 1)) {
						qur += 'theater_code=' + delchk[i];
					} else {
						qur += 'theater_code=' + delchk[i] + '&';
					}
				}
				loc = loc + qur;
				location.href = loc;
			}
		}
	}

	function delMovie($theaterCode, $theaterArea, $theaterName) {
		var theater_code = $theaterCode;
		var theater_area = $theaterArea;
		var theater_name = $theaterName;
		if (confirm('영화관 코드:[' + theater_code + ']\n지역:[' + theater_area + ']\n'
							+'영화관명:[' + theater_name + ']을(를) 삭제하시겠습니까?')) {
			location.href = "/movie/TheaterDelete?theater_code=" + theater_code;
		}
	}
</script>	
</head>
<body>

	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>영화관 관리</h1>
		</div>
	</div>
	<!-- content -->
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
	<!-- 출력리스트 헤드부분 -->
	<div style="padding-top: 50px;">
		<div style="float:right">전체 상영관수: ${total_theater}개</div>
		<table class="table table-striped table-bordered table-hover" >
			<tr>
				<th style="width:10%; text-align: center; vertical-align: middle">
					<input type="checkbox" name="chkAll" id="chkAll" onclick="allCheck()">
				</th>
				<th style="text-align: center; vertical-align: middle">영화관코드</th>
				<th style=" text-align: center; vertical-align: middle">지역</th>
				<th style=" text-align: center; vertical-align: middle">영화관명</th>
				<th style=" text-align: center; vertical-align: middle">상영관명</th>
				<th style=" text-align: center; vertical-align: middle">비고<br>(삭제)</th>
			</tr>

			<c:if test="${not empty theaterList}">
			    <c:forEach var="theaterList" items="${theaterList}">
				
					<tr>
						<th style="text-align: center; vertical-align: middle">
							<input type="checkbox" name="chk" id="chk" value="${theaterList.theater_code}">
						</th>
						<th style="text-align: center; vertical-align: middle">${theaterList.theater_code}</th>
						<th style="text-align: center; vertical-align: middle">${theaterList.theater_area}</th>
						<th style="text-align: center; vertical-align: middle">${theaterList.theater_name}</th>
						<th style="text-align: center; vertical-align: middle">${theaterList.screen_name}</th>
						<th style="text-align: center; vertical-align: middle">
							<button type="button" class="btn btn-info-delete" onclick="delMovie(
								'${theaterList.theater_code}', '${theaterList.theater_area}', 
								'${theaterList.theater_name}')">삭제
							</button>
						</th>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>
	<div class="text-right">
	<a href="/movie/TheaterInsertForm">
		<button type="button" name="add" id="add" class="btn btn-success">영화관 추가</button>
	</a>
	<button type="button" name="delete" id="delete" class="btn btn-danger" onclick="delchk()">영화관 삭제</button>
	<a href="/movie/">
		<button type="button" name="backPage" id="backPage" class="btn btn-dark">되돌아가기</button>
	</a>
	</div>
	<!-- <a href="timetableInsertAction.do">
		<button type="button" name="add" id="add" class="btn">상영시간표 추가</button>
	</a> -->
	</div>
	<!--  페이징 처리  -->
		<div>
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<a class="page-link" href="/movie/managecinema?pageNum=${pageMaker.startPage-1}">이전
							</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item"><a class="page-link" href="/movie/managecinema?pageNum=${num}">${num}</a></li>

				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="/movie/managecinema?pageNum=${pageMaker.endPage + 1}">다음
							</a></li>
				</c:if>
			</ul>
		</div>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>







