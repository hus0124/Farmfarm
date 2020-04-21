<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Line_Controls_Chart</title>
 
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>
 
    <h4>사이트 방문자 성별 현황 그래프</h4>
 	  <div id="Line_Controls_Chart">


 		<span id="humid"></span>
    	<div id="chart">     </div>
     	<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
	</div>


 
  </body>
 
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {packages: ['corechart']});
google.charts.setOnLoadCallback(function(){ drawChart(new_option)});

var chartOption = function(target, maxValue, color, name){
    this.name = name;
    this.target = target;
    this.data = null;
    this.chart = null;
    this.options = {
      legend: { position: 'none' },
      vAxis: {minValue:0, maxValue:maxValue},
      hAxis: {
        textStyle: {
          fontSize: 11
        }
      },
      colors: [color],
      animation: {
        duration: 500,
        easing: 'in',
        startup: true
      }
    }
    
  }

  var new_option = new chartOption('chart', 100, '#FF5E00', '온도');
  
  function drawChart(option) {
    var o = option;
    if(o != null){
      //초기값일때만 처리
      if(o.chart == null && o.data == null){
        o.data = new google.visualization.DataTable();
        o.data.addColumn('string', 'time');
        o.data.addColumn('number', o.name);
        o.data.addRow(['', 550]);
        o.chart = new google.visualization.LineChart(document.getElementById(o.target));
      }

      o.chart.draw(o.data, o.options);
    }
  }

  function animateRenewal(option){
    var o = option;
    if (o.data.getNumberOfRows() >= 10) {
      o.data.removeRow(0);
    }

    var value = int [7];
    $.ajax({
		url:"/ajax/wkhumid",
		type:"get",
		async:false,
		cache:false,
		success:function(data){
			$("#humid").html(data);
			console.log(data+"ajax");
			value=Number(data);
		}
		
	});
 
	
	

	
  console.log(value);
    var maxValue = o.options.vAxis.maxValue;
//     if(maxValue <= 1){
//      value = Number((Math.random() * maxValue).toFixed(1));
    
//     }else {
//       value = Math.floor(Math.random() * maxValue);
    	
//     }


  
    o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime(), value]]);
    drawChart(o);
    
  }

   setInterval(function(){
     animateRenewal(new_option);
   }, 1000);
  
  function getNowTime(){
    var d = new Date();
    var sep = ":";
    var hh = d.getHours();
    var mm = d.getMinutes();
    var ss = d.getSeconds();
    return hh + sep + mm + sep + ss;
  }
    
   
    
    </script>
</html>
 


