<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
    crossorigin="anonymous"></script>
<script type="text/javascript">

    $(function() {
        $('.loginBtn').click(function(event) {
            let mid = $("#mid").val();
            let mpw = $("#mpw").val();
            let notNum = /[^0-9]/g;
            
            $(".info").text("");
            
            if(mid == ""){
                $("#mid").val("");
                $("#mpw").val("");
                $(".info").css("color","red");
                $(".info").text("아이디를 입력하세요.");         
                $("#mid").focus();
                return false;
            }
            
            if( mpw==""){
                $("#mpw").val("");
                $(".info").css("color","red");
                $(".info").text("비밀번호를 입력해주세요.");         
                $("#mpw").focus();
                return false;
            }
            
            if(notNum.test(mpw)){
                $("#mpw").val("");
                $(".info").css("color","red");
                $(".info").text("숫자를 입력해주세요.");         
                $("#mpw").focus();
                return false;
            }
            
            //ajax
            $.ajax({
                url: "./loginCheck",
                type: "post",
                data: {"mid": mid, "mpw": mpw},
                dataType: "json",
                success: function(data){
                	
                    if(data.PWresult == 1){
                       let form = $('<form></form>')
                       form.attr("action", "./main");
                       form.attr("method", "get");
                       
                       form.appendTo("body");
                       
                       form.submit();
                      }
                	
                    if(data.IDresult == 0){
                        alert("일치하는 아이디가 없습니다.");
                        $(".info").css("color","red");
                        $(".info").text("아이디를 다시 확인해주세요.");            
                        $("#mid").focus();
                    }
                    
                    if(data.PWresult == 0){
                        alert("비밀번호를 잘못 입력하셨습니다.");
                        $(".info").css("color","red");
                        $("#mid").focus();
                        $(".info").text("비밀번호를 다시 확인해주세요.");
                    } 
                }, 
                error : function(error){
                    alert("에러가 발생했습니다." + error);
                }//에러끝
            });//ajax 끝
        });//로그인 버튼 클릭            
    });
</script>

</head>
<body>
    <h1>DR.HOME</h1>
    <div class="login-form">
	        <input type="text" id="mid" name="mid" placeholder="아이디" maxlength="11"> <br>
	        <input type="password" id="mpw" name="mpw" placeholder="패스워드" maxlength="8">
        <br> 
	        <a href="./findID"  class="findID">&nbsp;&nbsp;아이디 찾기</a> 
	        <a href="./findPW" class="findPW">&nbsp;&nbsp;비밀번호 찾기</a> 
	        <a href="./register" class="join"> &nbsp;&nbsp;회원가입</a> <br> 
      	    <span class="info"></span><br>
       		<button class="loginBtn">Sign In →</button>
        <br>
    </div>
    <div class=registerHospital-form">
   		 	<span>병원 개설이 필요하신가요?</span>
    		<a href="registerHospital" class="registerHospital">&nbsp;&nbsp;병원 등록하러 가기</a>
    </div>
</body>
</html>
