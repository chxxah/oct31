<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>

<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">

	$(function(){
		
		$(".findIDBtn").click(function(){
			let notNum = /[^0-9]/g;
			let kor = /[가-힣]/;
			let mname = $(".mname").val();
			let phoneNumber = $(".firstNumber").val() + $(".MiddleNumber").val() + $(".lastNumber").val();
			
			$(".nameInfo").text("");
			$(".phoneInfo").text("");
			
		    if (mname == "") {
		        $(".nameInfo").text("이름을 입력해주세요.");
		        $(".nameInfo").css("color","red");
		        return;
		    }
		    
		    if (!kor.test(mname)) {
		        $(".nameInfo").text("한글만 입력 가능합니다.");
		        $(".nameInfo").css("color","red");
		        return;
		    }
			
		    if(notNum.test(phoneNumber) || phoneNumber.length !== 11) {
		        $(".phoneInfo").text("올바른 전화번호를 입력해주세요.");
		        $(".phoneInfo").css("color","red");
		        return;
		    }
		}); //findIDBtn 끝
	}); //function 끝

	
</script>

</head>
<body>
	<h1>아이디가 기억나지 않으세요?</h1>

	<h5>이름</h5>
	<input type="text" class="mname" name="mname" placeholder="이름을 입력해주세요." maxlength="11">
    <br>
    <span class="nameInfo"></span>
	<br>
	<h5>전화번호</h5>
		<input type="text" class="firstNumber" name="firstNumber" maxlength="3" placeholder="010">-
		<input type="text" class="MiddleNumber" name="MiddleNumber" maxlength="4" placeholder="xxxx">
		<input type="text" class="lastNumber" name="lastNumber" maxlength="4" placeholder="xxxx">
		<br>
		<span class="phoneInfo"></span>
		<br>
		<button type="button" class="findIDBtn">아이디 찾기</button>
		<br>
		<br> 
		<a href="./login">&nbsp;&nbsp;로그인 하러가기</a>
</body>
</html>