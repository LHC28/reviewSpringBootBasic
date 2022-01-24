<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h2>1. 변수 정의하기 (c:set)</h2>
	
	<c:set var="number1" value="100" />
	<c:set var="number2">250</c:set>
	number1: ${number1 }<br>
	number2: ${number2 }<br>
	
	<h2>2. 변수 출력하기 (c:out)</h2>
	number1: <c:out value="${number1 }"/> <br>
	<c:out value="<hello world!!!" /> <br>
	<c:out value="<script>alert('얼럿창 띄우기');</script>" />
	<c:out value="<script>alert('얼럿창 띄우기'); </script>" escapeXml="true" />
	<!--
	<c:out value="<script>alert('얼럿창 띄우기'); </script>" escapeXml="false" />
	<c:out value="<script>console.log('로그 찍기');</script>" escapeXml="false" />
	-->
	
	<h3>3. 조건문 (c:if)</h3>
	<c:if test="${number1 > 50 }">
		number1은 50보다 크다.<br>
	</c:if>
	<c:if test="${number1 == 100 }">
		number1은 100이다.<br>
	</c:if>
	<c:if test="${number1 eq 100 }">
		number1은 100이다.<br>
	</c:if>
	<c:if test="${number1 ne 222 }">
		number1은 222가 아니다.<br>
	</c:if>
	<c:if test="${!empty number1 }">
		number1은 비어있지 않다.
	</c:if>
</body>
</html>