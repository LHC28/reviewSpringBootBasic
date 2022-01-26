<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과거 날씨</title>
<%-- bootstrap --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%-- 외부 스타일시트 --%>
<link rel="stylesheet" href="../css/page1.css" type="text/css">
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
			<section class="ml-5 mt-3">
				<h4><b>과거 날씨</b></h4>
				<table class="table table-scriped text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="weather" items="${weatherhistory }" varStatus="status">
						<tr>
							<td>
								<fmt:formatDate value="${weather.date }" pattern="yyyy년 M월 d일"/>
							</td>
							<c:choose>
								<c:when test="${weather.weather eq '맑음' }">
									<td>
										<img src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg" alt="맑음" width="20px" height="20px">
									</td>
								</c:when>
								<c:when test="${weather.weather eq '구름조금' }">
									<td>
										<img src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg" alt="구름조금" width="20px" height="20px">
									</td>
								</c:when>
								<c:when test="${weather.weather eq '흐림' }">
									<td>
										<img src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg" alt="흐림" width="20px" height="20px">
									</td>
								</c:when>
								<c:when test="${weather.weather eq '비' }">
									<td>
										<img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg" alt="비" width="20px" height="20px">
									</td>
								</c:when>
							</c:choose>
							<td>${weather.temperatures }℃</td>
							<td>${weather.preciptitation }mm</td>
							<td>${weather.microDust }
							<td>${weather.windSpeed }km/h</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer class="d-flex">
			<div class="footerLogo d-flex align-items-center justify-content-center">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" alt="기상청 로고" width="80px" height="80px">
			</div>
			<div class="footerFont">주소</div>
		</footer>
	</div>
</body>
</html>