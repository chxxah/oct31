<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="./js/jquery-3.7.0.min.js"></script> 

<script type="text/javascript">
	$(document).ready(function(){
		
		let urlString = window.location.search;
		let urlParams = new URLSearchParams(urlString);
		let keyword = urlParams.get('keyword');
		if (keyword != '') {
			$("#keyword").val(keyword);
		}
	})




</script>

</head>
<body>
	<h1>hospital</h1>
	<div class="searchHospital">
		<div class="xi-angle-left"></div>
		<input placeholder="질병, 진료과, 병원을 검색하세요." name="keyword" id="keyword">
		<button class="xi-search"></button>
	</div>
	

	
	<div class="filterHospital">
		<div class="selectByLocal">위치</div>
		<div class="selectByDepartment">진료과목</div>
		<div class="selectByAvailable">진료중</div>
		<div class="selectByCategory">유형</div>
	</div>
	<div class="sortHospital">
		<div class="sortByLocal">서초구 서초동</div>
		<select>
			<option class="sortByExact">정확도 순</option>
			<option class="sortByRate">별점 순</option>
			<option class="sortByReview">리뷰 순</option>
		</select>
	</div>
	
	<!-- [{dpkind=피부과, hholidayendtime=12:00:00, hparking=1, dpno=5, hnightday=수요일, dno=1, 
	dpsymptom=피부 질환, hno=1, dpkeyword=티눈,아토피,안면홍조, dspecialist=0, dgender=0, reviewCount=4, 
	hopentime=09:00:00, hnightendtime=23:00:00, hname=연세세브란스, haddr=서울특별시 서대문구 신촌동 연세로 50-1, 
	hclosetime=18:00:00, hholiday=0, reviewAverage=4.2} -->
	 <c:forEach items="${hospitalList}" var="row">
	 
		<div class="hospitalList">
			<div class="hospitalStatus">진료여부</div>
			<div class="hospitalHeader">
				<div class="hospitalName">${row.hname}</div>
				<div class="hospitalDepartment">${row.dpkind}</div>
				<div class="hospitalLike">찜하기</div>
			</div>
			<div class="hospitalBody">
				<div class="hospitalDistance">뺄지말지고민</div>
				<div class="hospitalAddress">${row.haddr}</div>
			</div>
			<div class="hospitalReview">
				<div class="reviewScore">${row.reviewAverage}</div>
				<div class="reviewCount">(${row.reviewCount})</div>
			</div>
			<div class="hospitalReserve">
				<div class="receptionStatus">접수마감</div>
				<div class="reservationStatus">예약가능</div>
			</div>
		</div>
	</c:forEach>
	

	
</body>
</html>