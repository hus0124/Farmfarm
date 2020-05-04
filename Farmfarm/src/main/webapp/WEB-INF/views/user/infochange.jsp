<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>INFO Modify</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<div class="row">
  <div class="col-lg-12" style=" text-align: center;">
    <h1 class="page-header">내 정보 수정</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="col-lg-4" ></div>
<div class="row" style="left:150px;">
 <div class="col-lg-4" style="transform: scale( 1.2 ); margin-top: 100px;">
  <div class="panel panel-default">

   <div class="panel-heading" style=" text-align: center; background:#1fab89;"><samp style="color:#fff">원하시는 정보를 수정하시려면 비밀번호를 입력하세요</samp></div>
      <!-- /.panel-heading -->
    <div class="panel-body" style=" margin-left: 150px; padding: 30px 0px;">

<% int choice = (int)request.getAttribute("choice");

	switch(choice){
		case 1 : // 1번 이름 수정하기
%>
    <form action = "/user/infochange" method = "post"> 
	 <div class="form-group">
	   <label>기존 이름 : ${UserVO.getUsername() }</label><br><br>
	   <label>비밀번호 확인 </label> 
	   <input class = "form-control" type = "password" name = "PW" style = "width:300px;">
	   <label>변경할 이름 입력 </label> 
	   <input class = "form-control" type = "text" name = "Username" style = "width:300px;" required>
	   <button type="submit" class="btn btn-warning" style = "width:145px;" name = "choice" value = "1">수정하기</button>
	 </div> 
    </form>
<% break; 
	
		case 2 : //2번 이메일 수정하기
%>
    <form action = "/user/infochange" method = "post"> 
	 <div class="form-group">
	   <label>기존 이메일 : ${UserVO.getEmail() }</label><br><br>
	   <label>비밀번호 확인 </label> 
	   <input class = "form-control" type = "password" name = "PW" style = "width:300px;">
	   <label>변경할 이메일 입력 </label> 
	   <input class = "form-control" type = "text" name = "Email" style = "width:300px;" required>
	   <button type="submit" class="btn btn-warning" style = "width:145px;" name = "choice" value = "2">수정하기</button>
	 </div> 
    </form>
   
<% break;

		case 3 : //3번 시리얼 넘버 수정하기
%>	
	<form action = "/user/infochange" method = "post"> 
	 <div class="form-group">
	   <label>기존 시리얼 넘버 : ${UserVO.getSerialnum() } </label><br><br>
	   <label>비밀번호 확인 </label> 
	   <input class = "form-control" type = "password" name = "PW" style = "width:300px;">
	   <label>변경할 시리얼 넘버 입력 </label> 
	   <input class = "form-control" type = "text" name = "Serialnum" style = "width:300px;" required>
	   <button type="submit" class="btn btn-warning" style = "width:145px;" name = "choice" value = "3">수정하기</button>
	 </div> 
    </form>
   
<% break;

	case 4 : //4번 비밀번호 수정하기
%>	
	<form action = "/user/pwchange" method = "post"> 
	 <div class="form-group">
	   
	   <label>기존 비밀번호 확인 </label> 
	   <input class = "form-control" type = "password" name = "PW" style = "width:300px;">
	   <label>변경할 비밀번호 입력 </label> 
	   <input class = "form-control" type = "password" name = "afterPW" style = "width:300px;" required>
	   <button type="submit" class="btn btn-warning" style = "width:145px;">수정하기</button>
	 </div> 
    </form>

<% break; } %>
	<div class="form-group">
	 <a href = "/user/myinfo"><button class = "btn btn-default" style = "width:145px;">내정보보기</button></a>
	 <a href = "/user/mainPotal"><button class = "btn btn-primary" style = "width:145px;">메인화면</button></a>
	</div> 
	
		
     </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type = "text/javascript">
var msg = "${msg}";
console.log(msg);

if (msg==="wrongPW") {
 alert("비밀번호 입력을 다시 확인해주세요.");
 self.location = "/user/myinfo"};
</script>

</body>
</html>