<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/css/mvcBaord.css' />
<div>
	<h2>MVC Board</h2>
	<div>
		<table>
			<thead>
				<tr>
					<th>번 호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardList }">
						<tr>
							<td colspan='5'>빈 게시판</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList }" var="row" varStatus="loop">
							<tr>
								<td>${row.idx }</td>
								<td>${row.title }</td>
								<td>${row.name }</td>
								<td>${row.visitcount }</td>
								<td>${row.postdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
