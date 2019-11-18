<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.modal-content{
width: 150%;
height: 200%;
}
textarea {
	resize: none;
}
</style>
	

<script>
	var action = '';
	var url = '';
	var type = '';
	var board_CODE = 0;
	var hrefId = "";
	var endinput = "<div class='input-group date' id='endDate'><input type='text' class='form-control' /> <span class='input-group-addon'> <span class='glyphicon glyphicon-calendar'></span></span></div>";

	$(document).ready(function() {

		//달력
		function initCalendar() {
	        $('#startDate').datetimepicker({
	        	 viewMode: 'days',
	             format: 'YYYY-MM-DD'
	        });
	        $('#endDate').datetimepicker({
	        	viewMode: 'days',
	             format: 'YYYY-MM-DD',
	            useCurrent: false
	        });
	        $("#startDate").on("dp.change", function (e) {
	            $('#endDate').data("DateTimePicker").minDate(e.date);
	        });
	        $("#endDate").on("dp.change", function (e) {
	            $('#startDate').data("DateTimePicker").maxDate(e.date);
	        });
	    }
		
		//Modal 초기화
		$('#myModal').on('hidden.bs.modal', function () {
		    $(this).find("input,textarea,select").val('').end();
		});
		
		
		// 새 글 쓰기 버튼 클릭
		$(".goModal").click(function() {
			
			hrefId = this.id;
			event.preventDefault();
			action = 'create';
			type = 'POST'
		
				switch (hrefId){
			    case 'hrefnotice':
			    	$("#modal-title").text("Notice");
			    	$("#board_DES").val("NOTICE");
			        break;
			    case 'hreftodo' :
			    	$("#modal-title").text("To Do");
			    	$("#board_DES").val("TODO");
			        break;
			    case 'hrefevent' :
			    	$("#modal-title").text("Event");
			    	$("#board_DES").val("EVENT");
			        break;
				}
			$("#empNAME").val('${sessionScope.login.employee_name}');
			$("#endinput").html(endinput);
			initCalendar();
			$("#myModal").modal();
		});
		
		

		// 게시글 클릭
		$(".boardtable tr").click(function() {
			action = 'modify';
			type = 'PUT';
			board_CODE = this.id;
			
			// content 담기
			var tds = $(this).children();
			
			var board_TITLE = tds.eq(0).text();
			var board_START_DATE = tds.eq(1).text();
			var board_END_DATE =  tds.eq(0).children('.board_END_DATE').val();
			var board_CONTENT = tds.eq(0).children('.board_CONTENT').val();
			var empNAME = tds.eq(0).children('.empNAME').val();
			var id = tds.eq(0).children('.id').val();
			var board_DES = tds.eq(0).children('.board_DES').val();
			var board_DES_DES = tds.eq(0).children('.board_DES_DES').val();
			var board_TITLE = tds.eq(0).children('.board_TITLE').val();			
			var title = $(this).closest('table').attr('id');

			switch (title){
		    case 'noticetable':
		    	$("#modal-title").text("Notice");
		        break;
		    case 'todotable' :
		    	$("#modal-title").text("To Do");
		        break;
		    case 'eventtable' :
		    	$("#modal-title").text("Event");
		        break;
			}
			if(board_END_DATE.length == 10){
				 $("#endinput").html(endinput); 
			}else{
				$("#endinput").empty();
			}
			
			$("#title").val(board_TITLE);
			$("#empNAME").val(empNAME);
			$("#contents").val(board_CONTENT);
			$("#startDate").children().val(board_START_DATE);
			$("#endDate").children().val(board_END_DATE);
			$("#id").children().val(id);
			$("#board_DES").val(board_DES);
			$("#board_DES_DES").val(board_DES_DES);
			$("#empNAME").val(empNAME);
			initCalendar();
			$("#myModal").modal();
		});

		// 삭제하기 버튼 클릭
		$("#modalDelete").click(function() {
			
			$.ajax({
				url : '${contextPath}/cm/board.do?board_CODE='+ board_CODE,
				type : 'GET',
			});
			alert("게시글이 삭제되었습니다.");
			location.reload();
			
		})

		// Modal의 Submit 버튼 클릭
		$("#modalSubmit").click(function() {

			if (action == 'create') {
				url = 'board.do';
			} else if (action == 'modify') {
				url = 'board.do';
			}

			var data = {
				
				"board_CODE" : board_CODE,
				"board_CONTENT" : $("#contents").val(),
				"board_START_DATE" : $("#startDate").children().val(),
				"board_END_DATE" : $("#endDate").children().val(),
				"board_DES" : $("#board_DES").val(),
				"board_DES_DES" : $("#board_DES_DES").val(),
				"board_TITLE" : $("#title").val()
				
			};

			$.ajax({
				url : url,
				contentType: 'application/json',
				type : type,
				data : JSON.stringify(data)
				
			})
				alert("저장되었습니다.");
			 location.reload(); 
		});

	});
	
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input class="form-control" id="title" name="title"type="text"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input class="form-control" id="empNAME" type="text"></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><input type="hidden" id="board_DES"><input class="form-control" id="board_DES_DES" type="text"></td>
					</tr>
					<tr>
						<td>날짜</td>
						<td>
							<div class='col-md-5' style="padding-left:0;">
								<div class="form-group">
									<div class='input-group date' id='startDate'>
										<input type='text' class="form-control" /> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
								</div>
							<div class='col-md-5' >
									<div class="form-group" id="endinput">
									
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" id="contents" rows="10"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalDelete" type="button" class="btn btn-danger">삭제</button>
				<button id="modalSubmit" type="button" class="btn btn-primary">저장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>