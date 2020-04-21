// Javascript

$(document).ready(function () {
	
	//로그인
	var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~");
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }
    
    //회원가입 
    $(".login > #join_opne_btn").click(function(){
        $("#join").show();
      });

      $("#join_close_btn").click(function(){
        $("#join").hide();
      }); 
      
   // 디지털 시계
   setInterval(function () {
      var now = new Date();
      var y = now.getFullYear();
      var m = now.getMonth() + 1;
      var d = now.getDate();
      var w = now.getDay();
      var hh = now.getHours();
      var mm = now.getMinutes();
      var ss = now.getSeconds();

      // 조건 연산자(? :)
      (mm >= 10) ? mm = mm : mm = '0' + mm;
      (ss >= 10) ? ss = ss : ss = '0' + ss;   

      $('#mobile p span').eq(0).text(hh);
      $('#mobile p span').eq(1).text(mm);
      $('#mobile p span').eq(2).text(ss);
   }, 1000);
   
   
   
   		//모바일 라인 차트
	   var chartDrowFun = {
			   
			    chartDrow : function(){
			        var chartData = '';
			 
			        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
			        var chartDateformat     = 'yyyy년MM월dd일';
			        //라인차트의 라인 수
			        var chartLineCount    = 10;
			        //컨트롤러 바 차트의 라인 수
			        var controlLineCount    = 10;
			 
			 
			        function drawDashboard() { 
			          var data = new google.visualization.DataTable();
			          //그래프에 표시할 컬럼 추가
			          data.addColumn('datetime' , '날짜');
			          data.addColumn('number'   , '센서');
			 
			          //그래프에 표시할 데이터
			          var dataRow = [];
			 
			          for(var i = 0; i <= 7; i++){ //랜덤 데이터 생성
			            var total   = Math.floor(Math.random() * 300) + 1;
			            dataRow = [new Date('2020', '03', i ),  total];
			            data.addRow(dataRow);
			          }
			 
			 
			            var chart = new google.visualization.ChartWrapper({
			              chartType   : 'LineChart',
			              containerId : 'lineChartArea', //라인 차트 생성할 영역
			              options     : {
			                              isStacked   : 'percent',
			                              focusTarget : 'category',
			                              height          : 500,
			                              width              : '100%',
			                              legend          : { position: "top", textStyle: {fontSize: 13}},
			                              pointSize        : 5,
			                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
			                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
			                                                                  years : {format: ['yyyy년']},
			                                                                  months: {format: ['MM월']},
			                                                                  days  : {format: ['dd일']},
			                                                                  hours : {format: ['HH시']}}
			                                                                },textStyle: {fontSize:12}},
			                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
			                animation        : {startup:true, duration:1000, easing:'in' },
			                annotations    : {pattern: chartDateformat,
			                                textStyle: {
			                                fontSize: 15,
			                                bold: true,
			                                italic: true,
			                                color: '#871b47',
			                                auraColor: '#d799ae',
			                                opacity: 0.8,
			                                pattern: chartDateformat
			                              }
			                            }
			              }
			            });
			 
			            var control = new google.visualization.ControlWrapper({
			              controlType: 'ChartRangeFilter',
			              containerId: 'controlsArea',  //control bar를 생성할 영역
			              options: {
			                  ui:{
			                        chartType: 'LineChart',
			                        chartOptions: {
			                        chartArea: {'width': '60%','height' : 80},
			                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
			                            gridlines:{count:controlLineCount,units: {
			                                  years : {format: ['yyyy년']},
			                                  months: {format: ['MM월']},
			                                  days  : {format: ['dd일']},
			                                  hours : {format: ['HH시']}}
			                            }}
			                        }
			                  },
			                    filterColumnIndex: 0
			                }
			            });
			 
			            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
			            date_formatter.format(data, 0);
			 
			            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
			            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
			            dashboard.bind([control], [chart]);
			            dashboard.draw(data);
			 
			        }
			          google.charts.setOnLoadCallback(drawDashboard);
			 
			      }
			    }
			 
			$(document).ready(function(){
			  google.charts.load('current', {'packages':['line','controls']});
			  chartDrowFun.chartDrow(); //chartDrow() 실행
			});
});