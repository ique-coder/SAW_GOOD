package com.saw.good.admin.visitor.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VisitorDao {
	
	public void setVisitTotalCount() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@rclass.iptime.org:1521:xe","sawgood","sawgood");
			String sql="INSERT INTO SGVISITORS VALUES(SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();

		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
				pstmt.close();
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public int getVisitTodayCount(int i) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@rclass.iptime.org:1521:xe","sawgood","sawgood");
			String sql="SELECT COUNT(*) FROM SGVISITORS WHERE SUBSTR(TO_CHAR(VISITDATE), 1, 9) = TO_DATE(SYSDATE-?, 'YY/MM/DD')";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	
}
