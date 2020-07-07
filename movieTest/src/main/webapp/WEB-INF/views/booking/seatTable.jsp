<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%String seatForm = request.getParameter("result"); %>

<%  if(seatForm.equals("A")){
		%>
		<jsp:include page="A.jsp"></jsp:include>
		<%
	}else if(seatForm.equals("B")){
		%>
		<jsp:include page="B.jsp"></jsp:include>
		<%
	} %>