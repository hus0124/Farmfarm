<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm User Control</title>
</head>
<body>
<form action = "WebServLED" method = "get">
<button type = "submit" name = "LED" value = "1">워터펌프 ON </button>
<button type = "submit" name = "LED" value = "2">워터펌프 OFF </button>

<br><br><br>
<button type = "submit" name = "LED" value = "3">LED 켜기</button>
<button type = "submit" name = "LED" value = "4">LED 끄기 </button>
</form>

<div class="form-group">
	 <a href = "/user/myinfo"><button class = "btn btn-default" style = "width:145px;">내정보보기</button></a>
	 <a href = "/user/mainPotal"><button class = "btn btn-primary" style = "width:145px;">메인화면</button></a>
</div>
 
</body>
</html>