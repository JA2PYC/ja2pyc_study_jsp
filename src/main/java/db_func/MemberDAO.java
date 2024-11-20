package db_func;

import java.util.List;
import java.util.Map;
import java.util.Vector;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {
		super();
	}

	public List<MemberDTO> getMemberDTO(Map<String, Object> map) {
		List<MemberDTO> member = new Vector<MemberDTO>();

		String query = "SELECT * FROM study_member";
		if (map.get("member_id") != null && map.get("member_pw") != null) {
			query += " WHERE memberId=? AND memberPw=?";
		} else {
			return member;
		}
		query += " LIMIT 1";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberId(rs.getString("member_id"));
				dto.setMemberName(rs.getString("member_name"));

				member.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception : Select List Member");
			e.printStackTrace();
		}

		return member;
	}

	public MemberDTO getMemberDTO(MemberDTO memberDTO) {
		MemberDTO dtoResult = new MemberDTO();

		String query = "SELECT * FROM study_member";
		if (memberDTO.getMemberId() != null && memberDTO.getMemberPw() != null) {
			query += " WHERE memberId=? AND memberPw=?";
		} else {
			return dtoResult;
		}
		query += " LIMIT 1";
		System.out.println("getMemberDTO Query : " + query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberDTO.getMemberId());
			psmt.setString(2, memberDTO.getMemberPw());
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dtoResult.setMemberId(rs.getString("memberId"));
				dtoResult.setMemberName(rs.getString("memberName"));
			}
		} catch (Exception e) {
			System.out.println("Exception : getMemberDTO (MemberDTO)");
			e.printStackTrace();
		}

		return dtoResult;
	}

	public boolean registMemberDTO(MemberDTO memberDTO) {
		int registResult = 0;
		try {
			String query = "INSERT INTO study_member VALUES (?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, memberDTO.getMemberId());
			psmt.setString(2, memberDTO.getMemberPw());
			psmt.setString(3, memberDTO.getMemberName());
			psmt.setString(4, memberDTO.getMemberGender());
			psmt.setString(5, memberDTO.getMemberHome());
			psmt.setString(6, memberDTO.getMemberPhone());
			psmt.setString(7, memberDTO.getMemberEmail());

			registResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : Regist Member DTO");
			e.printStackTrace();
		}

		if (registResult == 1) {
			return true;
		} else {
			return false;
		}
	}
}
