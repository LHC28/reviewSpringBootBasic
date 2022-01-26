<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 추가하기</title>
</head>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<body>
	<div class="container">
		<b>이름:</b>
		<label for="name"><input type="text" id="name" class="form-control" placeholder="이름을 입력하세요."></label>
		<button id="nameCheckBtn" type="button" class="btn btn-info">중복확인</button>
		<div id="nameStatusArea"></div><br>
		<button id="joinBtn" type="submit" class="btn btn-success">가입하기</button>
	</div>
	<script>
		$(document).ready(function(){
			$('#nameCheckBtn').on('click',function(){
				var name = $('#name').val().trim();
				
				$('#nameStatusArea').empty();
				
				if(name==''){
					$('#nameStatusArea').append('<span class="text-danger">이름이 비어있습니다.</span>');
					return;
				}
				
				$.ajax({
					type: 'get',
					url: '/lesson06/ex02/is_duplication',
					data: {'name':name},
					success: function(data){
						if(data.is_duplication == true){
							$('#nameStatusArea').append('<span class="text-danger">중복된 이름입니다.</span>');
						}
					},
					error: function(e){
						alert("실패: "+e);
					}
				});
			});
			
			$('#joinBtn').on('click', function(e){
				e.preventDefault();
				
				console.log($('#nameStatusArea').children().length);
				
				if($('#nameStatusArea').children().length == 0){
					alert("서브밋 가능");
				}else{
					alert("서브밋 불가");
				}
			});
		});
	</script>
</body>
</html>