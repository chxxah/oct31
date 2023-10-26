<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./js/jquery-3.7.0.min.js"></script> 

<script type="text/javascript">
</script>

</head>
<body>
	<h1>main</h1>
	${sessionScope.mname} 님 반갑습니다.
	<button type="button" onclick="location.href='./login'">로그인</button>
	<button type="button" onclick="location.href='./logout'">로그아웃</button>
</body>
</html>