package com.kh.water.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.water.model.service.WaterService;
import com.kh.water.model.vo.Water;

/**
 * Servlet implementation class WaterInsertController
 */
@WebServlet("/wInsert.wo")
public class WaterInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaterInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
	
		// 가져오는건 jsp name 키값
		
		String waterName = request.getParameter("waterName");
		int waterPrice = Integer.parseInt(request.getParameter("waterPrice"));
		
		Water w = new Water();
		
		w.setBrand(waterName);
		
		w.setPrice(waterPrice);
		
		int result = new WaterService().insertWater(w);
		
//		if(result>0) {
//		
//			response.sendRedirect(request.getContextPath());
//		}else {
//			request.setAttribute("errorPage", "상품넣기 실패");
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
