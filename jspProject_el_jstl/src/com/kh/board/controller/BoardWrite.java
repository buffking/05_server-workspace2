package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/boardDetail")
public class BoardUpdate extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public BoardUpdate() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Board board = new Board();
      board.setBoardNo("boardnum");
      board.setBoardTitle("btitle");
      board.setBoardWriter("bwriter");
      board.setBoardContent("bcontent");
      
      int result = new BoardService().updateBoard(board);
      
      if(result > 0) {
         response.sendRedirect(request.getContextPath());
         
      }else {
         request.setAttribute("error", "게시글 수정 실패");
         request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
      }
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}