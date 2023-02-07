<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .login-area>*{float: right;}
    .login-area a{
        text-decoration: none;
        color: black;
        font-size: 12px;
    }
    .nav-area{background-color: black;}
    .menu{
        display: table-cell;
        width: 150px;
        height: 50px;
    }
    .menu a{
        text-decoration: none;
        color: white;
        font-size: 20px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 50px;
    }
    .menu a:hover{
        background-color: darkgray;
    }

</style>
</head>
<body>
    <h1 align="center">Welcome Junseok World</h1>

    <div class="login-area">
    
        <!-- case1. 로그인 전 -->
        <form action="/jsp/login.me" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" id="userId"  placeholder="아이디를 입력해주세요"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button">회원가입</button>
                    </th>
                </tr>
            </table>
        </form> 
    
        <!-- case2. 로그인 후 
         
        <div>
            <b>xxx 님</b> 의 방문을 환영합니다. <br><br>
            <div>
                <a href="#">마이페이지</a>
                <a href="#">로그아웃</a>
            </div>
        </div> -->
    
    </div>

    <br clear="both">
    <br>

    <div class="nav-area" align="center">
        <!-- (.menu>a)*4 -->
        <div class="menu"><a href="#">HOME</a></div>
        <div class="menu"><a href="#">공지사항</a></div>
        <div class="menu"><a href="#">일반게시판</a></div>
        <div class="menu"><a href="#">사진게시판</a></div>
    </div>
    

</body>
</html>