<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Boolean isLoggedIn = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
%>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/base_style.css' />
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/header.css' />
<header class='ja2pyc_header'>
	<div class='header_title'><a href='<%=request.getContextPath() %>'>Header Title</a></div>
	<div class='header_nav'>
		<ul>
			<%
			if (isLoggedIn == false) {
			%>
			<li><a
				href='<%=request.getContextPath()%>/includes/register.jsp'>회원가입</a></li>
			<li><a href='<%=request.getContextPath()%>/includes/login.jsp'>로그인</a></li>
			<%
			} else {
			%>
			<li><%=session.getAttribute("UserName") != null ? session.getAttribute("UserName") : ""%></li>
			<li><a href='<%=request.getContextPath()%>/includes/logout.jsp'>로그아웃</a></li>
			<%
			}
			%>
		</ul>
	</div>
</header>