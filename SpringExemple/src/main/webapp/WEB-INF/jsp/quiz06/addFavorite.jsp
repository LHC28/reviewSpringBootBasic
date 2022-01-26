<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite 추가</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div>제목</div>
		<input type="text" id="name" class="form-control" placeholder="제목을 입력하시오">
		<div>주소</div>
		<div class="d-flex">
			<input type="text" id="address" class="form-control" placeholder="주소를 입력하시오">
			<input type="button" class="btn btn-info isDuplicatedBtn" value="중복확인">
		</div>
		<div class="addressStatusArea"></div>
		<input type="submit" class="btn btn-success addBtn w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function(e){
			$('.isDuplicatedBtn').on('click',function(e){
				var address = $('#address').val();
				$('.addressStatusArea').empty();
				
				if(address==''){
					$('.addressStatusArea').append('<span class="text-danger">주소가 비어있습니다.</span>');
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '/quiz06/is_duplicated_address',
					data: {"address":address},
					success: function(data){
						if(data.result==false){
							$('.addressStatusArea').append('<span class="text-success">저장 가능한 url입니다.</span>')
						}else if(data.result==true){
							$('.addressStatusArea').append('<span class="text-danger">중복된 url입니다.</span>')
						}
					},
					error: function(e){
						alert("error : "+e);
					}
				});
			});
			
			$('.addBtn').on('click',function(e){
				e.preventDefault();
				
				var name = $('#name').val();
				if(name==''){
					alert("제목을 입력하세요");
					return;
				}
				
				var address = $('#address').val();
				if(address==''){
					alert("주소을 입력하세요.");
					return;
				}
				
				$.ajax({
					type: "POST",
					url: "/quiz06/add_favorite",
					data: {"name":name, "address":address},
					success: function(data){
						if(data=='success'){
							location.href="/quiz06/get_new_favorite"
						}
					},
					error: function(e){
						alert("error : "+e);
					}
				});
			});
		});
	</script>
</body>
</html>