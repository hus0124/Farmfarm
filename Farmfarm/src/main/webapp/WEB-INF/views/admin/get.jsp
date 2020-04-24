

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 관리자 세션일 경우에만 출력 -->
<%
System.out.println("시스템 프린트"+session.getAttribute("adminuser"));
if (session.getAttribute("adminuser")!="admin"){
%>
접근이 제한된 페이지 입니다. <a href="/user/index">홈으로 돌아가세요</a> 
<% } else { %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">고객 상세정보</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">고객 정보보기</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>ID</label> <input class="form-control" name='ID'
            value='<c:out value="${admin.ID }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>고객 이름</label> <input class="form-control" name='username'
            value='<c:out value="${admin.username }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>이메일</label> <input class="form-control" name='email'
            value='<c:out value="${admin.email }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>시리얼 넘버</label> <input class="form-control" name='serialnum'
            value='<c:out value="${admin.serialnum }"/>' readonly="readonly">
        </div>       
        
        <div class="form-group" style="height:350px; ">
        	<label>센서별 그래프</label>
            <div class="form-control" class="chart" style="position:absolute; width:1560px; height:310px;">                      
		        <div id="chart_temp" style="position:absolute; height:300px; width:300px; margin-left:180px;"></div> 
		        <div id="chart_light" style="position:absolute; height:300px; width:300px;  margin-left:480px;"></div>
		        <div id="chart_water" style="position:absolute; height:300px; width:300px;  margin-left:780px;"></div>
		        <div id="chart_ground" style="position:absolute; height:300px; width:300px;  margin-left:1080px;"></div>		     
         	</div>
        </div>                     
        
<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/admin/modify?id=<c:out value="${admin.ID}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/admin/list">List</a></button> --%>


<!-- button data-oper='modify' class="btn btn-default">수정</button-->
<button type="submit" data-oper='remove' class="btn btn-danger">고객 삭제</button>
<button data-oper='list' class="btn btn-success">목록</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='ID' name='ID' value='<c:out value="${admin.ID}"/>'>
</form> --%>


<form id='operForm' action="/admin/modify" method="get">
  <input type='hidden' id='ID' name='ID' value='<c:out value="${admin.ID}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
</form>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 고객 메모사항
				<button id='addReplyBtn' class='btn btn-success btn-xs pull-right'>메모	등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat"></ul>
				<!-- ./ end ul -->
			</div>
			<!-- /.panel .chat-panel -->

			<div class="panel-footer"></div>
		</div>
	</div>
	<!-- ./ end row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">메모 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>메모 내용</label> <input class="form-control" name='reply' value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='replyer' value='replyer'>
				</div>
				<div class="form-group">
					<label>작성일</label> <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
				</div>
				
			</div>
			<div class="modal-footer">
				<!-- button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button-->
				<button id='modalRegisterBtn' type="button" class="btn btn-success">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		var bnoValue = '<c:out value="${admin.ID}"/>';
		var replyUL = $(".chat");
		showList(1);

		function showList(page) {

			console.log("show list " + page);

			replyService.getList( {
				id : bnoValue,				// 이거
				page : page || 1
			},
			function(replyCnt, list) {

				console.log("replyCnt: " + replyCnt);
				console.log("list: " + list);
				console.log(list);

				if (page == -1) {
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}

				var str = "";

				if (list == null
						|| list.length == 0) {
					return;
				}

				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "  <div><div class='header'><strong class='primary-font'>["
							+ list[i].rno
							+ "] "
							+ list[i].replyer
							+ "</strong>";
					str += "    <small class='pull-right text-muted'>"
							+ replyService
									.displayTime(list[i].replyDate)
							+ "</small></div>";
					str += "    <p>"
							+ list[i].reply
							+ "</p></div></li>";
				}

				replyUL.html(str);
				showReplyPage(replyCnt);

			});//end function

			}//end showList

			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");

			function showReplyPage(replyCnt) {

				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum - 9;
				var prev = startNum != 1;
				var next = false;
				if (endNum * 10 >= replyCnt) {
					endNum = Math.ceil(replyCnt / 10.0);
				}

				if (endNum * 10 < replyCnt) {
					next = true;
				}

				var str = "<ul class='pagination pull-right'>";

				if (prev) {
					str += "<li class='page-item'><a class='page-link' href='"
							+ (startNum - 1)
							+ "'>Previous</a></li>";
				}

				for (var i = startNum; i <= endNum; i++) {
					var active = pageNum == i ? "active" : "";
					str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
							+ i + "</a></li>";
				}

				if (next) {
					str += "<li class='page-item'><a class='page-link' href='"
							+ (endNum + 1) + "'>Next</a></li>";
				}

				str += "</ul></div>";
				console.log(str);
				replyPageFooter.html(str);
			}

			replyPageFooter.on("click", "li a", function(e) {
				e.preventDefault();
				console.log("page click");

				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: " + targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
			});

			/*     function showList(page){      
			 replyService.getList({id:bnoValue,page: page|| 1 }, function(list) {        
			 var str="";
			 if(list == null || list.length == 0){        
			 replyUL.html("");        
			 return;
			 }
			 for (var i = 0, len = list.length || 0; i < len; i++) {
			 str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
			 str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
			 str +="    <p>"+list[i].reply+"</p></div></li>";
			 }

			 replyUL.html(str);
			 });//end function      
			 }//end showList */

			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal
					.find("input[name='replyer']");
			var modalInputReplyDate = modal
					.find("input[name='replyDate']");

			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#modalCloseBtn").on("click", function(e) {
				modal.modal('hide');
			});

			$("#addReplyBtn").on("click", function(e) {
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				modalRegisterBtn.show();
				$(".modal").modal("show");
			});

			modalRegisterBtn.on("click", function(e) {
				var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					id : bnoValue
				};
				replyService.add(reply, function(result) {
					alert(result);
					modal.find("input").val("");
					modal.modal("hide");
					//showList(1);
					showList(-1);
				});
			});

			//댓글 조회 클릭 이벤트 처리 
			$(".chat").on("click", "li", function(e) {
				var rno = $(this).data("rno");
				console.log("나와라 댓글번호" + rno);
				replyService.get(rno, function(reply) {
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
					modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
					modal.data("rno", reply.rno);

					modal.find("button[id !='modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();

					$(".modal").modal("show");
					});
				});

			/*     modalModBtn.on("click", function(e){      
			 var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};      
			 replyService.update(reply, function(result){            
			 alert(result);
			 modal.modal("hide");
			 showList(1);        
			 });			
			 });

			 modalRemoveBtn.on("click", function (e){    	  
			 var rno = modal.data("rno");  	  
			 replyService.remove(rno, function(result){  	        
			 alert(result);
			 modal.modal("hide");
			 showList(1);  	      
			 });  	  
			 }); */

			modalModBtn.on("click", function(e) {
				var reply = {
					rno : modal.data("rno"),
					reply : modalInputReply.val()
				};

				replyService.update(reply, function(result) {
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
			});

			modalRemoveBtn.on("click", function(e) {
				var rno = modal.data("rno");
				replyService.remove(rno, function(result) {
					alert(result);
					modal.modal("show");
					showList(pageNum);
				});
			});
		});
</script>



<!-- <script>
 console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.ID}"/>'; */

//for replyService add test
/* replyService.add(
    {reply:"JS Test", replyer:"tester", id:bnoValue}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
); */


//reply List Test
/* replyService.getList({id:bnoValue, page:1}, function(list){
	  for(var i = 0,  len = list.length||0; i < len; i++ ){
	    console.log(list[i]);
	  }
});
 */

 
/*  //17번 댓글 삭제 테스트 
 replyService.remove(17, function(count) {
   console.log(count);
   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 */
 

//12번 댓글 수정 
 replyService.update({
  rno : 12,
  id : bnoValue,
  reply : "Modified Reply...."
}, function(result) {
  alert("수정 완료...");
});  
</script> -->  

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");   
	  $("button[data-oper='remove']").on("click", function(e){    
	    operForm.attr("action","/admin/remove").submit();    
	  });  
	  
  var operForm = $("#operForm");   
  $("button[data-oper='modify']").on("click", function(e){    
    operForm.attr("action","/admin/modify").submit();    
  });
  
  var operForm = $("#operForm");   
  $("button[data-oper='remove']").on("click", function(e){    
    operForm.attr("action","/admin/remove").submit();    
  });  
    
  $("button[data-oper='list']").on("click", function(e){    
    operForm.find("#id").remove();
    operForm.attr("action","/admin/list")
    operForm.submit();
    
  });  
});


	//차트
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

     var chart = new google.visualization.LineChart(document.getElementById('chart_temp'));

     +chart.draw(data, options);
   };


   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart1);
	
   function drawChart1() {   	
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
     var chart = new google.visualization.LineChart(document.getElementById('chart_water'));
     chart.draw(data, options);
   }; 

   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart2);	
   function drawChart2() {   	
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

     var chart = new google.visualization.LineChart(document.getElementById('chart_light'));

     chart.draw(data, options);
   };	 

	 
	   
   

   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart3);
	
   function drawChart3() {
    
 	
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

     var chart = new google.visualization.LineChart(document.getElementById('chart_ground'));

     chart.draw(data, options);
   };	 


</script>



<% } %> <!-- 관리자만 보는 페이지 끝 -->

<%@include file="../includes/footer.jsp"%>
