<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto; white-space: nowrap;">
<h1>예약 결과</h1>
<p>영화 : <c:out value="${bookingVO.m_name}"/></p><br>
<p>영화관 : <c:out value="${bookingVO.theater_name}"/></p><br>
<fmt:formatDate var="start_time" pattern="yyyy-MM-dd HH:mm" value="${bookingVO.screening_date}"/>
<p>상영시간 : <c:out value="${start_time}"/></p><br>
<p>상영관 : <c:out value="${bookingVO.screen_name}"/></p><br>
<p>좌석 수 : <c:out value="${bookingVO.seats_num}"/></p><br>
<p>좌석번호 : <c:out value="${bookingVO.seat_code}"/></p><br>
<c:set var="price" value="${bookingVO.booking_price}"/>
<p>예매가격 : <fmt:formatNumber value="${price}" />원</p><br>
<form action="/movie/"><input type="submit" value="확인"> </form>
<jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>