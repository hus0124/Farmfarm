<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm User Control</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="row" class="col-lg-12" style = "margin-top:120px;" >
  
  <!-- /.col-lg-12 -->
</div>
	<div class="col-lg-4"></div>
	<div class="row" style="left:150px;">
		<div class="col-lg-4" style="transform:scale( 1.2 ); margin-top:100px;">
		<div class="panel panel-default">	
		<div class="panel-heading" style=" text-align: center; background:#1fab89;"><samp style="color:#fff">원격조정</samp></div>
      <!-- /.panel-heading -->
    	<div class="panel-body" style=" margin-left: 150px; padding: 30px 0px;">
    	
			<form action = "WebServLED" method = "get">
			<button class="btn_water" style = "width:110px; margin:10px 0px 5px 47px;" type = "submit" name = "LED" value = "1">워터펌프 ON </button>
			<button class="btn_water" style = "width:110px; margin:10px 5px 5px 10px;" type = "submit" name = "LED" value = "2">워터펌프 OFF </button><br>
			<button class="btn_led" style = "width:110px; margin:5px 0px 0px 47px;" type = "submit" name = "LED" value = "3" style="margin-left:20px">LED 켜기</button>
			<button class="btn_led" style = "width:110px; margin:5px 0px 5px 10px;" type = "submit" name = "LED" value = "4">LED 끄기 </button>
			</form>
			<br>			
			<div class="form-group">
				 <a href = "/user/myinfo"><button class = "btn btn-default" style = "width:145px; margin:10px">내정보보기</button></a>
				 <a href = "/user/mainPotal"><button class = "btn btn-primary" style = "width:145px; margin:10px">메인화면</button></a>
			</div>
			<div class="layer"></div>
		</div>
	</div>
	</div>
</div>
</body>
</html>