<%@ page import='db_func.PostDTO' %>
<%@ page import='db_func.PostDAO' %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Boolean isLoggedIn = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;

if (isLoggedIn != true) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
}

String userId = session.getAttribute("UserId").toString();
String postTitle = request.getParameter("post_title");
String postContent = request.getParameter("post_content");

PostDTO postDTO = new PostDTO();
postDTO.setPostTitle(postTitle);
postDTO.setPostContent(postContent);
postDTO.setPostWriter(userId);

PostDAO postDAO = new PostDAO();
Boolean writeResult = postDAO.writePost(postDTO);
postDAO.closeJDBC();

if (writeResult == true){
	response.sendRedirect(request.getContextPath() + "/index.jsp");
} else {
	response.sendRedirect(request.getContextPath() + "/includes/write.jsp");
}

%>