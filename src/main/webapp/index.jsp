<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<jsp:include page="/includes/boardList.jsp"></jsp:include>
		</div>
	</main>
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</body>
</html>