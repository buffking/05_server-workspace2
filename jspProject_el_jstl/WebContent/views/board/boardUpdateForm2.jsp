<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

<div align="center">

 <form action="update" method="post">

  <table>

   <input type="hidden" name="boardnum"​ value="${ board.boardNum }" >

   <tr>

    <td>제목</td>

    <td><input type="text" name="boardtitle" value="${ board.boardTitle }"></td>



    <td>작성자</td>

    <td><input type="text" name="boardwritear" value​="${ board.boardWriter }" ></td>

   </tr>

   <tr>

    <td>내용</td>

   </tr>

   <tr>

    <td colspan="4"><textarea name="content" cols="60" rows="15" style="resize: none;">${ board.boardContent }</textarea></td>

   </tr>

  </table>

  <div align="center">

    <button type="button" onclick="history.back();">취소</button>

    <button type="submit">수정하기</button>

  </div>

</form>

</div>

</body>

</html>