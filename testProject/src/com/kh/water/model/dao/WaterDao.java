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
	
	private Properties prop = new Properties();
	
	public WaterDao() {
		try {
			prop.loadFromXML(new FileInputStream(WaterDao.class.getResource("/db/sql/water-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertWater(Connection conn, String brand, int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, brand);
			pstmt.setInt(2, price);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Water> selectWater(Connection conn) {
		ArrayList<Water> list = new ArrayList<Water>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Water(rset.getInt("water_no"),
								   rset.getString("water_brand"),
								   rset.getInt("price")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int updateWater(Connection conn, String brand, int price, int waterNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateWater");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, brand);
			pstmt.setInt(2, price);
			pstmt.setInt(3, waterNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
