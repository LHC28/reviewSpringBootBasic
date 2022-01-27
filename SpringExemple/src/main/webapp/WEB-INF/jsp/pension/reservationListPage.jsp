<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
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
			<div class="d-flex align-items-center justify-content-center">
				<h3 class="font-weight-bold mt-2">예약 목록 보기</h3>
			</div>
			<table class="table table-scriped text-center">
				<thead>
					<tr>
						<td>이름</td>
						<td>예약날짜</td>
						<td>숙박일수</td>
						<td>숙박인원</td>
						<td>전화번호</td>
						<td>예약상태</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${bookingList }" varStatus="status">
					<tr>
						<td>${booking.name }</td>
						<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" /></td>
						<td>${booking.headcount }</td>
						<td>${booking.day }</td>
						<td>${booking.phoneNumber }</td>
						<c:choose>
							<c:when test="${booking.state eq '대기중'}">
								<td class="text-primary">대기중</td>
							</c:when>
							<c:when test="${booking.state eq '확정'}">
								<td class="text-success">확정</td>
							</c:when>
							<c:when test="${booking.state eq '취소' }">
								<td class="text-danger">취소</td>
							</c:when>
						</c:choose>
						<td><input type="button" class="btn btn-danger delBtn text-white" value="삭제" data-booking-id="${booking.id }"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
</body>
<script>
	$(document).ready(function(){
		// 1. 삭제 버튼 구현
		$('.delBtn').on('click',function(e){
			var bookingId = $(this).data('booking-id');
			
			$.ajax({
				type: "post",
				url: "/pension/del_booking",
				data: {"bookingId":bookingId},
				success: function(data){
					if(data.result=='success'){
						location.reload();
					}else{
						alert("삭제에 실패하였습니다.");
					}
				},
				error: function(e){
					alert("error : "+e);
				}
			});
		});
	});
</script>
</html>