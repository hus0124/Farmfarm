<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
${adminuser }

<%
System.out.println("시스템 프린트"+session.getAttribute("adminuser"));
if (session.getAttribute("adminuser")!="admin"){
%>
접근이 제한된 페이지 입니다. <a href="/user/index">홈으로 돌아가세요</a> 
<% } else { %>
관리자만 볼 수 있어야 하는 페이지
<% } %>

</body>
</html>