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

    <title>회원 탈퇴</title>

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
    <h1 class="page-header">회원 탈퇴 처리</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="col-lg-4" ></div>
<div class="row" style="left:150px;">
 <div class="col-lg-4" style="transform: scale( 1.2 ); margin-top: 100px;">
  <div class="panel panel-default">

   <div class="panel-heading" style=" text-align: center; background:#1fab89;"><samp style="color:#fff">주의! 회원 탈퇴가 진행됩니다</samp></div>
      <!-- /.panel-heading -->
    <div class="panel-body" style=" margin-left: 150px; padding: 30px 0px;">

	 <form action = "/user/leave" method = "post"> 
	
	  <div class="form-group">
	   
	   <label>비밀번호 확인 </label> 
	   <input class = "form-control" type = "password" name = "PW" style = "width:300px;">
	   <label>정말 회원 정보를 삭제하고 탈퇴 하시겠습니까?</label><br><br> 
	   <button type="submit" class="btn btn-danger" style = "width:145px;">탈퇴하기</button>
	  </div>
	 </form> 
	
	<div class="form-group">
	 <a href = "/user/myinfo"><button class = "btn btn-default" style = "width:145px;">내정보보기</button></a>
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
    if (msg === "leaveOK") {
        alert("회원탈퇴 처리 완료되었습니다. 감사합니다.");
        self.location = "/user/index"
    }; 
    
</script>
    
</body>
</html>