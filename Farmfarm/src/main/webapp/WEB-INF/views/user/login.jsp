<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<a4>로그인</a4>
<form action = "/user/loginpost" method = "post">
아이디<input type = "text" name = "ID"><br>
패스워드<input type = "text" name = "PW">
<input type = "submit" value = "로그인">
</form>

<script>

    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~");
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }
    
</script>

</body>
</html>