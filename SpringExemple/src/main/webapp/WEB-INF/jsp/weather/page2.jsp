<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>

<%-- 외부 스타일시트 --%>
<link rel="stylesheet" href="../css/page1.css" type="text/css">

<!-- jQuery가 datepicker 라이브러리 위에 있어야 한다. (데이터피커가 jquery를 사용하기 때문) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

<!-- datepicker 라이브러리 - 순서가 중요하다. -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 동작. -->

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<div class="d-flex">
			<nav class="bg-primary navBox">
				<%-- 타이틀 로고 --%>
				<div id="navTitle" class="d-flex align-items-center justify-content-center">
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" alt="기상청 로고" width="30px" height="30px">
					<span class="navTitleLogo ml-2">기상청</span>
				</div>
				<%-- 목차 선택 --%>
				<aside>
					<ul class="nav flex-column">
						<li class="nav-item"><a href="#" class="nav-link navFont font-weight-bold">날씨</a></li>
						<li class="nav-item"><a href="http://localhost/weather/page2" class="nav-link navFont font-weight-bold">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-link navFont font-weight-bold">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link navFont font-weight-bold">관측 기후</a></li>
					</ul>
				</aside>
			</nav>
			<section class="col-10 ml-5 mt-3">
				<h3 class="font-weight-bold">날씨 입력</h3>
				<form method="post" action="http://localhost/weather/addWeather">
					<div class="ml-5 d-flex align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<div class="input-label mr-1 box">날짜</div>
							<input type="text" class="form-control" id="date" name="date">
						</div>
						<div class="d-flex align-items-center">
							<div class="box mr-2">날씨</div>
							<select class="form-control" name="weather">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label box mr-2">미세먼지</div>
							<select class="form-control" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
					</div>
					<div class="ml-5 mt-5 d-flex align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<div class="input-label box ml-1">기온</div>
							<div class="input-group">
								<input type="text" class="form-control" name="temperatures">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label mr-1 box">강수량</div>
							<div class="input-group">
								<input type="text" class="form-control" name="preciptitation">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label box mr-1">풍속</div>
							<div class="input-group">
								<input type="text" class="form-control" name="windSpeed">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					<div class="text-right mt-4 mb-5">
						<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
			</section>
		</div>
		<footer class="d-flex">
			<div class="footerLogo d-flex align-items-center justify-content-center">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" alt="기상청 로고" width="80px" height="80px">
			</div>
			<div class="footerFont">주소</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function(){
			$('#date').datepicker({
				changeMongth : true,
				changeYear : true,
				dateFormat : "yy-mm-dd"
			});
				
		});
	</script>
</body>
</html>