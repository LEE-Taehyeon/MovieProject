<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="customerList" value="${customerList}"/>
<c:set var="total_customer" value="${total_customer}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/mybootstrap.min.css" />
<meta charset="EUC-KR">
<title>영화 보여주는 창</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	function allCheck(){
		if($('#chkAll').prop("checked")){
			$("input[name=chk]").prop("checked", true);
		}else{
			$("input[name=chk]").prop("checked", false);
		}
	}
	
	function delchk(){
		var delchk = []; // key 값을 담을 배열
		$('#chk:checked').each(function(){//each문 각각 반복문
			delchk.push($(this).val());//$(this):체크박스의 0,1,2...번째 각각의 항목들을 가리킴
		});
		
		if(delchk.length==0){
			alert('선택한 회원이 없습니다.');
			return false;
		}else{
			var loc ="/movie/CustomerDelete?";
			var qur = '';
			
			if(confirm('선택하신 회원 '+delchk.length+'명을 삭제하시겠습니까?')){
				for(var i = 0;i<delchk.length;i++){
					if(i==(delchk.length-1)){
						qur+='id='+delchk[i];
					}else{
						qur+='id='+delchk[i]+'&';
					}
				}
				
				loc=loc+qur;
				location.href=loc; 
			}
		}
	}
	
	function delMember($id, $name){
		var id = $id;
		var name = $name;
		
		if(confirm('아이디:'+id+'\n이름:'+name+' 님을 삭제하시겠습니까?')){
			location.href = "/movie/CustomerDelete?id="+id;
		}
	}
	
</script>

</head>
<body>

	<jsp:include page="../include/header.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1>회원 관리</h1>
			</div>
		</div>
		<!-- content -->
		<div class="wrapper" style="width: 100%; max-width: 1440px; margin: 0 auto;">
			<div style="padding-top: 50px;">
				<div style="float:right">전체 회원수: ${total_customer}명</div>
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th style="text-align: center; width: 5%; vertical-align: middle">
							<input type="checkbox" name="chkAll" id="chkAll" onclick="allCheck()">
						</th>
						<th style="width: 8%; text-align: center; vertical-align: middle">아이디</th>
						<th style="width: 13%; text-align: center; vertical-align: middle">비밀번호</th>
						<th style="width: 13%; text-align: center; vertical-align: middle">이름</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">성별</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">생년월일</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">이메일</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">전화번호</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">우편번호</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">주소</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">상세주소1</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">상세주소2</th>
						<th style="width: 18%; text-align: center; vertical-align: middle">가입일</th>
						<th style="width: 8%; text-align: center; vertical-align: middle">삭제</th>
					</tr>
					
					
					<c:if test="${not empty customerList}">
			    		<c:forEach var="customerList" items="${customerList}">
							<tr>
								<th style="text-align: center; vertical-align: middle">
									<input type="checkbox" name="chk" id="chk" value="${customerList.id }">
								</th>
								<th style="text-align: center; vertical-align: middle">${customerList.id }</th>
								<th style="text-align: center; vertical-align: middle">****</th>
								<th style="text-align: center; vertical-align: middle">${customerList.name }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.gender }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.birth }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.mail }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.phone }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.zipcode }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.address }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.addressdetail }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.extraAddress }</th>
								<th style="text-align: center; vertical-align: middle">${customerList.regdate }</th>
								<th style="text-align: center; vertical-align: middle">
									<button type="button" class="btn btn-info-delete" name="delBtn"
												id="delBtn" onclick="delMember('${customerList.id }', '${customerList.name }')">삭제
									</button>
								</th>		
							</tr>	
						</c:forEach>
					</c:if>
				</table>
			</div>
			<button type="button" name="delete" id="delete" class="btn btn-info-delete" onclick="delchk()">회원 삭제</button>
			<a href="/movie/">
				<button type="button" name="backPage" id="backPage" class="btn">되돌아가기</button>
			</a>
		</div>
		
		<!--  페이징 처리  -->
		<div>
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<a class="page-link" href="/movie/managemember?pageNum=${pageMaker.startPage-1}">이전
							</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item"><a class="page-link" href="/movie/managemember?pageNum=${num}">${num}</a></li>

				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="/movie/managemember?pageNum=${pageMaker.endPage + 1}">다음
							</a></li>
				</c:if>
			</ul>
		</div>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>







