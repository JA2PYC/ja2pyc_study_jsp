<%@ page import='db_func.MemberDTO'%>
<%@ page import='db_func.MemberDAO'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memberId = request.getParameter("memberId");
String memberPw = request.getParameter("memberPw").toString();
String memberPwCf = request.getParameter("memberPwCf").toString();

if (memberId == null || memberId.isEmpty()) {
	request.setAttribute("registError", "아이디를 입력하세요.");
	request.getRequestDispatcher("/includes/register.jsp").forward(request, response);
	return;
}

if (memberPw == null || memberPw.isEmpty() || !memberPw.equals(memberPwCf)) {
	request.setAttribute("registError", "비밀번호를 다시 입력해주세요.");
	request.getRequestDispatcher("/includes/register.jsp").forward(request, response);
	return;
}

String memberName = request.getParameter("memberName");
String memberGender = request.getParameter("memberGender");
String memberHome = request.getParameter("memberHome");
String memberPhone = request.getParameter("memberPhone");
String memberEmail = request.getParameter("memberEmail");

MemberDTO memberDTO = new MemberDTO();
memberDTO.setMemberId(memberId);
memberDTO.setMemberPw(memberPw);
memberDTO.setMemberName(memberName);
memberDTO.setMemberGender(memberGender);
memberDTO.setMemberHome(memberHome);
memberDTO.setMemberPhone(memberPhone);
memberDTO.setMemberEmail(memberEmail);

MemberDAO memberDAO = new MemberDAO();
boolean registResult = memberDAO.registMemberDTO(memberDTO);

if (registResult == true) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
} else {
	request.setAttribute("registError", "회원가입에 실패했습니다.");
	request.getRequestDispatcher("/includes/register.jsp").forward(request, response);
}
%>