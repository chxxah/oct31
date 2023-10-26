<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약접수</title>
</head>
<body>
${detail}

<table>
	<tr>
		<th>이름</th>
		<th>일반진료</th>
	</tr>
	
	<c:forEach items="${detail }" var="d">
	<tr>
		<td>${d.mname}</td>
		<td>${d.adiagnosis}</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>