package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Index Controller Get");

		String path = req.getServletPath();
		String includePage;
		if (path == null || path.equals("/") || path.equals("/front")) {
			includePage = "/WEB-INF/views/includes/frontPage.jsp"; 
		} else if (path.equals("/mvcBoard")) {
			includePage = "/WEB-INF/views/includes/mvcBoard.jsp"; 
		} else if (path.equals("/board")) {
			includePage = "/WEB-INF/views/includes/boardList.jsp"; 
		} else if (path.equals("/login")) {
			includePage = "/WEB-INF/views/includes/login.jsp"; 
		} else if (path.equals("/logout")) {
			includePage = "/WEB-INF/views/includes/logout.jsp"; 
		} else if (path.equals("/register")) {
			includePage = "/WEB-INF/views/includes/register.jsp"; 
		} else if (path.equals("/search")) {
			includePage = "/WEB-INF/views/includes/search.jsp"; 
		} else if (path.equals("/write")) {
			includePage = "/WEB-INF/views/includes/write.jsp"; 
		} else {
			includePage = "/WEB-INF/views/includes/notFound.jsp";
		}

		System.out.println("path : " + path);
		System.out.println("getPathInfo : " + req.getPathInfo());
		System.out.println("getServletPath : " + req.getServletPath());
		System.out.println("requestURI : " + req.getRequestURI());
		String testParameter = req.getParameter("test");
		System.out.println("testParameter : " + testParameter);
		System.out.println("includePage : " + includePage);
		
		req.setAttribute("includePage", includePage);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(req, resp); // index.jsp로 포워딩
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Index Controller Post");
		
		String path = req.getServletPath();
		String redirectPage;
		if (path.equals("/loginProcess")) {
			redirectPage = "/WEB-INF/views/includes/loginProcess.jsp"; 
		} else if (path.equals("/registerProcess")) {
			redirectPage = "/WEB-INF/views/includes/registerProcess.jsp"; 
		} else if (path.equals("/writeProcess")) {
			redirectPage = "/WEB-INF/views/includes/writeProcess.jsp"; 
		} else {
			redirectPage = "/WEB-INF/views/includes/notFound.jsp";
		}
		
		resp.sendRedirect(redirectPage);
	}
}
