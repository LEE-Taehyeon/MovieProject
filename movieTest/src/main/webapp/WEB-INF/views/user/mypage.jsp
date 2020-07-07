<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
fieldset {
	border: 1px solid #ddd !important;
	margin: 0;
	xmin-width: 0;
	padding: 10px;
	position: relative;
	border-radius: 4px;
	background-color: #f5f5f5;
	padding-left: 10px !important;
}

legend {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 0px;
	width: 35%;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 5px 5px 5px 10px;
	background-color: #ffffff;
}
tr{}
</style>
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
			<h1>마이페이지</h1>
		</div>
	</div>
<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto;">
	<div class="container">
		<fieldset class="col-sm-12">
			<legend>&nbsp;회원 정보</legend>
			<form>
			<!-- https://doublesprogramming.tistory.com/93 -->
				<div class="form-group">
					<label for="id">아이디</label> 
					<input class="form-control" name="id" id="id" placeholder="아이디"  readonly
					value="${customer.id}">
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input class="form-control" readonly 
					name="name" id="name" placeholder="이름" 
						value="${customer.name}">
				</div>
				
				<div class="form-group">
					<label for="name">비밀번호</label> <input class="form-control" readonly 
				type="password"	name="password" id="password" placeholder="비밀번호" 
						value="${customer.password}">
				</div>

				<div class="form-group">
					<label for="gender">성별</label> <input class="form-control"  
					id="gender" name="gender" placeholder="gender" readonly
						value="${customer.gender}">
				</div>
				
				<div class="form-group">
					<label for="phone">전화번호</label> <input class="form-control" 
						id="phone" placeholder="000-0000-0000" readonly
						value="${customer.phone}">
				</div>
				
				<div class="form-group">
					<label for="birth">생일</label> <input class="form-control" 
					id="birth" name="birth" placeholder="0000-00-00" readonly
						value="${customer.birth}">
				</div>
				
				<div class="form-group">
					<label for="mail">메일</label> <input class="form-control" 
						id="mail" placeholder="0000@00000" readonly
						value="${customer.mail}">
				</div>
				
				<div class="form-group">
					<label for="zipcode">우편번호</label> <input class="form-control" 
						id="zipcode" placeholder="00000" readonly
						value="${customer.zipcode}">
				</div>
				
				<div class="form-group">
					<label for="address">주소</label> <input class="form-control" 
						id="address" placeholder="000000000" readonly
						value="${customer.address}">
				</div>
				
				<div class="form-group">
					<label for="addressdetail">상세주소</label> <input class="form-control" 
						id="addressdetail" placeholder="000000000" readonly
						value="${customer.addressdetail}">
				</div>
				
				<div class="form-group">
					<label for="addressextra">나머지주소</label> <input class="form-control" 
					id="addressextra" placeholder="000000000" readonly
						value="${customer.extraAddress}">
				</div>
				
				<div class="form-group row">
					<div class="offset-sm-2 col-sm-7 pull-right">
						<a href="update">
							<button type="button" class="btn btn-dark btn-sm  btn-block ">정보수정</button>
						</a>
						<a href="/movie/">
							<button type="button" class="btn btn-primary btn-sm btn-block ">돌아가기</button>
						</a>
						<a href="/movie/delete"><button type="button" class="btn btn-warning btn-sm btn-block ">
						탈퇴
						</button>
						</a>
					</div>
				</div>
				
			</form>
		</fieldset>
	</div><br><br><hr><br>

		<div class="container">
		<fieldset class="col-sm-12">
			<legend>&nbsp;예매 목록</legend>
			<table class="table table-bordered">
	<tr><td>영화</td><td>영화관</td><td>상영시간</td><td>상영관</td>
					<td>좌석 수</td><td>좌석번호</td><td>예매가격</td></tr>		
			<c:forEach var="booking" items="${booking }">	
<tr>
	<td>
	<c:out value="${booking.m_name}"/></td>
	<td><c:out value="${booking.theater_name}"/></td>
	<td><fmt:formatDate var="start_time" pattern="yyyy-MM-dd HH:mm" value="${booking.screening_date}"/>
	<c:out value="${start_time}"/></td>
	<td><c:out value="${booking.screen_name}"/></td>
	<td><c:out value="${booking.seats_num}"/></td>
	<td><c:out value="${booking.seat_code}"/></td>
	<td><c:set var="price" value="${booking.booking_price}"/>
	<fmt:formatNumber value="${price}" />원</td>
</tr>
	</c:forEach>
		<hr>
</table>
<hr><br>
</fieldset>
</div><hr>

	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>