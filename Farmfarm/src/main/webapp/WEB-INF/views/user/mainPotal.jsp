<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm</title>
<link rel="stylesheet" href="/resources/dist/css/main-style.css">
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
   <script src="/resources/dist/js/main-script.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
   <!-- 전체 프레임 -->
   <div id="wrap">
      <!-- 헤더 -->
      <div id="header">
      		
         <!-- 구름 모션 -->
         <div class="cloud">
            <span><img src="/resources/dist/images/cloud1.png" alt="구름1"></span>
            <span><img src="/resources/dist/images/cloud2.png" alt="구름2"></span>
         </div>

         <!-- 로고 -->
         <h1><a href="#"><img src="/resources/dist/images/logo-4.png" alt="팜팜이"></a></h1>

         <!-- GNB -->
         <div id="gnb">
            <ul>            
               <li><a href="/user/logout"><span></span>Log Out</a></li>               
               <li><a href="/user/myinfo"><span></span>내정보</a></li>
               <li><a href="/main/#"><span></span>원격</a></li>
               <li><a href="/main/#"><span></span>게시판</a></li>
            </ul>
         </div>

         <!-- 왼쪽 타이틀 -->
         <div class="title"> 
                            
            <h2><strong>온도/습도 :</strong> 양호</h2>
            <p>기준 온도:???????</p> 
                       
            <h2><strong>수위 :</strong> 양호</h2>
            <p>기준 습도:???????</p>  
                      
            <h2><strong>조도 :</strong> 양호</h2>
            <p>기준 조도:???????</p>   
                     
            <h2><strong>토양 :</strong> 양호</h2>
            <p>기준 토양:???????</p>            
         </div>

         <!-- 모바일 프레임 -->
         <div id="mobile">
            <p><span>00</span>:<span>00</span>:<span>00</span></p>  

            <!-- 모바일 라인 차트 -->
           <div class="graph">
              <div id="Line_Controls_Chart">
      			<!-- 라인 차트 생성할 영역 -->
         		 <div id="lineChartArea" style="padding:0px 0px 0px 0px; width:100%;"></div>
      			<!-- 컨트롤바를 생성할 영역 -->
         		 <div id="controlsArea" style="padding:0px 0px 0px 0px; width:100%;"></div>
    			 </div>
            </div>
         </div>

         <!-- 배경 이미지 변경 메뉴 -->
         <div id="bnb">
            <ul>
               <li><a href="#">온도/습도</a></li>
               <li><a href="#">수위</a></li>
               <li><a href="#">조도</a></li>
               <li><a href="#">토양</a></li>
            </ul>
         </div>
      </div>      
   </div>
   
   
<script type = "text/javascript">
var msg = "${msg}";
console.log(msg);
if (msg==="loginOK"){}
else {
 alert("아이디와 비밀번호를 확인해주세요.");
 self.location = "/user/index"};
</script>
   
</body>
</html>