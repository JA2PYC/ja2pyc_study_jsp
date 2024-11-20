<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='/includes/isLoggedIn.jsp'%>
<%
String errorMsg = request.getAttribute("registError") != null ? request.getAttribute("registError").toString() : "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JA2PYC Register</title>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/register.css' />
</head>
<body>
	<main>
		<div class='errorMsg'><%=errorMsg%></div>
		<form
			action="<%=request.getContextPath()%>/includes/registerProcess.jsp"
			method='post'>
			<table>
				<thead>
					<tr>
						<td colspan="2">회원가입</td>
					<tr>
				</thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type='text' name='memberId'></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type='password' name='memberPw'></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type='password' name='memberPwCf'></td>
					</tr>
					<tr>
						<td>이 름</td>
						<td><input type='text' name='memberName'></td>
					</tr>
					<tr>
						<td>성 별</td>
						<td><input type='radio' name='memberGender' id='gender_male'
							value='male'> <label for='gender_male'>남성</label> <input
							type='radio' name='user_gender' id='gender_female' value='female'>
							<label for='gender_female'>여성</label></td>
					</tr>
					<tr>
						<td>집전화</td>
						<td><input type='number' name='memberHome'></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type='number' name='memberPhone'></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type='email' name='memberEmail'></td>
					</tr>
					<tr>
						<td colspan='2'>
							<button type='submit' class='submit_register'>가입하기</button>
							<button type='button' class='cancel_register'
								onclick='location.href="<%=request.getContextPath()%>/index.jsp"'>취
								소</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</main>
</body>
</html>