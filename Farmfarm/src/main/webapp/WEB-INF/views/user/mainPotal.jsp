<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm</title>
<link rel="stylesheet" href="/resources/dist/css/main-style.css">
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body> 
      <!-- 헤더 -->
      <div id="header">
      		
         <!-- 구름 모션 -->
         <div class="cloud">
            <span><img src="/resources/dist/images/cloud1.png" alt="구름1"></span>
            <span><img src="/resources/dist/images/cloud2.png" alt="구름2"></span>
         </div>

         <!-- 로고 -->
         <h1><a href="http://iotmit.iptime.org:3233/user/mainPotal"><img src="/resources/dist/images/logo-4.png" alt="팜팜이"></a></h1>

         <!-- GNB -->
         <div id="gnb">
            <ul>            
               <li><a href="/user/logout"><span></span>Log Out</a></li>               
               <li><a href="/user/myinfo"><span></span>내정보</a></li>
               <li><a href="/test/testWeb"><span></span>원격</a></li>
               <li><a href="/board/list"><span></span>게시판</a></li>
            </ul>
         </div>

         <!-- 왼쪽 타이틀 -->
          <div class="time"><span id="dpTime"></span></div>
          
         <div class="title">                             
            <h2><strong>온도 :</strong>&nbsp;<span id="tempck"></span></h2>
            <!--<p>기준 온도:???????</p> -->
                       
            <h2><strong>수위 :</strong>&nbsp;<span id="waterck"></span></h2>
            <!--<p>기준 습도:???????</p> --> 
                      
            <h2><strong>조도 :</strong>&nbsp;<span id="lightck"></span></h2>
            <!--<p>기준 조도:???????</p> -->  
                     
            <h2><strong>토양 :</strong>&nbsp;<span id="groundck"></span></h2>
            <!--<p>기준 토양:???????</p>-->            
         </div>

         <!-- 모바일 프레임 -->
         <div id="mobile">
          <div class="image"><img src="/resources/dist/images/smart555.jpg" alt="모바일 바탕이미지"></div> 
            <!-- 모바일 라인 차트 -->
         <div class="chart">    
          	 <div id="chart" style="height:720px"></div>                    
         </div>

         <!-- 배경 이미지 변경 메뉴 -->
         <div id="bnb">
            <ul id="select">            	
               <li class="btn_temp"><a href="#">온도</a></li>
               <li class="btn_water"><a href="#">수위</a></li>
               <li class="btn_light"><a href="#">조도</a></li>
               <li class="btn_ground"><a href="#">토양</a></li>
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

<script type = "text/javascript">

	//시간 데이터
	setInterval("dpTime()",1000);
    function dpTime(){
       var now = new Date();
        hours = now.getHours();
        minutes = now.getMinutes();
        seconds = now.getSeconds();
 
        if (hours > 12){
            hours -= 12;
        ampm = "오후 ";
        }else{
            ampm = "오전 ";
        }
        if (hours < 10){
            hours = "0" + hours;
        }
        if (minutes < 10){
            minutes = "0" + minutes;
        }
        if (seconds < 10){
            seconds = "0" + seconds;
        }
	document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds;
    }


	//센서별 데이터
	document.addEventListener("DOMContentLoaded", function() {setInterval(check, 1000);});
	function check(){
   
    	$.ajax({
      		url:"http://iotmit.iptime.org:3180/ajax/tempcheck",
      		type:"get",
      		async:false,
      		cache:false,
      
      		success:function(data){
         		$("#tempck").html(data);
         		console.log(data+"ajax");
         		value=Number(data);
         	}
		});
    		   
        $.ajax({
          	url:"http://iotmit.iptime.org:3180/ajax/watercheck",
          	type:"get",
          	async:false,
          	cache:false,
          
          	success:function(data){
             	$("#waterck").html(data);
             	console.log(data+"ajax");
             	value=Number(data);
             }
    	});
        
        $.ajax({
          	url:"http://iotmit.iptime.org:3180/ajax/lightcheck",
          	type:"get",
          	async:false,
          	cache:false,
          
          	success:function(data){
             	$("#lightck").html(data);
             	console.log(data+"ajax");
             	value=Number(data);
             }
    	});
        
        $.ajax({
          	url:"http://iotmit.iptime.org:3180/ajax/groundcheck",
          	type:"get",
          	async:false,
          	cache:false,
          
          	success:function(data){
             	$("#groundck").html(data);
             	console.log(data+"ajax");
             	value=Number(data);
             }
    	});   	
	}

	
 	 $('.btn_temp').click(function(){   
       google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChart);	
       function drawChart() {   	
      	var data = google.visualization.arrayToDataTable([
     		['Time', 'Temp'],
     		['${timeList.get(0).getTime()}', ${tempList.get(0).getTemp()}],
     		['${timeList.get(1).getTime()}', ${tempList.get(1).getTemp()}],
     		['${timeList.get(2).getTime()}', ${tempList.get(2).getTemp()}],
     		['${timeList.get(3).getTime()}', ${tempList.get(3).getTemp()}],
     		['${timeList.get(4).getTime()}', ${tempList.get(4).getTemp()}],
     		['${timeList.get(5).getTime()}', ${tempList.get(5).getTemp()}],
     		['${tiemList.get(6).getTime()}', ${tempList.get(6).getTemp()}],
			['${timeList.get(7).getTime()}', ${tempList.get(7).getTemp()}],
     		['${timeList.get(8).getTime()}', ${tempList.get(8).getTemp()}],
     		['${timeList.get(9).getTime()}', ${tempList.get(9).getTemp()}],
     		['${timeList.get(10).getTime()}', ${tempList.get(10).getTemp()}],
     		['${timeList.get(11).getTime()}', ${tempList.get(11).getTemp()}],
     		['${timeList.get(12).getTime()}', ${tempList.get(12).getTemp()}],
     		['${tiemList.get(13).getTime()}', ${tempList.get(13).getTemp()}],
     		['${timeList.get(14).getTime()}', ${tempList.get(14).getTemp()}],
     		['${timeList.get(15).getTime()}', ${tempList.get(15).getTemp()}],
     		['${timeList.get(16).getTime()}', ${tempList.get(16).getTemp()}],
     		['${tiemList.get(17).getTime()}', ${tempList.get(17).getTemp()}],
     		['${timeList.get(18).getTime()}', ${tempList.get(18).getTemp()}],
     		['${timeList.get(19).getTime()}', ${tempList.get(19).getTemp()}]    		
            ]);
         var options = {
           title: '온도',
           curveType: 'function',
           legend: { position: 'bottom' }
         };

        var chart = new google.visualization.LineChart(document.getElementById('chart'));

        +chart.draw(data, options);
      };
	 }); 	 

 	 
	 $('.btn_water').click(function(){   

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	
      function drawChart() {   	
     	var data = google.visualization.arrayToDataTable([
    		['Time', 'Water'],
    		['${timeList.get(0).getTime()}', ${waterList.get(0).getWater()}],
    		['${timeList.get(1).getTime()}', ${waterList.get(1).getWater()}],
    		['${timeList.get(2).getTime()}', ${waterList.get(2).getWater()}],
    		['${timeList.get(3).getTime()}', ${waterList.get(3).getWater()}],
    		['${timeList.get(4).getTime()}', ${waterList.get(4).getWater()}],
    		['${timeList.get(5).getTime()}', ${waterList.get(5).getWater()}],
    		['${tiemList.get(6).getTime()}', ${waterList.get(6).getWater()}],
    		['${timeList.get(7).getTime()}', ${waterList.get(7).getWater()}],
    		['${timeList.get(8).getTime()}', ${waterList.get(8).getWater()}],
    		['${timeList.get(9).getTime()}', ${waterList.get(9).getWater()}],
    		['${timeList.get(10).getTime()}', ${waterList.get(10).getWater()}],
    		['${timeList.get(11).getTime()}', ${waterList.get(11).getWater()}],
    		['${timeList.get(12).getTime()}', ${waterList.get(12).getWater()}],
    		['${tiemList.get(13).getTime()}', ${waterList.get(13).getWater()}],
    		['${timeList.get(14).getTime()}', ${waterList.get(14).getWater()}],
    		['${timeList.get(15).getTime()}', ${waterList.get(15).getWater()}],
    		['${timeList.get(16).getTime()}', ${waterList.get(16).getWater()}],
    		['${tiemList.get(17).getTime()}', ${waterList.get(17).getWater()}],
    		['${timeList.get(18).getTime()}', ${waterList.get(18).getWater()}],
    		['${timeList.get(19).getTime()}', ${waterList.get(19).getWater()}]
            ]);
        var options = {
          title: '수위',
          curveType: 'function',
          legend: { position: 'bottom' }
        };
        var chart = new google.visualization.LineChart(document.getElementById('chart'));
        chart.draw(data, options);
      }; 
	 });	 

	 
	 $('.btn_light').click(function(){  
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);	
      function drawChart() {   	
     	var data = google.visualization.arrayToDataTable([
    		['Time', 'Light'],
    		['${timeList.get(0).getTime()}', ${lightList.get(0).getLight()}],
    		['${timeList.get(1).getTime()}', ${lightList.get(1).getLight()}],
    		['${timeList.get(2).getTime()}', ${lightList.get(2).getLight()}],
    		['${timeList.get(3).getTime()}', ${lightList.get(3).getLight()}],
    		['${timeList.get(4).getTime()}', ${lightList.get(4).getLight()}],
    		['${timeList.get(5).getTime()}', ${lightList.get(5).getLight()}],
    		['${tiemList.get(6).getTime()}', ${lightList.get(6).getLight()}],
    		['${timeList.get(7).getTime()}', ${lightList.get(7).getLight()}],
    		['${timeList.get(8).getTime()}', ${lightList.get(8).getLight()}],
    		['${timeList.get(9).getTime()}', ${lightList.get(9).getLight()}],
    		['${timeList.get(10).getTime()}', ${lightList.get(10).getLight()}],
    		['${timeList.get(11).getTime()}', ${lightList.get(11).getLight()}],
    		['${timeList.get(12).getTime()}', ${lightList.get(12).getLight()}],
    		['${tiemList.get(13).getTime()}', ${lightList.get(13).getLight()}],
    		['${timeList.get(14).getTime()}', ${lightList.get(14).getLight()}],
    		['${timeList.get(15).getTime()}', ${lightList.get(15).getLight()}],
    		['${timeList.get(16).getTime()}', ${lightList.get(16).getLight()}],
    		['${tiemList.get(17).getTime()}', ${lightList.get(17).getLight()}],
    		['${timeList.get(18).getTime()}', ${lightList.get(18).getLight()}],
    		['${timeList.get(19).getTime()}', ${lightList.get(19).getLight()}]
    		
            ]);
        var options = {
          title: '조도',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart'));

        chart.draw(data, options);
      };	 
	 });
	 
 	   
	 $('.btn_ground').click(function(){   

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	
      function drawChart() {
       
    	
     	var data = google.visualization.arrayToDataTable([
     		['Time', 'Ground'],
    		['${timeList.get(0).getTime()}', ${groundList.get(0).getGround()}],
    		['${timeList.get(1).getTime()}', ${groundList.get(1).getGround()}],
    		['${timeList.get(2).getTime()}', ${groundList.get(2).getGround()}],
    		['${timeList.get(3).getTime()}', ${groundList.get(3).getGround()}],
    		['${timeList.get(4).getTime()}', ${groundList.get(4).getGround()}],
    		['${timeList.get(5).getTime()}', ${groundList.get(5).getGround()}],
    		['${tiemList.get(6).getTime()}', ${groundList.get(6).getGround()}],
    		['${timeList.get(7).getTime()}', ${groundList.get(7).getGround()}],
    		['${timeList.get(8).getTime()}', ${groundList.get(8).getGround()}],
    		['${timeList.get(9).getTime()}', ${groundList.get(9).getGround()}],
    		['${timeList.get(10).getTime()}', ${groundList.get(10).getGround()}],
    		['${timeList.get(11).getTime()}', ${groundList.get(11).getGround()}],
    		['${timeList.get(12).getTime()}', ${groundList.get(12).getGround()}],
    		['${tiemList.get(13).getTime()}', ${groundList.get(13).getGround()}],
    		['${timeList.get(14).getTime()}', ${groundList.get(14).getGround()}],
    		['${timeList.get(15).getTime()}', ${groundList.get(15).getGround()}],
    		['${timeList.get(16).getTime()}', ${groundList.get(16).getGround()}],
    		['${tiemList.get(17).getTime()}', ${groundList.get(17).getGround()}],
    		['${timeList.get(18).getTime()}', ${groundList.get(18).getGround()}],
    		['${timeList.get(19).getTime()}', ${groundList.get(19).getGround()}]
    		
            ]);
        var options = {
          title: '토양',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart'));

        chart.draw(data, options);
      };	 
	 });
    </script> 
    
    
</html>