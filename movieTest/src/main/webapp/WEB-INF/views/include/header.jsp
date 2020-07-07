<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center mb-0">
		<h1>Seoul Cinema HOME</h1>
		<p>��ȭ! ��� �� �̻��� ����</p>
	</div>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a href="/movie/" class="navbar-brand">Seoul Cinema</a> <!-- Toggle Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<!-- ����� �޴� -->
			

			<!-- �����ڿ� -->
			<c:choose>
				<c:when test="${sessionScope.admin != null }">
					<c:if test="${sessionScope.admin.power==1 }">
						<li class="nav-item"><a href="/movie/addAdmin" class="nav-link">������ ����</a></li>
						<li class="nav-item"><a href="/movie/manageAdmin" class="nav-link">������ ����</a></li>
						<li class="nav-item"><a href="/movie/logout" class="nav-link">�α׾ƿ�</a></li>
					</c:if>
					<c:if test="${sessionScope.admin.power==2 }">
						<li class="nav-item"><a href="/movie/getMovieList" class="nav-link">��ȭ ����</a></li>
						<li class="nav-item"><a href="/movie/managecinema" class="nav-link">��ȭ�� ����</a></li>
						<li class="nav-item"><a href="/movie/manageTimetable" class="nav-link">�󿵽ð�ǥ ����</a></li>
						<li class="nav-item"><a href="/movie/logout" class="nav-link">�α׾ƿ�</a></li>
					</c:if>
					<c:if test="${sessionScope.admin.power==3 }">
						<li class="nav-item"><a href="/movie/managemember"class="nav-link">ȸ�� ����</a></li>
						<li class="nav-item"><a href="/movie/logout" class="nav-link">�α׾ƿ�</a></li>
					</c:if>
					<span>${sessionScope.admin.name}�� ȯ���մϴ�.</span>
				</c:when>
				<c:when test="${sessionScope.customer != null }">
					<li class="nav-item"><a href="/movie/now" class="nav-link">��ȭ</a></li>
					<li class="nav-item"><a href="/movie/startBook" class="nav-link">����</a></li>
					<li class="nav-item"><a href="/movie/theater" class="nav-link">����</a></li>
					<li class="nav-item"><a href="/movie/mypage" class="nav-link">����������</a></li>
					<li class="nav-item"><a href="/movie/logout" class="nav-link">�α׾ƿ�</a></li>
					<span>${sessionScope.customer.name}�� ȯ���մϴ�.</span>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="/movie/now" class="nav-link">��ȭ</a></li>
					<li class="nav-item"><a href="/movie/startBook" class="nav-link">����</a></li>
					<li class="nav-item"><a href="/movie/theater" class="nav-link">����</a></li>
					<li class="nav-item"><a href="/movie/joinForm" class="nav-link">ȸ������</a></li>
					<li class="nav-item"><a href="/movie/login" class="nav-link">�α���</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</nav>
</body>
</html>