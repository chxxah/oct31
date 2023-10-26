<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약접수</title>
<style type="text/css">
.area {
	width: 500px;
	height: 500px;
	margin: 0 auto;	
}

table {
	border:1px solid black;
	margin-left:auto;
	margin-right:auto;
}

h4 {
	position: relative;
	left: 700px;
	bottom: -20px;
}

.btn {
	display: inline-flex;
}

.memberChange {
	margin: 0 atuo;
}

</style>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales/ko.js'></script>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
//날짜별 출근 및 퇴근 정보를 저장할 객체
var attendanceData = {};
var attendance = {}; // 초기화
var attendance2 = {}; // 초기화

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {

	});

	calendar.render();

});
</script>
</head>
<body>
${detail}
<div class="btn">
	<table border="1">
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
	<button class="memberChange">진료자 변경</button>
</div>
<h4>예약날짜</h4>
<div class="area">
	<div>
		<div id="calendar"></div>
	</div>
</div>


<h4>예약시간</h4>
<c:forEach items="${time }" var="t">
<div style="text-align: center;">
	오전 : <button>${t.at1 }</button>
	<button>${t.at2 }</button>
	<button>${t.at3 }</button><br>
	오후 : <button>${t.at4 }</button>
	<button>${t.at5 }</button>
	<button>${t.at6 }</button>
	<button>${t.at7 }</button>
	<button>${t.at8 }</button>
</div>
</c:forEach>


<h4>의료진</h4>
<c:forEach items="${doctor }" var="dc">
<div style="text-align: center;">
	<button
	>${dc.dname } 의사<br>
	별점 : ${dc.dpoint }
	</button>
</div>
</c:forEach>

<h4>전달사항</h4>
<div style="text-align: center;">
<textarea rows="10" cols="50" placeholder="여기에 적으세요."></textarea>
</div>
<br>
<br>
<br>
<div style="text-align: center;">
<button>예약접수</button>
</div>




</body>
</html>