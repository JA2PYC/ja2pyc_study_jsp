package servlet;

import java.io.IOException;

import db_func.MemberDAO;
import db_func.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class loginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("user_id");
		String memberPw = request.getParameter("user_pw");
		HttpSession session = request.getSession();
		
		if (memberId.isEmpty() || memberPw.isEmpty()) {
			session.setAttribute("loginError", "아이디와 비밀번호를 입력해주세요.");
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(memberId);
		memberDTO.setMemberPw(memberPw);
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO loginDTO = memberDAO.getMemberDTO(memberDTO);
		memberDAO.closeJDBC();
		
		if (loginDTO.getMemberName() != null) {
			session.setAttribute("isLogin", true);
			session.setAttribute("UserId", loginDTO.getMemberId());
			session.setAttribute("UserName", loginDTO.getMemberName());
			response.sendRedirect(request.getContextPath());
			return;
		} else {
			session.setAttribute("loginError", "로그인 실패");
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
	}
}
