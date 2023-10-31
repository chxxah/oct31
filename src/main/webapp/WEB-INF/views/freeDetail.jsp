<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="freePost">
		<div class="boardNum">${freePost.bno}</div>
		<div class="btitle">${freePost.btitle}</div>
		익명
		<div class="bdetail">${freePost.bcontent}</div>
		<div class="bdate">${freePost.bdate}</div>
	</div>


	

<br> 댓글
	<div class="comment">
		<c:forEach items="${freeComment}" var="comment">
			<div class="cdetail">${comment.ccontent}</div>
			<div class="cdate">${comment.cdate}</div>
			<c:if test="${comment.mno eq mno}">
				<form action="deleteFreeComment" method="post" id="deleteFreeComment">
				<input type="hidden" name="cno" id="cno" value="${comment.cno}">
					<input type="hidden" name="bno" id="bno" value="${freePost.bno}">
					<button class="cdelete">삭제하기</button>
				</form>
			</c:if>
			<br>
		</c:forEach>
	</div>

	




	<script>
	
		//날짜, 시간 변환하기
		function updateDate(element, dateString) {
			const postTime = new Date(dateString);
			const currentTime = new Date();
			const timeDiff = currentTime - postTime;
			const minutesDiff = Math.floor(timeDiff / (1000 * 60));

			if (minutesDiff < 1) {
				element.textContent = "방금 전";
			} else if (minutesDiff < 60) {
				element.textContent = minutesDiff + "분 전";
			} else if (minutesDiff < 24 * 60) {
				const hoursDiff = Math.floor(minutesDiff / 60);
				element.textContent = hoursDiff + "시간 전";
			} else {
				const year = postTime.getFullYear();
				const month = postTime.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
				const day = postTime.getDate();
				const formattedDate = year + "." + month + "." + day;
				element.textContent = formattedDate;
			}
		}

		document.addEventListener("DOMContentLoaded", function() {
			// bdate, cdate에 적용
			const bdateElements = document.querySelectorAll(".bdate");
			bdateElements.forEach(function(element) {
				updateDate(element, element.textContent);
			});

			const cdateElements = document.querySelectorAll(".cdate");
			cdateElements.forEach(function(element) {
				updateDate(element, element.textContent);
			});
		});

		
		
	</script>

</body>
</html>