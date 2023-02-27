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
 * Servlet implementation class WaterUpdateController
 */
@WebServlet("/wUpdate.wo")
public class WaterUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WaterUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		request.setCharacterEncoding("utf-8");
		
		int updateWaterNum = Integer.parseInt(request.getParameter("updateWaterNum"));
		
		String reName = request.getParameter("reName");
		int rePrice = Integer.parseInt(request.getParameter("rePrice"));
		
		
		Water w = new Water();
		
		w.setWaterNo(updateWaterNum);
		w.setBrand(reName);
		w.setPrice(rePrice);
		
		
		int result = new WaterService().updateWater(w);
		
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/wSelete.wo");
			// 
			// 새로고침 느낌
		}
		
		//else {
			//request.setAttribute("errorPage", "상품수정 실패");
			// request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			//System.out.println("여기인가?");
			//System.out.println(w.getWaterNo());
		//}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
