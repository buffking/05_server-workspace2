<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: black;
        color: white;
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }

    #enroll-form table{margin: auto;}
    #enroll-form input{margin: 5px;}
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">회원가입</h2>

        <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">

            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required></td>
                    <td><button type="button" onclick="idCheck();">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="sports" value="운동">
                        <label for="sports">운동</label>

                        <input type="checkbox" name="interest" id="hiking" value="등산">
                        <label for="hiking">등산</label>

                        <input type="checkbox" name="interest" id="fishing" value="낚시">
                        <label for="fishing">낚시</label>
                        <br>
                        <input type="checkbox" name="interest" id="cooking" value="요리">
                        <label for="cooking">요리</label>

                        <input type="checkbox" name="interest" id="game" value="게임">
                        <label for="game">게임</label>

                        <input type="checkbox" name="interest" id="movie" value="영화">
                        <label for="movie">영화</label>
                    </td>
                </tr>
            </table>

            <br><br>

            <div align="center">
                <button type="submit" disabled>회원가입</button>
                <button type="reset">초기화</button>
            </div>

            <br>

        </form>
    </div>
    
    <script>
    	function idCheck() {
			// 중복확인 버튼 클릭시 사용자가 입력한 값을 넘겨서 조회 요청(존재하는지 안하는지) => 응답데이터 돌려받기
			// 1) 사용불가능(NNNNN)일 경우 => alert로 메세지 출력, 다시 입력할 수 있도록 유도
			// 2) 가용 가능 (NNNNY)일 경우 => 진짜 사용할껀지 의사를 물어볼꺼임 (confrim 메소드)
			// 						  => 사용하겠다는 경우 => 더이상 아이디 수정 못하게끔 픽스, 회원가입 버튼 활성화
			// 						  => 사용안하겠다는 경우 => 다시 입력할 수 있도록 유도 
			
			// 입력한 아이디 input 요소 객체
			const $idInput = $("#enroll-form input[name=userId]");
			const $submit = $("#enroll-form button[type=submit]")
			
			$.ajax({
				url:"idCheck.me",
				data:{checkId:$idInput.val()},
				success:function(result){
					if(result == "NNNNN"){
						alert("중복입니다.");
						$idInput.focus();
						$idInput.val("");
					}else{
						if(confirm("진짜쓸꺼니?")){
							$idInput.attr("readonly", true);
							$submit.removeAttr("disabled");
						}else{
							$idInput.focus();
							$idInput.val("");
						}
						
					}
					console.log(result);
				},
				error:function(){
					console.log("아이디 중복체크용 ajax 통신 실패!");
				}
				
			});
		}
    	
    </script>

</body>
</html>