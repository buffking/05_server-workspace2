package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 전달값에 한글이 있을 경우 인코딩 처리해야됨 (post 방식에만)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청시 전달값 뽑아서 변수 또는 객체에 기록하기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3) 요청처리 (db에 sql문 실행)
		//	  해당 요청을 처리하는 서비스 클래스의 메소드 호출 및 결과 보기
		Member loginUser = new MemberService().loginMember(userId, userPwd); // null 혹은 로그인한 멤버객체 담김
		System.out.println(loginUser);
		
		// 4) 처리된 결과를 가지고 사용자가 보게될 응답뷰(jsp) 지정 후 포워딩 또는 url 재요청
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
