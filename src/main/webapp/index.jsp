<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String targetPage = request.getParameter("page");
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<title>JA2PYC Board</title>
</head>
<body>
	<jsp:include page="/includes/header.jsp"></jsp:include>
	<main>
		<h1>JA2PYC Board</h1>
		<hr>
		<div>
			<%
			if (targetPage == null || targetPage.isEmpty() || targetPage.equals("front")) {
			%>
			<jsp:include page="/includes/boardList.jsp"></jsp:include>
			<%
			} else if (targetPage.equals("write")) {
			%>
			<jsp:include page="/includes/write.jsp"></jsp:include>
			<%
			} else if (targetPage.equals("search")) {
			%>
			<jsp:include page="/includes/search.jsp"></jsp:include>
			<%
			} else if (targetPage.equals("login")) {
			%>
			<jsp:include page="/includes/login.jsp"></jsp:include>
			<%
			} else if (targetPage.equals("register")) {
			%>
			<jsp:include page="/includes/register.jsp"></jsp:include>
			<%
			} else {
			%>
			<jsp:include page="/includes/boardList.jsp"></jsp:include>
			<%
			}
			%>
		</div>
	</main>
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</body>
</html>