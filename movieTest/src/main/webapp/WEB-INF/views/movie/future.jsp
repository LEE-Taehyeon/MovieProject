<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1>개봉예정 영화</h1>
		</div>
	</div>
	<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto;">
	<div class="row">
	
	<c:if test="${not empty movieList}">
	<c:forEach var="movie" items="${movieList}">
	<c:set var="m_code" value="${movie.m_code}"/>
	<c:if test = "${fn : contains(m_code, 'MF')}">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/movie/movieinfo?m_code=${movie.m_code}">
          <img src='/movie/image/${movie.m_posterImg}' alt="Lights" style="width:100%" class="img-thumbnail" >
        </a>
        <a href="/movie/startBook"><button type="button" class="btn btn-outline-warning col-md-5.5 center" >예매하기</button></a> 
        <a href="/movie/movieinfo?m_code=${movie.m_code}"><button type="button" class="btn btn-outline-dark col-md-5.5 center">리뷰쓰기</button></a> 
      </div>
    </div>
    </c:if>
    <br>
    
    </c:forEach>
    </c:if>
   </div>
  
  <br>
  <hr style="border: 0; height: 3px; background: #ccc;">
  <br>

 	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>