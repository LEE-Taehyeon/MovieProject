<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	function allCheckAlpa(alpa){
		var alpabet = alpa
		for(var i=1;i<=20;i++){
			if ($('#allChk'+alpabet).prop("checked")) {
				document.getElementById(alpabet+i).style.backgroundColor = "green";
				$('input[name='+alpabet+i+']').addClass("selected");
			} else {
				document.getElementById(alpabet+i).style.backgroundColor = "white";
				$('input[name='+alpabet+i+']').removeClass("selected");
			}
		}
	}
	
	function allCheckNum(num){
		var number = num;
		for(var i=0;i<26;i++){
			if ($('#allChk'+number).prop("checked")) {
				document.getElementById(String.fromCharCode('A'.charCodeAt()+i)+number).style.backgroundColor = "green";
				$('input[name='+String.fromCharCode('A'.charCodeAt()+i)+number+']').addClass("selected");
			} else {
				document.getElementById(String.fromCharCode('A'.charCodeAt()+i)+number).style.backgroundColor = "white";
				$('input[name='+String.fromCharCode('A'.charCodeAt()+i)+number+']').removeClass("selected");
			}
		}
	}
	
	function clickBtn(id){
		var getId = id;
		if($("input[name="+getId+"]").hasClass("selected")===true){
			document.getElementById(getId).style.backgroundColor = "white";
			$("input[name="+getId+"]").removeClass("selected");
		}else{
			document.getElementById(getId).style.backgroundColor = "green";
			$("input[name="+getId+"]").addClass("selected");
		}
	}
	
</script>
</head>
<body>
<h2>좌석생성</h2>
<table>
<tr>
<td></td>
<%
	for(int i=1;i<=20;i++){
%>
		<td><input type="checkbox" name="allChk<%=i %>" id="allChk<%=i %>" onclick="allCheckNum('<%=i %>')"><%=i %></td>
<%
	}
%>
</tr>
	<%
	for(int i=0;i<26;i++){
		char ch = 'A';
	 %>
	<tr>
	<td><input type="checkbox" name="allChk<%=(char)(ch+i) %>" id="allChk<%=(char)(ch+i) %>" onclick="allCheckAlpa('<%=(char)(ch+i) %>')"><%=(char)(ch+i) %></td>
		<%
		for(int j=1;j<=20;j++){
		%>
			<td><input type="button" name="<%=(char)(ch+i) %><%=j %>" id="<%=(char)(ch+i) %><%=j %>" style="background-color:white" onclick="clickBtn('<%=(char)(ch+i) %><%=j %>')"></td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>

</table>

</body>
</html>





















