<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.removeAttribute("isLogin");
session.removeAttribute("UserName");
session.invalidate();
response.sendRedirect(request.getContextPath() + "/index.jsp");
%>