<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="movie" value="${movieList}"/>
<c:set var="customer" value="${customer}"/>
<c:set var="customerID" value="${customer.id}"/>
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
	function delReview($id, $m_code, $review_num){
		var id = $id;
		var m_code = $m_code;
		var review_num = $review_num;
		
		var idchk = '${customerID}';
		
		if(id==idchk){
			location.href = "/movie/ReviewDelete?m_code="+m_code+"&review_num="+review_num;
		}else{
			alert('해당 아이디가 아니면 삭제 권한이 없습니다.');
		}
		
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	
	<div class="wrapper" style="width: 100%; max-width: 1440px; margin: 0 auto;">
		<div class="jumbotron">
			<div class="container">
				<h1>영화 상세 정보</h1>
			</div>
		</div>

		<hr style="border: 0; height: 2px; background: #ccc;">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="/movie/image/${movie.m_posterImg}" alt="Lights" style="width: 100%">
				</div>
			</div>
			<div class="col-md-6">
				&nbsp;&nbsp;
				<h1>
					${movie.m_name}
				</h1>
				&nbsp;&nbsp;
				<h5>
					&nbsp; ${movie.m_description}
				</h5>
				&nbsp;&nbsp;
				<h4>상영시간 : ${movie.m_time}</h4>
				&nbsp;&nbsp;
				<h4>감독 : ${movie.m_director}</h4>
				&nbsp;&nbsp;
				<h4>배우 : ${movie.m_actor} </h4>
				&nbsp;&nbsp;
				<h4>개봉 : ${movie.m_playDate}</h4>
				<br> <a href="/movie/startBook"><button type="button"
						class="btn btn-outline-warning col-md-5.5 center">예매하기</button></a>
			
				<c:if test="${sessionScope.userId != null }">		
					<a href="/movie/updateMovieForm">
						<button type="button" class="btn btn-outline-danger col-md-5.5 center">수정하기</button>
					</a>
				</c:if>
			</div>
		</div>


		<!-- 리뷰 목록 -->
		<div class="wrapper" style="width: 100%; max-width: 1440px; margin: 0 auto;">
			<div style="padding-top: 50px;">
				<span style="font-size: 15px; padding:1%">관람객 평균 평점 : <b>${total_review_Avg}</b>점</span>
				<table class="table">
					<tr>
						<th style="text-align: center">순번</th>
						<th style="text-align: center">별점</th>
						<th style="text-align: center">리뷰</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">등록일</th>
						<th style="text-align: center">비고</th>
					</tr>

			    	<c:forEach var="reviewList" items="${ReviewList}">
						<tr>
							<th style="text-align: center; vertical-align: middle">${reviewList.review_num }</th>
							<th style="text-align: center; vertical-align: middle">
								<c:set var="starInt" value="${reviewList.star }"/>
									<c:choose>
			    						<c:when test="${starInt == 0 }">
			    							☆☆☆☆☆
			    						</c:when>
			    						<c:when test="${starInt == 1 }">
			    							★☆☆☆☆
			    						</c:when>
			    						<c:when test="${starInt == 2 }">
			    							★★☆☆☆
			    						</c:when>
			    						<c:when test="${starInt == 3 }">
			    							★★★☆☆
			    						</c:when>
			    						<c:when test="${starInt == 4 }">
			    							★★★★☆
			    						</c:when>
			    						<c:when test="${starInt == 5 }">
			    							★★★★★
			    						</c:when>
			    					</c:choose>
							</th>
							<th style="text-align: center; vertical-align: middle">${reviewList.content }</th>
							<th style="text-align: center; vertical-align: middle">${reviewList.id}</th>
							<th style="text-align: center; vertical-align: middle">${reviewList.regist_day }</th>
							<th style="text-align: center; vertical-align: middle">
								<button type="button" class="btn btn-info-delete" name="delBtn"
											id="delBtn" onclick="delReview('${reviewList.id}', '${movie.m_code }', '${reviewList.review_num }')">삭제
								</button>
							</th>		
						</tr>	
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!--  페이징 처리  -->
		<div>
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="/movie/movieinfo?m_code=${movie.m_code}&pageNum=${pageMaker.startPage-1}">이전</a>
					</li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item"><a class="page-link" href="/movie/movieinfo?m_code=${movie.m_code}&pageNum=${num}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="/movie/movieinfo?m_code=${movie.m_code}&pageNum=${pageMaker.endPage + 1}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<hr><hr size="10px">
		
		<!-- list [vo, vo, .....,]일때 하나씩 뽑아내는방법 -->
		<%-- <c:forEach var="movie" items="${movieList}"> --%>
		<!-- 리뷰작성 -->
		<table class="table">
			<tr>
				<th style="text-align: center">리뷰 작성</th>
			</tr>
		</table>
		<hr size="10px">
			<form action="ReviewInsert" method="post" name="review" id="review">
				<input type="hidden" id="m_code" name="m_code" value="${movie.m_code}" /> 
				<div class="starRev">
					<div class="col-sm-3">
						<label style="font-weight: bold">작성자</label>
						&nbsp;&nbsp;
						<input type="hidden" name="id" id="id" value="${customer.id }">${customer.id }
					</div>
				</div>
				
				<div class="starRev">
						<label style="font-weight: bold">&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;&nbsp;점</label>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" name="star" id="star" value="0" required>☆☆☆☆☆</label>
						<label><input type="radio" name="star" id="star" value="1">★☆☆☆☆</label>
						<label><input type="radio" name="star" id="star" value="2">★★☆☆☆</label>
						<label><input type="radio" name="star" id="star" value="3">★★★☆☆</label>
						<label><input type="radio" name="star" id="star" value="4">★★★★☆</label>
						<label><input type="radio" name="star" id="star" value="5">★★★★★</label>
					
				</div>
				
				<label class="col-sm-3" style="font-weight: bold">리&nbsp;&nbsp;&nbsp;&nbsp;뷰</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="content" name="content" style="width:70%;" placeholder="한 줄 평을 입력하세요" required>
					<input type="submit" value="리뷰등록" class="btn btn-dark center">
				</div>
		</form>

		


	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>