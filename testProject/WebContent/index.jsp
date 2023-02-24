<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); // /test
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>

    <form action="<%= contextPath %>/insert.wa" method="post">
        생수명 <input type="text" name="brand" value=""> <br>
        가격 <input type="text" name="price"> <br>
        <button type="submit">제출</button>
    </form>

    <button onclick="updateButton();">수정하러가기</button>

    <script>
        function updateButton(){
            location.href="<%= contextPath %>/updatePage.wa";
        }
    </script>
</body>
</html>