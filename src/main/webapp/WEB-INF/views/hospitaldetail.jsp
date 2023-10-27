<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<html>

<link rel="stylesheet" href="../css/hospitaldetail.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
	$(function() {
		let hospitalname = $('.hospitalName').text()
		let openTime = timeToNumber($('.openTime').text());
		let closeTime = timeToNumber($('.closeTime').text());
		let nowTime = timeToNumber($('#nowTime').val());

		$('#todayHours').html(
				$('.openTime').text() + " ~ " + $('.closeTime').text())

		$(document).on("click", ".xi-heart, .xi-heart-o", function() {
			if ($(this).hasClass("xi-heart")) {
				$(this).parent().html('<i class="xi-heart-o xi-2x"></i>');
				$.ajax({
					type : "POST",
					url : "./unlike",
					data : {
						hospitalname : hospitalname
					}
				});

			} else {
				$(this).parent().html('<i class="xi-heart xi-2x"></i>');
				$.ajax({
					type : "POST",
					url : "./like",
					data : {
						hospitalname : hospitalname
					}
				});
			}
		});

		if (nowTime > openTime && nowTime < closeTime) {
			$('#available').show()
		} else {
			$('#unavailable').show()
		}

	});

	function timeToNumber(time) {
		let parts = time.split(":");
		return parseInt(parts[0] + parts[1]);
	}
</script>

</script>

</head>
<body>
	<h1>hospitaldetail</h1>
	<header>
		<nav>
			<ul>
				<li>
					<button>
						<i class="xi-angle-left xi-2x"></i>
					</button>
				</li>

				<li>
					<div class="titleHospitalName">${hospital.hname }</div>
				</li>

				<li><c:set var="found" value="false" /> <c:forEach
						var="hospitalLike" items="${sessionScope.hospitallike}">
						<c:if test="${hospitalLike == hospital.hname}">
							<div class="like" style="color: red">
								<i class="xi-heart xi-2x"></i>
							</div>
							<c:set var="found" value="true" />
						</c:if>
					</c:forEach> <c:if test="${not found}">
						<div class="notlike" style="color: red">
							<i class="xi-heart-o xi-2x"></i>
						</div>
					</c:if></li>
			</ul>
		</nav>
	</header>


	<div class="hospitalImage">
		<img alt="사진예정" src="">
	</div>

	<div class="hospitalName">${hospital.hname }</div>

	<div class="departmentList">
		<c:forEach var="department" items="${doctorList}">
			<span> ${department.dpkind } </span>
		</c:forEach>
	</div>

	<div class="status">
		<input type="hidden" id="nowTime" value="${now.time }">
		<div id="available">
			<i class="xi-check-circle xi">진료가능</i>
		</div>
		<div id="unavailable">
			<i class="xi-close-circle xi">진료불가능</i>
		</div>
	</div>

	<div class="consulationHours">
		<c:if
			test="${(now.dayOfWeek == '월요일' || now.dayOfWeek == '화요일' || now.dayOfWeek == '수요일' || now.dayOfWeek == '목요일' || now.dayOfWeek == '금요일') 
				&& now.dayOfWeek != hospital.hnightday}">
			<span class="day">${now.dayOfWeek }</span>
			<span class="openTime">${hospital.hopentime }</span>~
			<span class="closeTime">${hospital.hclosetime }</span>
		</c:if>

		<c:if test="${now.dayOfWeek == hospital.hnightday}">
			<span class="day">${now.dayOfWeek }</span>
			<span class="openTime">${hospital.hopentime }</span>~ 
			<span class="closeTime">${hospital.hnightendtime }</span>
		</c:if>

		<c:if
			test="${(now.dayOfWeek == '토요일' || now.dayOfWeek == '일요일') && hospital.hholiday !=0}">
			<span class="day">${now.dayOfWeek }</span>
			<span class="openTime">${hospital.hopentime }</span>~
			<span class="closeTime">${hospital.hholidayendtime }</span>
		</c:if>

		<c:if
			test="${(now.dayOfWeek == '토요일' || now.dayOfWeek == '일요일') && hospital.hholiday ==0}">
			<span>휴일입니다</span>
		</c:if>
	</div>

	<div>
		<button value="${hospital.htelnumber }">전화하기</button>
		<!-- //나중에 -->
		<button>공유하기</button>
	</div>
	<div class="detailMenu">
		<ul>
			<li>진료정보</li>
			<li>병원정보</li>
			<li>의사정보</li>
			<li>리뷰</li>
		</ul>
	</div>


	<div class="medicalInfo">
		<div class="todayInfo">
			<div class="today todayTimeInfo">
				<span>오늘</span><br> <span id="todayHours"></span>
			</div>
			<div class="today todayBreakInfo">
				<span>점심시간</span><br> <span id="todayBreak"> <c:if
						test="${(now.dayOfWeek == '토요일' || now.dayOfWeek == '일요일') && hospital.hholiday ==0}">
						휴일입니다
					</c:if> <c:if
						test="${(now.dayOfWeek == '토요일' || now.dayOfWeek == '일요일') && hospital.hholiday ==1}">
						없음
					</c:if> <c:if
						test="${now.dayOfWeek == '월요일' || now.dayOfWeek == '화요일' || now.dayOfWeek == '수요일' || now.dayOfWeek == '목요일' || now.dayOfWeek == '금요일'}">
				${hospital.hbreaktime } ~ ${hospital.hbreakendtime }
					</c:if>
				</span>
			</div>
		</div>

		<div class="timeInfo">
			<div class="day monday">
				<c:choose>
					<c:when test="${hospital.hnightday == '월요일'}">
						월요일(야간진료) <br> ${hospital.hopentime } ~ ${hospital.hnightendtime }
					</c:when>
					<c:otherwise>
						월요일 <br> ${hospital.hopentime } ~ ${hospital.hclosetime }
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day tuesday">
				<c:choose>
					<c:when test="${hospital.hnightday == '화요일'}">
						화요일(야간진료) <br> ${hospital.hopentime } ~ ${hospital.hnightendtime }
					</c:when>
					<c:otherwise>
						화요일 <br> ${hospital.hopentime } ~ ${hospital.hclosetime }
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day wednesday">
				<c:choose>
					<c:when test="${hospital.hnightday == '수요일'}">
						수요일(야간진료) <br> ${hospital.hopentime } ~ ${hospital.hnightendtime }
					</c:when>
					<c:otherwise>
						수요일 <br> ${hospital.hopentime } ~ ${hospital.hclosetime }
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day thursday">
				<c:choose>
					<c:when test="${hospital.hnightday == '목요일'}">
						목요일(야간진료) <br> ${hospital.hopentime } ~ ${hospital.hnightendtime }
					</c:when>
					<c:otherwise>
						목요일 <br> ${hospital.hopentime } ~ ${hospital.hclosetime }
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day friday">
				<c:choose>
					<c:when test="${hospital.hnightday == '금요일'}">
						금요일(야간진료) <br> ${hospital.hopentime } ~ ${hospital.hnightendtime }
					</c:when>
					<c:otherwise>
						금요일 <br> ${hospital.hopentime } ~ ${hospital.hclosetime }
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day saturday">
				<c:choose>
					<c:when test="${hospital.hholiday == 1}">
						토요일 <br> ${hospital.hopentime } ~ ${hospital.hholidayendtime }
					</c:when>
					<c:otherwise>
						토요일 <br> 휴일
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day sunday">
				<c:choose>
					<c:when test="${hospital.hholiday == 1}">
						일요일 <br> ${hospital.hopentime } ~ ${hospital.hholidayendtime }
					</c:when>
					<c:otherwise>
						일요일 <br> 휴일
					</c:otherwise>
				</c:choose>
			</div>
			<div class="day breaktime">
				평일 점심시간<br> ${hospital.hbreaktime } ~ ${hospital.hbreakendtime }
			</div>
		</div>

		<hr>

		<div class="department">
			<div class="hospitalTitle">진료 과목</div>
			총 ${doctorList.size() }개
			<div>
				<c:forEach var="department" items="${doctorList}">
					<span> ${department.dpkind } </span>
				</c:forEach>
			</div>
		</div>

	</div>

	<hr>

	<div class="hospitalInfo">
		<div class="hospitalIntro">
			<div class="hospitalTitle">병원 소개</div>
			<span>${hospital.hinfo }</span>
		</div>

		<hr>

		<div class="hospitalLocation">
			<div class="hospitalTitle">위치</div>
			<span> ${hospital.haddr }</span>
		</div>
		<div class="Map">~지도 예정</div>
	</div>

	<hr>

	<div class="doctorInfo">
		<div class="hospitalTitle">의사 정보</div>
		<c:forEach var="doctorList" items="${doctorList}">
			<div>
				<img alt="의사사진" src=""> <span>${doctorList.dname }</span>
			</div>
		</c:forEach>

	</div>

	<hr>

	<div class="totalReviewList">
		<div class="hospitalTitle">리뷰</div>
		총 ${reviewList.size() }개<br> 이 병원을 ${(averageHospitalRate * 20) }%가
		추천하고 싶어해요
		<div class="averageHospitalRate">
			${averageHospitalRate }
			<c:set var="averageInt"
				value="${fn:substringBefore(averageHospitalRate, '.')}" />
			<c:forEach var="i" begin="1" end="${averageInt }">
				<i class="star xi-star xi-x"></i>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${5 - averageInt }">
				<i class="star xi-star-o xi-x"></i>
			</c:forEach>


		</div>
		<hr>
		<c:forEach var="reviewList" items="${reviewList}">
			<div class="reviewList">

				<div class="reviewRate">
					<c:set var="ratingInt"
						value="${fn:substringBefore(reviewList.rrate, '.')}" />
					<c:forEach var="i" begin="1" end="${ratingInt }">
						<i class="star xi-star xi-x"></i>
					</c:forEach>
					<c:forEach var="i" begin="1" end="${5 - ratingInt }">
						<i class="star xi-star-o xi-x"></i>
					</c:forEach>
				</div>

				<div class="reviewKeyword">
					<c:forEach var="keyword"
						items="${fn:split(reviewList.rkeyword, ',')}">
						<div class="keyword">${keyword}</div>
					</c:forEach>
				</div>
				<div class="reviewContent">${reviewList.rcontent }</div>
				<div class="reviewDate">${reviewList.rdate }</div>
				<div class="reviewer">${reviewList.mname }</div>
				<button class="reviewLike">도움되요</button>
				<hr>

			</div>
		</c:forEach>
	</div>



</body>
</html>