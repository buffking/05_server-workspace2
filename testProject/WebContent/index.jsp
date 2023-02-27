<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.kh.common.JDBCTemplate" %>   
 
<%
String contextPath = request.getContextPath(); // /jsp
%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<form action="wInsert.wo">


<table border="1" align="center">
    <thead>
        <tr>
            
            <th width="70">상품명</th>
            <th width="70">가격</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><input type="text" name="waterName" required placeholder="상품명 입력"></td>
            <td><input type="text" name="waterPrice" required placeholder="가격입력"></td>
        </tr>

    </tbody>
</table>

<br>

<div align="center">

       
                <button type="submit">상품 등록</button>
                <button type="reset">초기화</button>
       
</div>
</form>




    <br><br> <hr><br>

   
    <button onclick="updateWater();" name="updateWater1" align="center">수정하기</button>

    <script>
        function updateWater(){
            location.href = '<%= contextPath %>/wSelete.wo'
        }
    </script>










</body>
</html>