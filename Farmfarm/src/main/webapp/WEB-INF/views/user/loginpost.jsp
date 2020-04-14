<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이 페이지가 뜬다면 로그인 성공</h2>

<form action = "/user/logout" method = "get">
<input type = "submit" value = "로그아웃">
</form>
<a href="admintemp.jsp">관리자페이지로 가나 테스트해보기</a>
<script>
 alert("아이디와 비밀번호를 확인해주세요.");
 self.location = "/user/login";
</script>
    
</body>
</html>