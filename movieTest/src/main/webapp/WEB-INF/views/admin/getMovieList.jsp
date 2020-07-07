<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
			alert('선택하신 영화가 없습니다.');
			return false;
		} else {
			var loc = "/movie/deleteMovie?";
			var qur = '';

			if (confirm('선택하신 영화' + delchk.length + '개의 항목을 삭제하시겠습니까?'))
				;
			{
				for (var i = 0; i < delchk.length; i++) {
					if (i == (delchk.length - 1)) {
						qur += 'm_code=' + delchk[i];
					} else {
						qur += 'm_code=' + delchk[i] + '&';
					}

				}

				loc = loc + qur;
				location.href = loc;
			}
		}

	}

	function delMovie() {
		var movieCode = document.getElementById('delMovie').value;
		var movieName = document.getElementById('Mem_name').value;

		if (confirm('영화 제목:' + movieName + '\n영화코드:' + movieCode
				+ ' 을(를) 삭제하시겠습니까?')) {
			location.href = "/movie/deleteMovie?m_code=" + movieCode;
		}

	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>영화 목록</h1>
		</div>
	</div>

	<!-- content -->
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<!-- 출력리스트 헤드부분 -->
		<div style="padding-top: 50px;">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th style="width: 3%; text-align: center; vertical-align: middle"><input
						type="checkbox" name="chkAll" id="chkAll" onclick="allCheck()"></th>
					<th style="width: 5%; text-align: center; vertical-align: middle">영화코드</th>
					<th
						style="width: 160px; text-align: center; vertical-align: middle">포스터</th>
					<th style="width: 7%; text-align: center; vertical-align: middle">영화제목</th>
					<th style="width: 7%; text-align: center; vertical-align: middle">감독</th>
					<th style="width: 10%; text-align: center; vertical-align: middle">배우</th>
					<th style="width: 10%; text-align: center; vertical-align: middle">영화사</th>
					<th style="width: 7%; text-align: center; vertical-align: middle">런닝타임</th>
					<th style="width: 7%; text-align: center; vertical-align: middle">개봉일</th>
					<th style="text-align: center; vertical-align: middle;">줄거리</th>
					<th style="width: 5%; text-align: center; vertical-align: middle">비고<br>(수정/삭제)
					</th>

				</tr>

				<c:if test="${not empty movieList}">
					<c:forEach var="movie" items="${movieList}">

						<tr>
							<td style="text-align: center; vertical-align: middle"><input
								type="checkbox" name="chk" id="chk" value="${movie.m_code}"></td>
							<td style="text-align: center; vertical-align: middle">${movie.m_code}</td>
							<td style="text-align: center; vertical-align: middle"><img
								src="<spring:url value='/movie/image/${movie.m_posterImg}'/>"
								style="width: 100%"></td>
							<td style="text-align: center; vertical-align: middle"><input
								type="hidden" name="Mem_name" id="Mem_name">${movie.m_name}</td>
							<td style="text-align: center; vertical-align: middle">${movie.m_director}</td>
							<td style="text-align: center; vertical-align: middle">${movie.m_actor}</td>
							<td style="text-align: center; vertical-align: middle">${movie.m_company}</td>
							<td style="text-align: center; vertical-align: middle">${movie.m_time}</td>
							<td style="text-align: center; vertical-align: middle">${movie.m_playDate}</td>
							<td style="vertical-align: middle;">${movie.m_description}</td>
							<td style="text-align: center; vertical-align: middle"><a
								href="/movie/updateMovieForm?movieCode=${movie.m_code}">
									<button type="button" class="btn btn-info-formal">수정</button>
							</a><br> <br> <a
								href="/movie/deleteMovie?m_code=${movie.m_code}"><button
										type="button" class="btn btn-danger-delete" name="delMovie"
										id="delMovie" onclick="delMovie()" value="${movie.m_code}">삭제</button></a>
							</th>
						</tr>

					</c:forEach>
				</c:if>
				<c:if test="${empty movieList }">
				  없음
				</c:if>
			</table>
		</div>
		<div class="text-right">
			<a href="/movie/insertMovieForm">
				<button type="button" class="btn btn-success">영화 추가</button>
			</a>
			<a href="/movie/insertMovieFutureForm">
				<button type="button" class="btn btn-success">개봉예정 추가</button>
			</a> 
			<button type="button" name="delete" id="delete" class="btn btn-danger" onclick="delchk()">영화 삭제</button>
			<a href="/movie/adminMain">
				<button type="button" class="btn btn-dark">되돌아가기</button>
			</a>
		</div>

		<!--  페이징 처리  -->
		<div>
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<a class="page-link" href="/movie/getMovieList?pageNum=${pageMaker.startPage-1}">이전
							</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item"><a class="page-link" href="/movie/getMovieList?pageNum=${num}">${num}</a></li>

				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="/movie/getMovieList?pageNum=${pageMaker.endPage + 1}">다음
							</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />



</body>
</html>
