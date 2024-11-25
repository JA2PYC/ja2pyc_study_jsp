<%@ page import='db_func.MemberDTO' %>
<%@ page import='db_func.MemberDAO' %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memberId = request.getParameter("user_id") != null ? request.getParameter("user_id") : "";
String memberPw = request.getParameter("user_pw") != null ? request.getParameter("user_pw") : "";

if (memberId.isEmpty() || memberPw.isEmpty()){
	request.setAttribute("loginError", "아이디와 비밀번호를 입력해주세요.");
	request.getRequestDispatcher("/includes/login.jsp").forward(request, response);
	return;
}

MemberDTO memberDTO = new MemberDTO();
memberDTO.setMemberId(memberId);
memberDTO.setMemberPw(memberPw);

MemberDAO memberDAO = new MemberDAO();
MemberDTO loginResult = memberDAO.getMemberDTO(memberDTO);
memberDAO.closeJDBC();

if (loginResult.getMemberName() != null) {
	session.setAttribute("isLogin", true);
	session.setAttribute("UserId", loginResult.getMemberId());
	session.setAttribute("UserName", loginResult.getMemberName());
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	return;
} else {
	request.setAttribute("loginError", "로그인 실패");
	request.getRequestDispatcher("/includes/login.jsp").forward(request, response);
	return;
}
%>