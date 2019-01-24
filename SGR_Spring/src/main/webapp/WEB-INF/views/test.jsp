<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</head>

<body>
	<h2>Ajax Page</h2>
	
		<div> <!-- 댓글 작성 -->
			<div>
			작성자 :  <input type="text" name="replyer" id="newReplyWriter" /> 
			</div>
			<div>
			내용 :  <input type="text" name="replytext" id="newReplyText" /> 
			</div>
			<button id="replyAddBtn">댓글 추가</button>
		</div>	
		<br/>
			  <div> <!--  댓글 보기 -->
            <ul id="replies">
            </ul>
         </div>
         
         <!-- 댓글 페이징 처리 -->
         <ul class='pagination'>
			</ul>	
         
         <!-- 댓글 수정 -->
         <div id='modDiv' style="display: none;" >
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id='closeBtn'>닫기</button>
		</div>
	</div>
         
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
//댓글 보기		
var qna_no = 13;
//처음 동작 시 1 페이지 가져오기
getPageList(1);

function getAllList(){
$.getJSON("/replies/all/" + qna_no, function(data){
	var str = "";
console.log(data.length);	

$(data).each(
	function(){
		str += "<li data-rno='"+this.rno+"' class= 'replyLi'>"
		     + this.rno + ":" + this.replytext + "<button>수정</button></li>";
	});
$("#replies").html(str);
});
}

	
//댓글 추가 버튼 클릭 시
$("#replyAddBtn").on("click", function() {

			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();

			$.ajax({
				type : 'post',
				url : '/replies',
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

					if (result == 'success') {

						alert("등록 되었습니다.");
						getAllList();
					}
				}
			});
		});
		
		
//수정 작업 화면 보여주기
$("#replies").on("click", ".replyLi button", function() {

		var reply = $(this).parent();

		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
});	

//삭제 호출하기
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
				$("#modDiv").hide("slow");
				getAllList();
			}
		}
	});
});

//수정 작업 처리
$("#replyModBtn").on("click",function(){
			  
			  var rno = $(".modal-title").html();
			  var replytext = $("#replytext").val();
			  
			  $.ajax({
					type:'put',
					url:'/replies/'+rno,
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "PUT" },
					data:JSON.stringify({replytext:replytext}), 
					dataType:'text', 
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("수정 되었습니다.");
							 $("#modDiv").hide("slow");
							//getAllList();
							 getPageList(replyPage);
						}
				}});
		});		
		
//댓글의 페이징 처리		
function getPageList(page){
	
	  $.getJSON("/replies/"+qna_no+"/"+page , function(data){
		  
		  console.log(data.list.length);
		  
		  var str ="";
		  
		  $(data.list).each(function(){
			  str+= "<li data-rno='"+this.rno+"' class='replyLi'>" 
			  +this.rno+":"+ this.replytext+
			  "<button>수정</button></li>";
		  });
		  
		  $("#replies").html(str);
		  
		  printPaging(data.pageMaker);
		  
	  });
}		

//페이징 번호 출력
function printPaging(pageMaker){
	
	var str = "";
	
	if(pageMaker.prev){
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){				
			var strClass= pageMaker.cri.page == i?'class=active':'';
		  str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	
	if(pageMaker.next){
		str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
	}
	$('.pagination').html(str);				
}


//페이지 번호에 대한 클릭 이벤트
var replyPage = 1;

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPageList(replyPage);
	
});
</script>
</body>
</html>

