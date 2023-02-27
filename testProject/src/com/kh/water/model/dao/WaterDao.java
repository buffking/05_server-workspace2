package com.kh.water.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.water.model.vo.Water;
import static com.kh.common.JDBCTemplate.*;

public class WaterDao {
	
	// import static com.kh.common.JDBCTemplate.*; 이거는 손수 작성해야해!!
	
	Properties prop = new Properties();
	
	
	public WaterDao(){
		
		String filePath = WaterDao.class.getResource("/db/sql/water-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

	public int insertWater(Connection conn, Water w) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, w.getBrand());
			pstmt.setInt(2, w.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}



	public ArrayList<Water> selectWater(Connection conn) {
		
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Water> list = new ArrayList<Water>();
		
		
		String sql = prop.getProperty("selectWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Water(
						rset.getInt("WATER_NO")
						, rset.getString("BRAND")
						, rset.getInt("price")
						));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		return list;
	}



	public int updateWater(Connection conn, Water w) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updateWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, w.getBrand());
			pstmt.setInt(2, w.getPrice());
			pstmt.setInt(3, w.getWaterNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
