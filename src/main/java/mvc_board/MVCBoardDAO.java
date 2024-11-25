package mvc_board;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import db_func.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> dtoList = new Vector<>();

		String query = "SELECT * FROM mvcboard";

		String searchType = (String) map.get("searchType");
		String searchKey = (String) map.get("searchKey");
		if (searchType != null && searchKey != null) {
			List<String> allowedColumns = Arrays.asList("name", "title", "content");
			if (!allowedColumns.contains(searchType)) {
				throw new IllegalArgumentException("Invalid search type: " + searchType);
			}
			query += " WHERE " + searchType + " LIKE ?";
		}

		String limit = map.get("limit") != null ? map.get("limit").toString() : "10";
		if (Integer.parseInt(limit) > 100) {
			limit = "100";
		}
		String offset = map.get("offset") != null ? map.get("offset").toString() : "0";
		if (Integer.parseInt(offset) < 0) {
			offset = "0";
		}
		query += " ORDER BY idx DESC LIMIT ? OFFSET ?";
		System.out.println("Query : " + query);

		try {
	        int paramIndex = 1;

			psmt = con.prepareStatement(query);
			if (map.get("searchType") != null && map.get("searchKey") != null) {
				psmt.setString(paramIndex++, "%" + searchKey + "%");
			}
            psmt.setInt(paramIndex++, Integer.parseInt(limit));
            psmt.setInt(paramIndex++, Integer.parseInt(offset));
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));

				dtoList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception : selectListPage");
			e.printStackTrace();
		}

		return dtoList;
	}
}
