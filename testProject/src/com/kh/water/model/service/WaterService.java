package com.kh.water.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.water.model.dao.WaterDao;
import com.kh.water.model.vo.Water;

public class WaterService {
	
	// import static com.kh.common.JDBCTemplate.*; 이거는 손수 작성해야해!!
	

	public int insertWater(Water w) {
		
		Connection conn = getConnection();
		
		int result = new WaterDao().insertWater(conn,w);
		
		
		if(result>0) {
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

	public int updateWater(Water w) {
		
		Connection conn = getConnection();
		
		int result = new WaterDao().updateWater(conn, w);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
