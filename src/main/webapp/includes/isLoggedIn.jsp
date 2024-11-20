<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
if (isLogin == true) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	return;
}
%>