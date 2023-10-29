<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/writeReview.css">

<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
	$(function() {
		let rate;
		let dno;
		let keyword;
		let keyword1;
		let keyword2;

		$('.xi-star-o').click(function() {
			rate = parseInt($(this).children('#rate').val());
			for (let i = 1; i <= rate; i++) {
				$('.star' + i).addClass('xi-star')
				$('.star' + i).removeClass('xi-star-o')
			}
			;
			for (let i = (rate + 1); i <= 5; i++) {
				$('.star' + i).addClass('xi-star-o')
				$('.star' + i).removeClass('xi-star')
			}
			;
			setTimeout(function() {
				$('.hospitalInfo').addClass('goUp');
				$('.hospitalInfo').removeClass('hospitalInfo');
				$('#ask').remove()
				$('.totalDoctor').show();
			}, 1000);

		});

		$('.selectDoctorInfo').click(function() {
			dno = $(this).children('#doctor').val()
			$('.selectDoctorInfo').removeClass('selectedDoc')
			$('.doctor' + dno).addClass('selectedDoc')

		});

		$('.treatment').click(function() {
			keyword1 = $(this).val()
		});
		$('.feedback').click(function() {
			keyword2 = $(this).val()
			alert(keyword2)
			keyword = keyword1 + ',' + keyword2;
			alert(keyword)
		});

	})
</script>

</head>
<body>

	<div class="hospitalInfo">
		<img alt=""
			src="https://cdn0.iconfinder.com/data/icons/medical-flat-20/58/006_Hospital-1024.png">
		<div id="ask">
			<span>진료는 어떠셨어요?</span>
		</div>
		<div id="hospitalName">
			<span>${hospital.hname }</span>

			<div class="selectStars">
				<c:forEach var="i" begin="1" end="5">
					<i class="star${i } xi-star-o xi-x"> <input id="rate"
						type="hidden" value="${i }"></i>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>

	<div class="totalDoctor">
		<div class="selectDocotrTitle">진료 받으신 의사를 선택해주세요</div>
		<div class="selectDoctor">
			<c:forEach var="doctor" items="${doctor}">
				<div class="selectDoctorInfo doctor${doctor.dno }">
					<img alt="의사사진" src="${doctor.dimg }"><br>
					${doctor.dname } <input type="hidden" id="doctor"
						value="${doctor.dno }">
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="totalTreatment">
		<div class="treatmentTitle">진료 결과는 어때요?</div>
		<button class="treatment" value="효과없어요">효과 없어요</button>
		<button class="treatment" value="보통이에요">보통이에요</button>
		<button class="treatment" value="효과좋아요">효과 좋아요</button>
	</div>

	<div class="totalFeedback">
		<div class="feedbackTitle">진료 결과는 어때요?</div>
		<button class="feedback" value="불친절해요">불친절해요</button>
		<button class="feedback" value="보통이에요">보통이에요</button>
		<button class="feedback" value="친절해요">친절해요</button>
	</div>

</body>
</html>