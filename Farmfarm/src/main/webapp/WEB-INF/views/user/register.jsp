<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
<h4>회원 가입 </h4> --%>
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

    <title>팜팜이 회원 가입 페이지</title>

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
    <link href="/resources/dist/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>

<body>
<div class="row">
  <div class="col-lg-12" style=" text-align: center;">
    <h1 class="page-header">회원 가입을 환영합니다</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="col-lg-4" ></div>
<div class="row" style="left:150px;">
 <div class="col-lg-4" style="transform: scale( 1.2 ); margin-top: 100px;">
  <div class="panel panel-default">

   <div class="panel-heading" style=" text-align: center; background:#1fab89;"><samp style="color:#fff">팜팜이 회원 등록</samp></div>
      <!-- /.panel-heading -->
    <div class="panel-body" style=" margin-left: 150px; padding: 30px 0px;">
      
     <form role="form" action ="/user/register" method = "post">
      
      <div class="form-group">
       <label>아이디</label><input class = "form-control" type = "text" id = "user_id" name = "ID" style = "width:300px;" >
      </div> 
	  
	   <div class="check_font" id="id_check"></div> <!-- 아이디 검사표시 자리 -->
	   

	  <div class="form-group">
       <label>패스워드</label><input class = "form-control" type = "password" name = "PW" style = "width:300px;" required>
      </div> 
	  
	  <div class="form-group">
       <label>이름</label><input class = "form-control" type = "text" name = "Username" style = "width:300px;" required>
      </div> 
	  
	  <div class="form-group">
       <label>이메일</label><input class = "form-control" type = "text" name = "Email" style = "width:300px;" required>
      </div> 
	  
	  <div class="form-group">
       <label>시리얼번호</label><input class = "form-control" type = "text" name = "Serialnum" style = "width:300px;" required>
      </div> 
		
	  <button type="submit" class="btn btn-primary" style = "width:145px;">가입하기</button>
      <button type="reset" class="btn btn-default" style = "width:145px;">입력 초기화하기</button>

	 </form>

	 </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<script type="text/javascript">
	
 $(document).ready(function(){	
	// 아이디 유효성 검사(1 = 중복 / 0 = !중복)
		$("#user_id").blur(function() {
			
			var ID = $('#user_id').val();
			var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;

			$.ajax({
				url : '/user/idCheck?ID='+ ID, // ${pageContext.request.contextPath}
				type : 'get',
				
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : " + data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#id_check").text("사용중인 아이디입니다 :p");
							$("#id_check").css("color", "red");
							$("#reg_submit").attr("disabled", true);
						} else {
							
							if(idJ.test(ID)){
								// 0 : 아이디 길이 / 문자열 검사
								$("#id_check").text("");
								$("#reg_submit").attr("disabled", false);
					
							} else if(ID == ""){
								
								$('#id_check').text('아이디를 입력해주세요 :)');
								$('#id_check').css('color', 'red');
								$("#reg_submit").attr("disabled", true);				
								
							} else {
								
								$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
								$('#id_check').css('color', 'red');
								$("#reg_submit").attr("disabled", true);
							}
							
						}
					}, error : function() {
							console.log("실패");
					}
				}); // ajax end
			}); // function end
});	
		
</script>

</body>

</html>
