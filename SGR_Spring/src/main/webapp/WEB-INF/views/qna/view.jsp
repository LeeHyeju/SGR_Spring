<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
    <style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
  	
    </style>
<script id="template" type="text/x-handlebars-template">
				{{#each .}}
	         <li class="replyLi" data-rno={{rno}}> <i class="fa fa-comments bg-blue"></i>
             <div class="timeline-item" >
                <span class="time">
                  <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                </span>
                <h3 class="timeline-header"><strong>{{rno}}</strong> - {{replyer}}</h3>
                <div class="timeline-body">{{replytext}} </div>
								<div class="timeline-footer">
								{{#eqReplyer replyer }}
                  <a class="btn btn-default btn-xs" 
									data-toggle="modal" data-target="#modifyModal">수정</a>
								{{/eqReplyer}}
							  </div>
	            </div>			
           </li>
        {{/each}}
</script>  	

<script>
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var qna_no = ${ list.qna_no};

	var replyPage = 1;
	


	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	function goLogin(){
		self.location ="/member/login.do";
	}
	
	$(function(){
		Handlebars.registerHelper("eqReplyer", function(replyer, block) {
			var accum = '';
			if (replyer == '${login.mb_id}') {
				accum += block.fn();
			}
			return accum;
		});

		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});
		getPage("/replies/" +qna_no + "/" + replyPage);
		

		$("#repliesDiv").on("click", function() {

			if ($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/" + qna_no + "/1");

		});

		$(".pagination").on("click", "li a", function(event) {

			event.preventDefault();

			replyPage = $(this).attr("href");

			getPage("/replies/" + qna_no + "/" + replyPage);

		});

		$("#replyAddBtn").on("click", function() {

			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();

			$.ajax({
				type : 'post',
				url : '/replies/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					qna_no : qna_no,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/" + qna_no + "/" + replyPage);
						//replyerObj.val("");
						replytextObj.val("");
					}
				}
			});
		});

		$(".timeline").on("click", ".replyLi", function(event) {

			var reply = $(this);

			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"));

		});

		$("#replyModBtn").on("click", function() {

			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();

			$.ajax({
				type : 'put',
				url : '/replies/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					replytext : replytext
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						getPage("/replies/" + qna_no + "/" + replyPage);
					}
				}
			});
		});

		$("#replyDelBtn").on("click", function() {

			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();

			$.ajax({
				type : 'delete',
				url : '/replies/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						getPage("/replies/" + qna_no + "/" + replyPage);
					}
				}
			});
		});
		
	});
</script>		
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "../qna/update.do");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			
			var replyCnt =  $("#replycntSmall").html();
			
			if(replyCnt > 0 ){
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}else{

			formObj.attr("action", "../qna/delete.do");
			formObj.submit();
			}
		});

		$(".btn-info").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/qna/qnaList.do");
			formObj.submit();
		});
	});
</script>	
</head>
<body>
<!-- Main content -->
<h1 style="text-align: center; color: silver;">고객 문의</h1>
	<fieldset>
		<legend></legend>

<form role="form"  method="post" class="form-horizontal" >
	<!-- 히든으로 보낼 값 -->
	<input type='hidden' name='qna_no' value="${list.qna_no}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="form-group">
						<label class="col-md-4 control-label" for="qna_title">글 제목</label> 
						<div class="col-md-4">
						<input type="text" 	name="qna_title"  class="form-control input-md"  value="${list.qna_title}"
							readonly="readonly">
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-4 control-label" for="qna_content">글 내용</label>
						<div class="col-md-4"> 
						<textarea class="form-control" name="qna_content" rows="9"
							readonly="readonly">${list.qna_content}</textarea>
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-4 control-label" for="mb_id">작성자</label> 
						<div class="col-md-4">
						<input type="text" 	name="mb_id" 
						class="form-control input-md"  value="${list.mb_id}"
							readonly="readonly">
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-4 control-label" for="regdate">작성일</label> 
						<div class="col-md-4">
						<input type="text" 	name="regdate" class="form-control input-md" 
						value="<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" />"
							readonly="readonly">
							</div>
					</div>
					
				
				<br> <br>
				<div class="form-group" >
				<label class="col-md-4 control-label" for=""></label>
			<div class="btnJoinArea" >
			
			<div class="box-footer">
			<center>	
			<c:if test="${login.mb_id == list.mb_id}">
  					<button type="submit" class="btn btn-warning">수정</button>
					<button type="submit" class="btn btn-danger">삭제</button>
			 </c:if>
				<button type="submit" class="btn btn-info">목록</button>  </center>
				</div>
			</div>
			</div>
			
</form>
	</fieldset>
	
	
<hr><!--  여기부터 댓글~~ -->
<div class="col-md-3" style="float::left;">
　
</div>
		<div class="row col-md-6">
				<div class="col-md-12">
						<div class="box box-success">
										  <div class="box-header">
										    <h2 class="box-title" style="text-align: center; color: gray;">댓글 입력</h2>
										  </div>
									  
									  		<c:if test="${not empty login}">  
										  	<div class="box-body" >
											  	<label for="exampleInputEmail1">작성자</label>
											  		<input	class="form-control" type="text" placeholder="USER ID"	id="newReplyWriter"value="${login.mb_id }" readonly="readonly"> 
											  	<label for="exampleInputEmail1">댓글 내용</label> 
<!-- 											  		<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText"> -->
											  		<textarea class="form-control input-md"  placeholder="댓글 내용을 작성해주세요." id="newReplyText" rows="5" style=" resize: none;" ></textarea>
											  	
											  	<!-- 								  	
												  	<div class="form-group">
												   	 	<label for="exampleInputEmail1">작성자</label>
														 <div class="col-md-4">
														    <input class="form-control input-md"  type="text" placeholder="USER ID" 	id="newReplyWriter" value="${login.mb_id }" readonly="readonly">     
														 </div>
												    </div>	
													<div class="form-group">
														   <label class="col-md-4 control-label" >댓글 내용</label> 
														  <div class="col-md-4">
														  		<textarea class="form-control input-md"  rows="4" placeholder="REPLY TEXT" id="newReplyText"></textarea>
														  </div>
													 </div>-->
												 <br>
											</div>
											<div class="box-footer">
												 			<center> <button type="submit" class="btn btn-success" id="replyAddBtn">댓글 추가</button></center><br/><br/>
											</div>
									 		</c:if> 
									<c:if test="${empty login}">
										    <div class="box-body">
										     		<center> <div><h3><a href="javascript:goLogin();" >링크를 클릭해서 로그인 해주세요!!!</a></h2></div></center>
										    </div>
									</c:if>	
									
							 		 
																
						</div>
						<!-- 댓글 리스트 출력 -->
						<ul class="timeline">
									 <!-- timeline time label -->
								<li class="time-label" id="repliesDiv">
									<span class="bg-green">전체 댓글 <small id='replycntSmall' > [ ${list.reply_cnt} ] </small></span>
								</li>
						</ul>
									
									<div class='text-center'>
											<ul id="pagination" class="pagination pagination-sm no-margin ">
											</ul>
									</div>
						
				</div>
		</div>
   

<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>      
	


	

</body>
</html>