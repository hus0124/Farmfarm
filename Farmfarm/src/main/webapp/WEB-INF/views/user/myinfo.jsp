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

    <title>My INFO</title>
</head>
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
    
<body>
<div class="row">
  <div class="col-lg-12" style=" text-align: center;">
    <h1 class="page-header">Information</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="col-lg-4" ></div>
<div class="row" style="left:150px;">
 <div class="col-lg-4" style="transform: scale( 1.2 ); margin-top: 100px;">
  <div class="panel panel-default">

   <div class="panel-heading" style=" text-align: center; background:#1fab89;"><samp style="color:#fff">정보 보기/수정</samp></div>
      <!-- /.panel-heading -->
    <div class="panel-body" style=" margin-left: 150px; padding: 30px 0px;">

	 <form role = "form" action = "/user/infochange1" method = "get">
	  <div class="form-group">
       <label>아이디</label>
       <input class = "form-control" type = "text" value = "${info.getID()}" style = "width:300px;">
	  </div>
	  
	  <div class="form-group">
       <label>이름</label>
       <input class = "form-control" type = "text" value = "${info.getUsername()}" style = "width:300px;">
	   <button type="submit" class="btn btn-warning" style = "width:145px; margin: 10px 0px;" name = "choice" value = "1">수정하기</button>
	  </div>

	  <div class="form-group">
       <label>이메일</label>
       <input class = "form-control" type = "text" value = "${info.getEmail()}" style = "width:300px;">
	   <button type="submit" class="btn btn-warning" style = "width:145px; margin: 10px 0px;" name = "choice" value = "2">수정하기</button>
	  </div>

	  <div class="form-group">
       <label>시리얼번호</label>
       <input class = "form-control" type = "text" value = "${info.getSerialnum()}" style = "width:300px;">
	   <button type="submit" class="btn btn-warning" style = "width:145px; margin: 10px 0px;" name = "choice" value = "3">수정하기</button>
	  </div>
	  
	  <div class="form-group">
       <label>비밀번호 변경</label><br>
       <button type="submit" class="btn btn-warning" style = "width:145px; margin: 10px 0px;" name = "choice" value = "4">변경하기</button>
	  </div>

     </form> 

	  <div class="form-group">
	   <a href = "/user/mainPotal"><button class = "btn btn-primary" style = "width:145px;">메인화면</button></a>
	   <a href="/user/leave"><button class = "btn btn-danger" style = "width:145px;margin: 0px 20px;">회원 탈퇴하기</button></a>
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

if (msg==="changeOK") {
 alert("정보가 수정되었습니다.");
 self.location = "/user/myinfo"
 };
</script>

</body>
</html>