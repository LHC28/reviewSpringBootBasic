<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01</title>
</head>
<body>
	<c:set var="num1" value="36" />
	<c:set var="num2" value="3" />
	
	더하기 : <c:out value="${num1+num2 }" /><br>
	빼기 : <c:out value="${num1-num2 }" /><br>
	곱하기 : <c:out value="${num1*num2 }" /> <br>
	나누기 : <c:out value="${num1/num2 }" /> <br>
	
	<c:out value="<title>core out</title>" />
	
	<c:if test="${(num1+num2)/2 >= 10 }">
		<h1>${(num1+num2)/2 }</h1>
	</c:if>
	
	<c:if test="${num1*num2 > 100}">
		<c:out value="<script>alert('너무 큰 수입니다.');</script>" escapeXml="false" />		
	</c:if>
</body>
</html>