<%@page import="com.kh.water.model.vo.Water"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); // /test
	ArrayList<Water> list = (ArrayList<Water>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>수정하기 페이지</h1>
	<form action="<%= contextPath %>/update.wa" method="post">
		<input type="hidden" name="waterNo" value="<%= list.get(0).getWaterNo() %>">
        생수명 <input type="text" name="brand" value="<%= list.get(0).getWaterBrand()%>"> <br>
        가격 <input type="text" name="price" value="<%= list.get(0).getPrice()%>"> <br>
        <button type="submit">수정하기</button>
    </form>
    
    
</body>
</html>