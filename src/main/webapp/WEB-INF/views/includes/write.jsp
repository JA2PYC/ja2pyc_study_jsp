<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Boolean isLoggedIn = (Boolean) session.getAttribute("isLogin");
if (isLoggedIn == null || isLoggedIn != true) {
	response.sendRedirect(request.getContextPath() + "/login");
	return;
}

String userId = session.getAttribute("UserId").toString();
%>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/write.css' />
	<div>userId : <%=userId %></div>
<form
	action="<%=request.getContextPath()%>/writeProcess"
	method='post'>
	<table>
		<thead>
			<tr>
				<td>글쓰기</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><label for='post_title'>제 목</label></td>
				<td><input type='text' name='post_title' id='post_title' /></td>
			</tr>
			<tr>
				<td><label for='post_content'>내 용</label></td>
				<td><textarea name='post_content' id='post_content' rows="12" cols="30"></textarea></td>
			</tr>
			<tr>
			<td><button type='submit'>작성완료</button></td>
			<td><button type='button' onclick='location.href="<%=request.getContextPath()%>/index.jsp"'>취 소</button></td>
			</tr>
		</tbody>
	</table>
</form>