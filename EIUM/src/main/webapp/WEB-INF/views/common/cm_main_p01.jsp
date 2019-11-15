<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
textarea {
	resize: none;
}

</style>
	

<script>
	var action = '';
	var url = '';
	var type = '';
	var bno = 0;
	var hrefId = "";

	$(document).ready(function() {

		
		//달력
		$(function () {
	        $('#startDate').datetimepicker({
	        	 viewMode: 'days',
	             format: 'YYYY-MM-DD'
	        });
	        $('#endDate').datetimepicker({
	        	viewMode: 'days',
	             format: 'YYYY-MM-DD',
	            useCurrent: false //Important! See issue #1075
	        });
	        $("#startDate").on("dp.change", function (e) {
	            $('#endDate').data("DateTimePicker").minDate(e.date);
	        });
	        $("#endDate").on("dp.change", function (e) {
	            $('#startDate').data("DateTimePicker").maxDate(e.date);
	        });
	    });
		
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
			        break;
			    case 'hreftodo' :
			    	$("#modal-title").text("To Do");
			        break;
			    case 'hrefevent' :
			    	$("#modal-title").text("Event");
			        break;
				}
			$("#myModal").modal();
		});
		
		

		// 수정하기 버튼 클릭
		$("button[name='modify']").click(function() {
			/* action = 'modify';
			type = 'PUT';
			bno = this.value;

			// content 담기
			var row = $(this).parent().parent().parent();
			var tr = row.children();

			var userName = tr.eq(2).text();
			var contents = tr.eq(1).text();

			$("#modal-title").text("수정하기");

			$("#userName").val(userName);
			$("#contents").val(contents);
 */
 
 			$("#modal-title").text("수정하기");

			$("#myModal").modal();
		});

		// 삭제하기 버튼 클릭
		$("button[name='delete']").click(function() {
			bno = this.value;
			$.ajax({
				url : '/board/' + bno,
				type : 'DELETE',
			});
			location.reload();
		})

		// Modal의 Submit 버튼 클릭
		$("#modalSubmit").click(function() {

			if (action == 'create') {
				bno = 0;
				url = '/board';
			} else if (action == 'modify') {
				url = '/board';
			}

			var data = {
				"bno" : bno,
				"userName" : $("#userName").val(),
				"contents" : $("#contents").val()
			};

			$.ajax({
				url : url,
				type : type,
				data : data
			})

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
						<td><input class="form-control" id="title" type="text"></td>
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
								<div class='col-md-1'><span class="">~</span></div>
							<div class='col-md-5'>	
								<div class="form-group">
									<div class='input-group date' id='endDate'>
										<input type='text' class="form-control" /> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
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