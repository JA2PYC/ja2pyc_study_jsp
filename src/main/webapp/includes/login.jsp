<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='/includes/isLoggedIn.jsp'%>
<%
String errorMsg = request.getAttribute("loginError") != null ? request.getAttribute("loginError").toString() : "";
%>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/login.css' />
<div><%=errorMsg%></div>
<form action='<%=request.getContextPath()%>/includes/loginProcess.jsp'
	method='post'>
	<table class='login'>
		<thead>
			<tr>
				<td colspan='2'>로그인</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디 :</td>
				<td><input type='text' name='user_id' placeholder='아이디'></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type='password' name='user_pw' placeholder='비밀번호'></td>
			</tr>
			<tr>
				<td><button type='button'
						onclick='location.href="<%=request.getContextPath()%>/includes/register.jsp"'>회원가입</button></td>
				<td><button type='submit'>로그인</button></td>
			</tr>
			<tr>
				<td colspan='2'><a
					href='<%=request.getContextPath()%>/includes/boardList.jsp'>게시판</a></td>
			</tr>
		</tbody>
	</table>
</form>