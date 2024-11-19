<%@ page import='java.util.List'%>
<%@ page import='java.util.Map'%>
<%@ page import='java.util.HashMap'%>
<%@ page import='db_func.PostDAO'%>
<%@ page import='db_func.PostDTO'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PostDTO> postLists;
if (request.getAttribute("searchResult") != null) {
	postLists = (List<PostDTO>) request.getAttribute("searchResult");
} else {
	PostDAO dao = new PostDAO();
	Map<String, Object> postParam = new HashMap<String, Object>();

	String perPageNum = request.getParameter("perPageNum") != null ? request.getParameter("perPageNum") : "20";
	postParam.put("perPageNum", perPageNum);

	postLists = dao.selectList(postParam);
	dao.closeJDBC();
}
%>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/boardList.css'>
<table class='board_list'>
	<thead>
		<tr>
			<td>번 호</td>
			<td>제 목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<%
		if (postLists == null || postLists.isEmpty()) {
		%>
		<tr>
			<td colspan='5'>등록된 게시물이 없습니다.</td>
		</tr>
		<%
		} else {
		for (PostDTO dto : postLists) {
		%>
		<tr>
			<td><%=dto.getPostNum()%></td>
			<td><%=dto.getPostTitle()%></td>
			<td><%=dto.getPostWriter()%></td>
			<td><%=dto.getPostDate()%></td>
			<td><%=dto.getPostViewCount()%></td>
		</tr>
		<%
		}
		}
		%>
		<tr>
			<td colspan='5'>
				<div>
					<form action="<%=request.getContextPath()%>/includes/search.jsp"
						method='get'>
						<label for='search_type'>검색</label> <select name="search_type"
							id='search_type'>
							<option value='title'>제 목</option>
							<option value='writer'>작성자</option>
						</select> <input type='text' name='search_key' placeholder='Search' />
						<button type='submit' onclick=''>검색</button>
					</form>
				</div>
				<div>
					<button type='button'
						onclick='location.href="<%=request.getContextPath()%>/includes/write.jsp"'>글쓰기</button>
				</div>
			</td>
		</tr>
	</tbody>
</table>
