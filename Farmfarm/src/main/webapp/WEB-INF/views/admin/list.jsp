<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

<!-- 관리자 세션일 경우에만 출력 -->
<%
System.out.println("시스템 프린트"+session.getAttribute("adminuser"));
if (session.getAttribute("adminuser")!="admin"){
%>
접근이 제한된 페이지 입니다. <a href="/user/index">홈으로 돌아가세요</a> 
<% } else { %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Admin</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				고객 관리
				<!--button id='regBtn' type="button" class="btn btn-xs pull-right">Register ew admin</button-->
				<div class="pull-right"><b>총 고객 수 : ${totaltest}명</b></div>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>I D</th>			<!-- seq -->
							<th>고객 이름</th>		<!-- TITLE --> 
							<th>이메일</th>			<!-- WRITER -->
							<th>시리얼 넘버</th>	<!-- regdate -->
						</tr>
					</thead>

					<c:forEach items="${list}" var="admin">
						<tr>
							<td><c:out value="${admin.ID}" /></td>
							<td><a class='move' href='<c:out value="${admin.ID}"/>'><c:out value="${admin.username}" /></a></td>
							<td><c:out value="${admin.email}" /></td>
							<td><c:out value="${admin.serialnum}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/admin/list" method='get'>
							<select name='type'>
								<!--option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option-->
								<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>ID</option>
								<option value="U" <c:out value="${pageMaker.cri.type eq 'U'?'selected':''}"/>>고객 이름</option>
								<option value="S" <c:out value="${pageMaker.cri.type eq 'S'?'selected':''}"/>>시리얼 넘버</option>
								<option value="IU" <c:out value="${pageMaker.cri.type eq 'IU'?'selected':''}"/>>ID or 이름</option>
								<option value="IS" <c:out value="${pageMaker.cri.type eq 'IS'?'selected':''}"/>>ID or 시리얼 넘버</option>
								<option value="IUS"	<c:out value="${pageMaker.cri.type eq 'IUS'?'selected':''}"/>>ID or 이름 or 시리얼 넘버</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>검색</button>
						</form>
					</div>
				</div>


				<div class='pull-right'>
					<ul class="pagination">
						<%--            
						 <c:if test="${pageMaker.prev}">
			              <li class="paginate_button previous"><a href="#">Previous</a>
			              </li>
			            </c:if>
			
			            <c:forEach var="num" begin="${pageMaker.startPage}"
			              end="${pageMaker.endPage}">
			              <li class="paginate_button"><a href="#">${num}</a></li>
			            </c:forEach>
			
			            <c:if test="${pageMaker.next}">
			              <li class="paginate_button next"><a href="#">Next</a></li>
			            </c:if> 
			            --%>

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a	href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a	href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/admin/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">notification</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>

<!-- /.row -->



<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({}, null, null);
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {
			self.location = "/admin/register";
		});
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='id' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/admin/get");
			actionForm.submit();
		});

		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>


<% } %> <!-- 관리자만 보는 페이지 끝 -->

<%@include file="../includes/footer.jsp"%>
