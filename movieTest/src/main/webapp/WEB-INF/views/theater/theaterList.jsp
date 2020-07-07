<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script>
function changeTheaterArea(theater_area){
	$.ajax({
		url : "/movie/TheaterNameSelect",
		type : "POST",
		data : {theater_area:theater_area},
		success : function(data) {
			var str = "";
			for(var i=0; i<data.length; i++){
				str += "<input type='button' name="+data[i]['theater_name']+ "id="+data[i]['theater_name']+" value="+data[i]['theater_name']+">";
            }
		   $('#theater_name').html(str);
		},
		error : function() {
			alert("simpleWithObject err");
		}
	})
}
	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>극장</h1>
		</div>
	</div>
	<div class="wrapper" style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="row">
			<c:if test="${not empty theaterList}">
				<c:forEach var="thaeterList" items="${theaterList}">
					<input type="button" name="theater_area" id="theater_area"
						value="${thaeterList.theater_area}"
						onclick="changeTheaterArea('${thaeterList.theater_area}')">
				</c:forEach>
			</c:if>
		</div>

		<div class="row">
			<div id="theater_name"></div>
		</div>

		<br>
		<hr style="border: 0; height: 3px; background: #ccc;">
		<br>

	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>