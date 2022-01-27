<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
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
			<div class="d-flex align-items-center justify-content-center mt-3">
				<h3 class="font-weight-bold">예약 하기</h3>
			</div>
			<div class="d-flex justify-content-center">
				<div>
					<div class="inputFormFont font-weight-bold">이름</div>
					<div class="inputForm"><input type="text" id="name" class="form-control"></div>
					<div class="inputFormFont font-weight-bold mt-4">예약날짜</div>
					<div class="inputForm"><input type="text" id="reservationDate" class="form-control"></div>
					<div class="inputFormFont font-weight-bold mt-4">숙박일수</div>
					<div class="inputForm"><input type="text" id="day" class="form-control"></div>
					<div class="inputFormFont font-weight-bold mt-4">숙박인원</div>
					<div class="inputForm"><input type="text" id="headcount" class="form-control"></div>
					<div class="inputFormFont font-weight-bold mt-4">전화번호</div>
					<div class="inputForm mb-4"><input type="text" id="phoneNumber" class="form-control"></div>
					<input type="button" class="btn btn-warning reservationBtn mt-3" value="예약하기">
				</div>
			</div>
		</section>
			<footer class="m-2">
			제주특별자치도 제주시 애월읍<br>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김동욱<br>Copyright 2025 tongnamu All right reserved
		</footer>
	</div>
</body>
<script>
	$(document).ready(function(){
		$('#reservationDate').datepicker({
			dateFormat: "yy-mm-dd",
			minDate:0
		})
		
		$('.reservationBtn').on('click',function(e){
			var name = $('#name').val();
			if(name==''){
				alert("이름을 입력하세요.");
				return;
			}
			
			var reservationDate = $('#reservationDate').val();
			if(reservationDate==''){
				alert("예약날짜를 입력하세요.");
				return;
			}
			
			var day = $('#day').val();
			if(day==''){
				alert("숙박일수를 입력하세요.");
				return;
			}else if(isNaN(day)==true){
				alert("숫자로 입력하세요.");
				return;
			}
			
			var headcount = $('#headcount').val();
			if(headcount==''){
				alert("숙박인원을 입력하세요.");
				return;
			}else if(isNaN(headcount)==true){
				alert("숫자로 입력하세요.");
				return;
			}
			
			var phoneNumber = $('#phoneNumber').val();
			if(phoneNumber==''){
				alert("전화번호를 입력하세요.");
				return;
			}
			
			$.ajax({
				type: "post",
				url: "/pension/add_booking",
				data: {"name":name, "reservationDate":reservationDate, "day":day, "headcount":headcount, "phoneNumber":phoneNumber},
				success: function(data){
					if(data.result=='success'){
						alert("예약 성공");
						location.href="/pension/pension_view"
					}else{
						alert("실패");
					}
				},error: function(e){
					alert("error : "+e);
				}
			});
		});
	});
</script>
</html>