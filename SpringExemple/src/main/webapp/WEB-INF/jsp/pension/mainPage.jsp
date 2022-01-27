<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<!-- jQuery가 datepicker 라이브러리 위에 있어야 한다. (데이터피커가 jquery를 사용하기 때문) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

<!-- datepicker 라이브러리 - 순서가 중요하다. -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 동작. -->

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/mainPage.css" type="text/css">
</head>
<body>
	<div class="container">
		<header class="d-flex align-items-center justify-content-center"><a href="/pension/pension_view"><h1 class="titleFont">통나무 팬션</h1></a></header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="" class="nav-link navFont">팬션소개</a></li>
				<li class="nav-item"><a href="" class="nav-link navFont">객실보기</a></li>
				<li class="nav-item"><a href="/pension/reservation_view" class="nav-link navFont">예약하기</a></li>
				<li class="nav-item"><a href="/pension/reservationList_view" class="nav-link navFont">예약목록</a></li>
			</ul>
		</nav>
		<section>
			<img id="banner" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="배너 사진" width="1110px" height="400px">
		</section>
		<section id="contents" class="d-flex">
			<div id="reservationBox" class="col-4 d-flex align-items-center justify-content-center">
				<div class="reservationBoxFont">
					<a href="#">실시간<br>
					예약하기</a>
				</div>
			</div>
			<div id="loginBox" class="col-5">
				<div class="m-3">
					<span class="loginBoxFont1">예약 확인</span>
				</div>
				<div class="loginBox m-2">
					<div id="memberBox">
						<div class="d-flex justify-content-end mr-3">
							<span class="text-white">이름:</span>
							<input type="text" id="name" class="form-control input-form ml-4">
						</div>
						<div class="d-flex justify-content-end mr-3 mt-2">
							<span class="text-white">전화번호:</span>
							<input type="text" id="phoneNumber" class="form-control input-form ml-2">
						</div>
						<div class="mt-3 mr-3 text-right">
							<input type="button" class="btn btn-success submitBtn" value="조회 하기">
						</div>
					</div>
					
				</div>
			</div>
			<div id="phoneNumberBox" class="col-3 d-flex align-items-center justify-content-center">
				<div class="phoneNumberBoxFont">
					예약문의:<br>010-<br>000-1111
				</div>
			</div>
		</section>
		<footer class="m-2">
			제주특별자치도 제주시 애월읍<br>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김동욱<br>Copyright 2025 tongnamu All right reserved
		</footer>
	</div>
	
	<script>
		$(document).ready(function(){
			
			// 1. 로그인 창
			$('input[name=member]').change(function(e){
				var radioValue = $(this).val();
				if(radioValue=='member'){
					$('#memberBox').removeClass('d-none');
					$('#nonMemberBox').addClass('d-none');
				}else if(radioValue=='nonMember'){
					$('#memberBox').addClass('d-none');
					$('#nonMemberBox').removeClass('d-none');
				}
			});
            
			//2. datepicker
			$('#reserveDateText').datepicker({
				dateFormat:"yy년 mm월 dd일"
				,minDate:0 //오늘 날짜 이후 선택
			});
			
			// 3. 로그인창 유효성 검사
			$('.submitBtn').on('click',function(e){
				e.preventDefault();
				var name = $('#name').val();
				if(name==''){
					alert("이름을 입력해주세요.");
					return;
				}
				var phoneNumber = $('#phoneNumber').val();
				if(phoneNumber==''){
					alert("전화번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
					type: "post",
					url: "/pension/get_reservation",
					data: {"name":name, "phoneNumber":phoneNumber},
					success: function(data){
						if(data.result=='success'){
							alert(
									+"\n이름 : "+data.name
									+"\n날짜 : "+data.date
									+"\n일수 : "+data.day
									+"\n인원 : "+data.headcount
									+"\n상태 : "+data.state
									);
						}else{
							alert("예약 내역이 없습니다.");
						}
					},
					error: function(e){
						alert("error : "+e);
					}
				});
			});
			
			//4. 이미지 슬라이드
			var image = document.getElementById('banner');
			var imageArray = [
				"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg",
				"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg",
				"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg",
				"http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg"
			];
			var imageIndex=0;
			
			function changeImage(){
				image.setAttribute("src",imageArray[imageIndex]);
				imageIndex++;
				if(imageIndex>=imageArray.length){
					imageIndex=0;
				}
			}
			setInterval(changeImage,3000);
		});
	</script>
</body>
</html>