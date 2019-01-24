<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$("#replyBtn").on("click", function(){
	var qna_no = 1;
	$.getJSON(
		"../qnareply/all/"+qna_no,
		function(data){
		 var str="";
		 console.log(data.length);
			$(data).each(
			function(){
				str += "<li data-rno'"+this.rno+"' class='replyLi'>"+this.rno+":"	+this.replytext+"</li>";
			});
			$("#replies").html(str);
		});
});

</script>
</head>

<body>

   			 <div>
   			    <button id="replyBtn">댓글 보기</button>
            <ul id="replies">
            </ul>
         </div>
</body>
</html>

