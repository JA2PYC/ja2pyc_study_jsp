package db_func;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_ja2pyc_jsp");

			con = source.getConnection();

			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("Exception : JDBConnect");
			e.printStackTrace();
		}
	}

	public void closeJDBC() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
			System.out.println("Exception : Close JDBC");
			e.printStackTrace();
		}
	}

}
