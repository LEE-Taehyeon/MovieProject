<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.select-script {
	position: relative;
	width: 200px;
	height: 40px;
	line-height: 40px;
	border: 1px solid #606976;
	border-radius: 4px;
	text-transform: uppercase;
	background: #fff;
}

.select-script label {
	position: absolute;
	width: 90%;
	font-size: .86em;
	color: #606976;
	top: 0;
	left: 0;
	padding: 0 5%;
}

.select-script label:after {
	content: '▼';
	width: 40px;
	height: 40px;
	position: absolute;
	top: 0;
	right: 0;
	font-size: .76em;
	color: #fff;
	text-align: center;
	background: #606976;
}

.select-script select {
	width: 100%;
	height: 40px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0) /* IE 8 */;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="select-box select-script">
		<label for="selectbox">선택해 주세요</label> <select id="selectbox"
			title="선택 구분">
			<option selected="selected">선택해 주세요</option>
			<option>선택1</option>
			<option>선택2</option>
			<option>선택3</option>
			<option>선택4</option>
		</select>
	</div>

</body>
</html>