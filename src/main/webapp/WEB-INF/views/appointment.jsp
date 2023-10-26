<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
</head>
<body>
<h1 style="text-align:center;">예약하기</h1>
${list}

<table border="1">
	<tr class="row">
		<th class="col-1">이름</th>
		<th class="col-6">경력</th>
		<th class="col-1">내용</th>
	</tr>
	<c:forEach items="${list }" var="row">
	<tr>
		<td>${row.dname}</td>
		<td>${row.dcareer}</td>
		<td>${row.dinfo}</td>
	</tr>
	</c:forEach>
</table>


${detail}

<button type="submit">예약하기</button>
커밋테스트
</body>
</html>