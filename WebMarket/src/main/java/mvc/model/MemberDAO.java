package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBconnection;

public class MemberDAO {
	private static MemberDAO instance;

	public MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();

		return instance;
	}
	
	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql;
		sql = "select count(*) from member";

		try {
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(conn, pstmt, rs);
		}

		return x;
	}

	public ArrayList<MemberDTO> getMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total_record = getListCount();
		String sql;
		int index = 1;
		sql = "select * from member";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			while (rs.absolute(index)) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth"));
				member.setMail(rs.getString("mail"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setRegist_day(rs.getString("regist_day"));
				list.add(member);
				if (index <= total_record)
					index++;
				else
					break;
			}
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		} finally {
			DBconnection.close(conn, pstmt, rs);
		}

		return list;
	}

	public MemberDTO getMemberById(String id) {
		MemberDTO member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			sql = "select * from member where id=?";
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth"));
				member.setMail(rs.getString("mail"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setRegist_day(rs.getString("regist_day"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(conn, pstmt, rs);
		}

		return member;
	}

	public void updateMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? where id=?";
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getMail());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(conn, pstmt);
		}
	}
	
	public void deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from member where id=?";
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBconnection.close(conn, pstmt);
		}
	}
}
