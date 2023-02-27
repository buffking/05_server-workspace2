<%@page import="com.kh.water.model.vo.Water"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
String contextPath = request.getContextPath(); // /jsp

ArrayList<Water> list = (ArrayList<Water>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




            <table align="center" border="1">
                <thead>
                    <tr>
                        <th width="70">상품번호</th>
                        <th width="150">상품명</th>
                        <th width="70">상품가격</th>
                    </tr>
                </thead>  
                <tbody>
                <% if(list.isEmpty()) { %>
                
                <tr>
                <td colspan="3"> 조회된 상품이 없습니다</td>
                	
                </tr>
                <% } else { %>
              
              <% for(Water w : list) { %>
              <tr>
                    <td><%= w.getWaterNo() %></td>
                    <td><%=w.getBrand() %></td>
                    <td><%=w.getPrice() %></td>
               </tr>
                <% } %>
                
              <% } %>  
               </tbody>  
            </table>



            <br><br><hr><br>

            <form action="wUpdate.wo">

            <table align="center">

                <thead>
                    <tr>
                        <td>수정원하는 상품 번호 : </td>
                        <td><input type="number" name="updateWaterNum" required></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>상품 이름 : </td>
                        <td><input type="text" name="reName"></td>
                    </tr>
                    <tr>
                        <td>상품 가격 : </td>
                        <td><input type="text" name="rePrice"></td>
                    </tr>
                </tbody>

            </table>

            <br>
        <div align="center">
        
        
            <button type="submit">상품 수정</button>
            <button type="reset">초기화</button>
        
        </div>

</form>


</body>
</html>