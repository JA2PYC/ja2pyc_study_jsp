package mvc_board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MVC Board Get");
		
		Map<String, Object> boardMap = new HashMap<>();
		String searchType = req.getParameter("searchType");
		String searchKey = req.getParameter("searchKey");
		String limit = req.getParameter("limit");
		String offset = req.getParameter("offset");
		
		if (searchType != null && searchKey != null) {
			boardMap.put("searchType", searchType);
			boardMap.put("searchKey", searchKey);
		}
		boardMap.put("limit", limit);
		boardMap.put("offset", offset);
		
		MVCBoardDAO mvcDAO = new MVCBoardDAO ();
		List<MVCBoardDTO> boardList = mvcDAO.selectListPage(boardMap);
		mvcDAO.closeJDBC();
		
		req.setAttribute("boardList", boardList);
		req.getRequestDispatcher("/includes/mvcBoard.jsp").include(req, resp);
	}
}
