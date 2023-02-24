package com.kh.water.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.water.model.dao.WaterDao;
import com.kh.water.model.vo.Water;

import static com.kh.common.JDBCTemplate.*;

public class WaterService {

	public int insertWater(String brand, int price) {
		Connection conn = getConnection();
		
		int result = new WaterDao().insertWater(conn, brand, price);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Water> selectWater() {

		Connection conn = getConnection();
		
		ArrayList<Water> list = new WaterDao().selectWater(conn);
		
		close(conn);
		
		return list;
	}

	public int updateWater(String brand, int price, int waterNo) {
		
		Connection conn = getConnection();
		
		int result = new WaterDao().updateWater(conn, brand, price, waterNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	

}
