<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "dht11db" method = "get">
온도 <input type = "hidden" name = "Temp">
토양 <input type = "hidden" name = "Ground">
수위 <input type = "hidden" name = "Water">
조도 <input type = "hidden" name = "Light">
<input type = "submit" value = "전송">
</form>
</body>
</html>