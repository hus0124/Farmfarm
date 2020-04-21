<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->
	 <!DOCTYPE html>
	 <html>
	 <head>
		 <meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">
		 <meta http-equiv="X-UA-Compatible" content="ie=edge">
	 <title>FarmFarm</title>	 
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
   <script src="/resources/dist/js/main-script.js"></script>
	 <style>
		 * {margin:0; padding:0; text-decoration:none; list-style:none; font-size:15px;}
		 body {font:normal 14px/1.6 'Orbitron', sans-serif; background:#1fab89;}	
	 
		 /*로고*/
		 h1 {position:fixed; top:30px; left:60px; z-index:1;}
		 h1:hover {animation:seesaw 2s none infinite normal;}
		 @keyframes seesaw {
			0% {transform:rotate(0deg);}
			25% {transform:rotate(5deg);}
			50% {transform:rotate(0deg);}
			75% {transform:rotate(-5deg);}
			100% {transform:rotate(0deg);}
		 }
		 
		 /* 배경이미지 */
		 .index_bgimg {position:absolute; top:70px; right:360px; width:290px; height:490px; opacity:0.8;}
		 
		  /* 로그인 */			
		 .login {position:absolute; bottom:85px; right:295px; width:220px; height:140px; border-radius:10px; text-align:center; background:#ccc; transform:scale(1.2)}
		 .login form {padding-top:15px;}
		 .login form input {padding: 5px 0px; margin: 3px 10px; border-radius:6px;}
		 .login form .bt {padding: 5px 15px; margin: 3px 10px; border-radius:6px;}
		 
		  /* 회원가입 */
		 #join h5 {position: relative;;text-align: center; top:50px; font-size:2em;}
	     #join { height: 100%; width: 100%; background-position: center; position:absolute; z-index: 9999; display : none;}
		 #join .form-wrap { width: 380px; height: 480px; position: relative; margin: 6% auto; background: #fff; padding: 5px; overflow: hidden; }
	  	 #join .input-group { top:160px; position: absolute; width: 280px; transition: .5s;}
		 #join .input-field { width: 100%; padding: 10px 0; margin: 5px 50px; border: none; border-bottom: 1px solid #999; outline: none; background: transparent;}
		 #join .submit {width: 85%; padding: 10px 30px; cursor: pointer; display: block; margin: 30px 70px; border-radius: 30px;}
		 #join .join_layer {position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;} 
		 
		  /* 타이틀  */
		 .jombotron {position:absolute; top:140px; left:180px; width:800px; padding-top:50px;}
		 .jombotron span {color: aqua; padding:3px;}
		 .jombotron p {color: #fff;}
		 .jombotron h2 {font-size:40px; color:greenyellow;}
		 .jombotron strong {font-size:40px; color:#fff; padding: 20px;}

		  /* 슬라이드 이미지 */
		  #smart {position:absolute; width:866px; height:500px; top:300px; left:180px; overflow:hidden;}
		  #smart ul{width:400%; height:100%; animation:ani 20s infinite;}
		  #smart li {float:left;  width:866px; height:500px; background-size:cover;}
		  #smart li span {font-size: 50px; text-align: center; z-index:1;background:red;}
		  @keyframes ani {
			0% {margin-left:0;}
			16.666% {margin-left:-100%;}
			33.333% {margin-left:-200%;}
			49.99% {margin-left:-300%;}
			50% {margin-left:-300%;}
			66.666% {margin-left:-200%;}
			83.333% {margin-left:-100%;}
			99.99% {margin-left:0;}
			100% {margin-left:0;}
			}
	 </style>
	 </head>
	 <body>	
		  <!-- 헤더 -->
		<div id="header">
			 
			 <!-- 로고 -->
			<h1><img src="/resources/dist/images/logo-4.png" alt="팜팜이"></h1>

		 	<!-- 배경이미지  -->
		<div id="container">
			<div class="index_bgimg"><img src="/resources/dist/images/index_image.png" alt="배경이미지"></div>
			
			<!-- 로그인 -->
			<div class="login">
				<form action="/user/mainPotal" method="post">
					<input type="text" placeholder="아이디" name="ID"><br>
					<input type="password" placeholder="패스워드" name="PW"><br>
					<input class="bt" type="submit" value="로그인">
				
					<a href = "/user/register"><input class="bt" id="join_opne_bt" type="button" value="회원가입"></a>
					<!--<a href="/user/register"><input class="bt" id="join_opne_bt" type="button" value="회원가입"></a>-->
					<!--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
									
				</form>
			</div>
			
			<!-- 회원가입 -->			
			<div id="join">
				<div class="form-wrap">
					<h5> 회원가입 </h5>
					<form id="register" action="post" class="input-group">
						<input type="text" class="input-field" placeholder="Name" name="name">
						<input type="text" class="input-field" placeholder="ID" name="id">
						<input type="password" class="input-field" placeholder="Password" name="pw">
						<input type="email" class="input-field" placeholder="Email" name="email">
						<button id="join_close_btn" class="submit">가입하기</button>
					</form>
					<div class="join_layer"></div>
				</div>
		    </div>
		  
			<!-- 타이틀 -->
			<div class="jombotron">
				<h2>스마트하고 똑똑하게! <strong>팜팜이</strong>하겠습니다.</h2>	
				<p>팜팜이의 정보가 보고 싶으시다면 <span>회원가입</span>과 <span>로그인</span>을 해 주세요!</p>	
			</div>
			
			 <!-- 슬라이드 이미지 -->
			<div id="smart">
				<ul>
					<li><img src="/resources/dist/images/smart_2.jpg" alt="스마트2"></li>					
					<li><img src="/resources/dist/images/smart_3.jpg" alt="스마트3"></li>
					<li><img src="/resources/dist/images/smart_4.jpg" alt="스마트4"></li>
					<li><img src="/resources/dist/images/smart_5.jpg" alt="스마트5"></li>
				</ul>
			</div>
		</div>
		</div>
		
	<script type = "text/javascript">

    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~");
    } 
    
//     if (msg === "FAIL"){
//         alert("아이디와 비밀번호를 확인해주세요.");
//     }
    
</script>	
	</body>
	 </html>