<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		
		<form method="post" action="/lesson06/ex01/add_user">
			<label for="name"><b>이름:</b><input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요."></label>
			<label for="yyyymmdd"><b>생년월일:</b><input type="text" id="yyyymmdd" name="yyyymmdd" class="form-control" placeholder="예) 19990101"></label><br>
			<b>자기 소개:</b><br>
			<textarea name="introduce" rows="10" cols="5" class="form-control"></textarea><br>
			<label for="email" class="w-25"><b>이메일 주소:</b><input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요"></label>
			
			<p><input type="submit" id="addBtn" class="btn btn-success" value="추가"></p>
		</form>
	</div>
	
	<script>
		$(document).ready(function(e){
			/*
			1. jquery의 submit 기능 이용하기
			$("form").on("submit", function(e){
				e.preventDefault(); // submit되는 것을 막는다.
				
				// validation
				var name = $('#name').val().trim();
				if(name==''){
					alert("이름을 입력해주세요.")
					return false;
				}
				
				var yyyymmdd = $('#yyyymmdd').val().trim();
				if(yyyymmdd==''){
					alert("생년월일을 입력해주세요.");
					return false;
				}
				//$(this).submit();
			});
			*/
			
			// jquery의 AJAX통신 이용하기
			$('#addBtn').on('click',function(e){
				e.preventDefault();
				//alert("추가버튼클릭");
				
				//validation
				var name = $('#name').val().trim();
				if(name==''){
					alert("이름을 입력해주세요.");
					return;
				}
				
				var yyyymmdd = $('#yyyymmdd').val().trim();
				if(yyyymmdd==''){
					alert("생년월일을 입력해주세요.");
					return;
				}
				
				if(isNaN(yyyymmdd)){ // 모두 숫자인지 확인
					alert("숫자만 입력해주세요.");
					return;
				}
				
				var introduce = $('textarea[name=introduce]').val();
				
				var email = $('#email').val().trim();
				
				$.ajax({
					type: "POST",
					url: "/lesson06/ex01/add_user",
					data: {"name"=name, "yyyymmdd"=yyyymmdd, "introduce"=introduce, "email"=email},
					success: function(date){
						alert(data);
						location.href="/lesson06/ex01/get_user";
					},
					complete: function(data){
						alert("완료");
					},
					error: function(e){
						alert("error "+e);
					}
				});
			});
			
		});
	</script>
</body>
</html>