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
<link rel="stylesheet" href="./resources/css/mybootstrap.min.css">
<script src="./resources/js/jquery.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String movieCode = request.getParameter("movieCode");
	%>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>영화 수정</h1>
		</div>
	</div>

	<!-- content -->
	<div class="wrapper"
		style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="container">
			<form action="/movie/updateMovie" class="form-horizontal"
				method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2">영화코드</label>
					<div class="col-sm-3">
						<input type="text" id="m_code" name="m_code"
							class="form-controlz" value="${movie.m_code}"
							readonly required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">영화제목</label>
					<div class="col-sm-3">
						<input type="text" id="m_name" name="m_name"
							class="form-control" value="${movie.m_name}"
							required autofocus>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">감독</label>
					<div class="col-sm-3">
						<input type="text" id="m_director" name="m_director"
							class="form-control" value="${movie.m_director}"
							required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">배우</label>
					<div class="col-sm-3">
						<input type="text" id="m_actor" name="m_actor"
							class="form-control" value="${movie.m_actor}"
							required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">영화사</label>
					<div class="col-sm-3">
						<input type="text" id="m_company" name="m_company"
							class="form-control" value="${movie.m_company}"
							required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">런닝타임</label>
					<div class="col-sm-3">
						<input type="text" id="m_time" name="m_time"
							class="form-control" value="${movie.m_time}"
							placeholder="(min)" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">개봉일</label>
					<div class="col-sm-3">
						<input type="text" id="m_playDate" name="m_playDate"
							class="form-control" value="${movie.m_playDate}"
							required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">줄거리</label>
					<div class="col-sm-3">
						<textarea cols="50" rows="10" id="m_description" name="m_description"
							class="form-controls" value="${movie.m_description}"
							required></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">영화 포스터</label>
					<div class="col-sm-3">
						<input type="file" id="m_poster" name="m_poster"
							class="form-controls" value="${movie.m_posterImg}"
							required>
					</div>
				</div>
				<input type="submit" class="btn btn-primary" value="영화 수정">
				<a href="adminMovie.jsp" class="btn btn-info">되돌아가기</a>
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />



</body>
</html>
