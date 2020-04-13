<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
<a4>회원 가입 </a4>
<form action ="/user/register" method = "post">
아이디<input type = "text" name = "ID"><br>
패스워드<input type = "text" name = "PW"><br>
이름<input type = "text" name = "Username"><br>
이메일<input type = "text" name = "Email"><br>
시리얼번호<input type = "text" name = "Serialnum"><br>
<input type = "submit" value = "가입하기">
</form>
</body>
</html>