<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        height: 700px;
        margin: auto;
        margin-top: 50px;
    }

    #enroll-form input, #enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="outer">
        <br>
        <h2 align="center">사진게시판 작성하기</h2>

        <form action="insert.th" id="enroll-form" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="${ loginUser.userNo }">
            <table align="center">
                <tr>
                    <th>제목</th>
                    <td colspan="3"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"><textarea name="content" rows="5" style="resize: none;" required></textarea></td>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleImg" width="250" height="170" onclick="chooseFile(1);">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td><img id="contentImg1" width="150" height="120" onclick="chooseFile(2);"></td>
                    <td><img id="contentImg2" width="150" height="120" onclick="chooseFile(3);"></td>
                    <td><img id="contentImg3" width="150" height="120" onclick="chooseFile(4);"></td>
                </tr>
            </table>
            <div id="file-area" style="display: none;">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
            </div>

            <script>
                function chooseFile(num){
                    $("#file" + num).click();
                }

                function loadImg(inputFile, num){
                    // inputFile: 변화가 생긴 input type = "file" 요소 객체
                    // num: 몇번째 input 요소인지 확인 후 해당 영역에 미리보기를 하기 위해 전달받는 숫자

                    // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨있음
                    //                    => inputFile.files.length 또한 1이 될거임

                    if(inputFile.files.length == 1){// 파일이 선택된 경우 => 파일을 읽어들여서 미리보기
                        // 파일을 읽어들일 FileReader 객체 생성
                        const reader = new FileReader();

                        // 파일을 읽어들이는 메소드 호출
                        reader.readAsDataURL(inputFile.files[0]);
                        // 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여

                        // 파일 읽어들이기가 완료됐을 때 실행할 함수 정의해두기
                        reader.onload = function(e){
                            // e.target.result => 읽어들인 파일의 고유한 url
                            switch(num){
                                case 1:
                                    $("#titleImg").attr("src", e.target.result);
                                    break;
                                
                                case 2:
                                    $("#contentImg1").attr("src", e.target.result);
                                    break;

                                case 3:
                                    $("#contentImg2").attr("src", e.target.result);
                                    break;

                                case 4:
                                    $("#contentImg3").attr("src", e.target.result);
                                    break;
                            }
                        }
                    }else{// 선택된 파일이 취소된 경우 => 미리보기 된 것도 사라지게
                        switch(num){
                                case 1:
                                    $("#titleImg").attr("src", null);
                                    break;
                                
                                case 2:
                                    $("#contentImg1").attr("src", null);
                                    break;

                                case 3:
                                    $("#contentImg2").attr("src", null);
                                    break;

                                case 4:
                                    $("#contentImg3").attr("src", null);
                                    break;
                            }
                    }
                }
            </script>

            <br>

            <div align="center">
                <button type="submit">등록하기</button>
            </div>
        </form>
    </div>
</body>
</html>