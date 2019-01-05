<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.pagination {
  width: 100%;
}

.pagination li{
  list-style: none;
  float: left; 
  padding: 3px; 
  border: 1px solid blue;
  margin:3px;  
}

.pagination li a{
  margin: 3px;
  text-decoration: none;  
}
</style>

<!-- 회원이 수정할 때 -->
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/qna/update.do");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/qna/delete.do");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/qna/qnaList.do");
			formObj.submit();
		});
	});
</script>
<!-- 관리자가 수정할 때 -->
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-info").on("click", function() {
			formObj.attr("action", "/qna/adminUpdate.ad");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-success").on("click", function() {
			formObj.attr("action", "/qna/adminDelete.ad");
			formObj.submit();
		});

		$(".btn-default").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/qna/adminList.ad");
			formObj.submit();
		});
	});
</script>
<!-- 댓글 관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#updateModal">수정</a>
    </div>
  </div>			
</li>
{{/each}}
</script>
<script>
//prettyfyDate를 등록한다.
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	// printData() 함수 등록
	// 사용법 : printData(replyArr, target, templateObject)로 사용한다.
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	
	var qna_no = ${list.qna_no};
	
	var replyPage = 1;

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#updateModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
	}


	// printPaging() 함수 등록 - 댓글 하단 페이지 표시
	// 사용법 : printPaging(pageMaker, target)로 사용한다.
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

	
	
	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/qnareply/" + qna_no + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/qnareply/"+qna_no+"/"+replyPage);
		
	});
	
	//글 생성을 위한 버튼
	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
	
		  $.ajax({
				type:'post',
				url:'/qnareply/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({
					qna_no:qna_no,
					replyer:replyer, 
					replytext:replytext
					}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/qnareply/"+qna_no+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	
//댓글 수정을 위한 버튼
	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/qnareply/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/qnareply/"+qna_no+"/"+replyPage );
					}
			}});
	});
//댓글 삭제를 위한 버튼
	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/qnareply/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/qnareply/"+qna_no+"/"+replyPage );
					}
			}});
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
</form>
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${list.qna_title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${list.qna_content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> 
						<input type="text"
							name="writer" class="form-control" value="${list.mb_id}"
							readonly="readonly">
					</div>
				
					<div class="form-group">
						<label for="exampleInputEmail1">DATE</label> 
						<input type="text"
							name="writer" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd"
												value="${list.reg_date}" />"
							readonly="readonly">
					</div>
				</div>
				<c:choose>
					<c:when test="${login.mb_id eq 'admin' }">
				<div class="box-footer">
					<button type="submit" class="btn btn-info">수정</button>
					<button type="submit" class="btn btn-success">삭제</button>
					<button type="submit" class="btn btn-default">목록</button>
				</div>
				</c:when>
				<c:when test="${login.mb_id eq  list.mb_id }">
				<div class="box-footer">
					<button type="submit" class="btn btn-warning">수정</button>
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="submit" class="btn btn-primary">목록</button>
				</div>
				</c:when>
				<c:otherwise>
				<button type="submit" class="btn btn-primary">목록</button>
				</c:otherwise>
			</c:choose>
				</fieldset>

<!-- 댓글르르를 -->
      
      <div  class="form-horizontal">
		<div>
<!-- 댓글 쓰기를 위한 페이지 -->
			<div class="box box-success">
				<div class="box-header">
					<h3 style="text-align: center;"  class="box-title"> 댓글 쓰기</h3>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-md-3 control-label">작성자</label> 
					<div class="col-md-2">
					<input  type="text" class="form-control input-md"  placeholder="USER ID"	id="newReplyWriter"> 
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-3 control-label">내용</label> 
					<div class="col-md-5" >
					<textarea type="text" class="form-control input-md"  placeholder="REPLY TEXT" id="newReplyText" rows="5" style=" resize: none;">
					</textarea>
					</div>
				</div>	
				
			</div>
				<!-- /.box-body -->
				<br>
				<div class="box-footer">
					<center><button type="button" class="btn btn-primary" id="replyAddBtn">댓글 추가</button></center>
				</div>
			</div>
<!-- 댓글 쓰기 끝 -->

		<!-- The time line (페이징 처리에 필요)-->
		<ul class="timeline">
		  <!-- timeline time label -->
		<li class="time-label" id="repliesDiv">
		  <span class="bg-green">
		    Replies List <small id='replycntSmall'> [ ${qnaDto.replycnt} ] </small>
		    </span>
		  </li>
		</ul>
		   
			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
<!-- 댓글의 진짜 끝 -->
</body>
</html>