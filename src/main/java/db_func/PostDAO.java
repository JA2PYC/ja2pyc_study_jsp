package db_func;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Vector;

public class PostDAO extends JDBConnect {
	public PostDAO() {
		super();
	}

	public List<PostDTO> selectList(Map<String, Object> map) {
		List<PostDTO> post = new Vector<PostDTO>();

		String query = "SELECT * FROM study_post";
		query += " ORDER BY postNum DESC";
		if (map.get("perPageNum") != null) {
			query += " LIMIT " + map.get("perPageNum");
		}
		System.out.println("Query : " + query);

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO dto = new PostDTO();
				dto.setPostNum(rs.getString("postNum"));
				dto.setPostTitle(rs.getString("postTitle"));
				dto.setPostContent(rs.getString("postContent"));
				dto.setPostWriter(rs.getString("postWriter"));
				dto.setPostDate(rs.getDate("postDate").toString());
				dto.setPostViewCount(rs.getString("postViewCount"));

				post.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception : Select List Post");
			e.printStackTrace();
		}

		return post;
	}

	public List<PostDTO> searchList(Map<String, Object> map) {
		List<PostDTO> searchList = new Vector<PostDTO>();
		String searchType = null;
		String searchKey = null;
		String query = "SELECT * FROM study_post";
		if (map.get("search_type") != null && map.get("search_key") != null) {
			Map<String, String> searchTypeMap = new HashMap<String, String>();
			searchTypeMap.put("title", "postTitle");
			searchTypeMap.put("writer", "postWriter");

			searchType = searchTypeMap.get(map.get("search_type"));
			searchKey = map.get("search_key").toString();
			query += " WHERE ? LIKE %?%";
		}
		query += " ORDER BY postNum DESC";
		System.out.println("seachList Query : " + query);

		try {
			psmt = con.prepareStatement(query);
			if (searchType != null && searchKey != null) {
				psmt.setString(1, searchType);
				psmt.setString(2, searchKey);
			}

		} catch (Exception e) {
			System.out.println("Exception : seachList");
			e.printStackTrace();
		}
		return searchList;
	}

	public boolean writePost(PostDTO dto) {
		int writeResult = 0;

		if (dto.getPostTitle() == null || dto.getPostContent() == null || dto.getPostWriter() == null) {
			System.out.println("title : " + dto.getPostTitle() );
			System.out.println("content : " + dto.getPostContent() );
			System.out.println("writer : " + dto.getPostWriter() );
			return false;
		}

		String query = "INSERT INTO study_post VALUES (NULL, ?, ?, ?, (CURRENT_DATE()), 0)";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPostTitle());
			psmt.setString(2, dto.getPostContent());
			psmt.setString(3, dto.getPostWriter());
			writeResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : Write Post");
			e.printStackTrace();
		}
		System.out.println("writeResult : " + writeResult);
		if (writeResult == 1) {
			return true;
		} else {
			return false;
		}
	}
}
