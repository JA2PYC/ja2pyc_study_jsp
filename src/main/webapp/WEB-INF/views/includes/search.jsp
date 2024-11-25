<%@ page import='java.util.Map' %>
<%@ page import='java.util.HashMap' %>
<%@ page import='java.util.List' %>
<%@ page import='db_func.PostDAO'%>
<%@ page import='db_func.PostDTO'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String searchType = request.getParameter("search_type");
String searchKey = request.getParameter("search_key");
String searchTesy = request.getParameter("test");
Map<String, Object> searchMap = new HashMap<String, Object>();
searchMap.put("search_type", searchType);
searchMap.put("search_key", searchKey);
PostDAO postDAO = new PostDAO();

List<PostDTO> postDTO = postDAO.searchList(searchMap);
postDAO.closeJDBC();
request.setAttribute("searchResult", postDTO);
request.getRequestDispatcher("/index.jsp").forward(request, response);
%>