<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<script src="${request.contextpath}/resources/js/jquery-3.4.1.min.js"></script>
<script>/* 매진 여부 확인 */
var res = parseInt("${fn:length(seatList)}");/* 예약좌석 수 */
var total = parseInt("${screen.seats_total}");/* 해당 상영관 총 좌석 수  */

if(res>=total){/* 매진일 경우 뒤로가기 */
	alert("잔여 좌석이 없습니다.");
	history.back();
}
</script>
<script>/* 예약좌석 표시 */
window.onload = function(){
	<c:forEach items="${seatList}" var="seat">
	$('#${seat.seat_code}').removeClass("seat1");
	$('#${seat.seat_code}').addClass("seat1_res");
	</c:forEach>
	$button = $(".seat1_res").attr("disabled", true); 

}

</script>
<script>/* 좌석 선택/취소 및 예약 결과 출력 */
$(function(){
	$(".seat1_on").click(function(){//좌석 취소
		$(this).toggleClass("seat1_on");
		$(this).toggleClass("seat1");
		
		// 선택좌석 출력
		var seat = $(".seat1_on");
		var len = seat.length-1;//선택한 좌석 수, 예약 결과 테이블의 좌석 안내 제외(-1)

		var list = "";
		  
		for(var i=0;i<len;i++){
		  list += seat[i].value+" ";
		}
		  
		var str = "선택한 좌석 :" + list;
		  
		$('#list').html(str);
		$('#seat_code').val(list);
		$('#seats_num').val(len);
		
		//가격 출력
		var price = "가격:" + len*"${screen.screen_price}" + "원";
		$('#price').html(price);
		$('#booking_price').val(len*"${screen.screen_price}");
		
	});	
	
	$(".seat1").click(function(){//좌석 선택
		$(this).toggleClass("seat1_on");
		$(this).toggleClass("seat1");
		
		var len =  $(".seat1_on").length-1;//선택한 좌석 수, 예약 결과 테이블의 좌석 안내 제외(-1)
		
		if(len>8){//1회 최대 예약 좌석 8자리
			$(this).toggleClass("seat1_on");//
			$(this).toggleClass("seat1");//좌석 취소
			alert("예약은 최대 8자리까지 가능합니다");
		}
		// 선택좌석 출력
		var seat = $(".seat1_on");
		var len = seat.length-1;
		var list = "";
		  
		for(var i=0;i<len;i++){
		  list += seat[i].value+" ";
		}

		var str = "선택한 좌석 :" + list;
		$('#list').html(str);
		$('#seat_code').val(list);
		$('#seats_num').val(len);

		//가격 출력
		var price = "가격:" + len*"${screen.screen_price}" + "원";
		$('#price').html(price);
		$('#booking_price').val(len*"${screen.screen_price}");
	});
});
</script>
<style>
.seat0{/* 좌석 열 이름 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; color: black;
}
.seat1{/* 일반 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: lightgray;
}
.seat2{/* 통로 오른쪽 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: lightgray; margin-right: 50px;
}
.seat1_on{/* 선택 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: green;
}
.seat1_res{/* 예약 좌석 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; background-color: red; color: black;
}
.seat1_hid{/* 좌석 없는 곳 */
height: 30px; width: 30px; display: inline; padding: 10px,auto; visibility: hidden;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto; white-space: nowrap;">
<!-- 선택된 상영관에 따라 좌석페이지 include -->
<div style="display: inline-block;">
<c:if test="${timetable.screen_name=='A관'}"><jsp:include page="A.jsp"></jsp:include></c:if>
<c:if test="${timetable.screen_name=='B관'}"><jsp:include page="B.jsp"></jsp:include></c:if>
</div>
<!-- 예약 결과 테이블 -->
<div style="display: inline-block;">
<table class="table" style="margin-top: 50px">
<!-- 상영 시간표 정보 -->
<tr><td>
<c:out value="${timetable.m_name}"/>
<c:out value="${timetable.theater_area}"/>
<c:out value="${timetable.theater_name}"/>
<fmt:formatDate var="start_time" pattern="yyyy-MM-dd HH:mm" value="${timetable.start_time}"/>
<c:out value="${start_time}"/>
<c:out value="${timetable.screen_name}"/>
<%-- <c:out value="${timetable.timetable_code}"/> --%>
</td></tr>
<!-- 좌석 표시 안내 -->
<tr><td>
<div><button class="seat1" disabled="disabled"></button>예약 가능 좌석 </div>
<div><button class="seat1_on" disabled="disabled"></button>선택 좌석</div>
<div><button class="seat1_res" disabled="disabled"></button>예약 완료 좌석</div>
<!-- 예약 결과 -->
</td></tr>
<tr><td id="list">선택한 좌석:</td></tr>
<tr><td id="price">가격: 0원</td></tr>
</table>

<form action="/movie/bookResult" onsubmit="javascript:return chk()" method="post">
  <!-- 예약 코드 생성 -->
  <c:set var="today" value="<%=new java.util.Date()%>" />
  <c:set var="today1"><fmt:formatDate value="${today}" pattern="MMdd" /></c:set>
  <c:set var="code" value="<%=RandomStringUtils.randomAlphanumeric(5) %>"/>
  <c:set var="booking_code" value="B${today1}${code}"/><!-- 예약코드 : B + 예약날짜(4자리) + 난수(알파벳 대소문자&숫자 5자리) -->
  
  
  <input type="hidden" name="booking_code" id="booking_code" value="${booking_code}">
  <input type="hidden" name="customer_ID" id="customer_ID">
  <!-- <input type="hidden" name="customer_name" id="customer_name"> -->
  <input type="hidden" name="m_name" id="m_name" value="${timetable.m_name}">
  <input type="hidden" name="theater_name" id="theater_name" value="${timetable.theater_name}">
  <input type="hidden" name="screen_name" id="screen_name" value="${timetable.screen_name}">
  <input type="hidden" name="seat_code" id="seat_code">
  <input type="hidden" name="seats_num" id="seats_num">
  <input type="hidden" name="screening_date" id="screening_date" value="${start_time}">
  <input type="hidden" name="booking_price" id="booking_price">
  <input type="button" value="뒤로가기" onClick="history.back()"> 
  <input type="submit" value="예약하기">
</form>
</div>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
<script>
function chk(){
	var seat = document.getElementById("seat_code").value;

	if(seat==""){//좌석을 선택하지 않았을 때
		alert("좌석을 선택해 주세요");
		return false;
	}else{
		return confirm("예약하시겠습니까?")

	}
	
}
</script>
</html>