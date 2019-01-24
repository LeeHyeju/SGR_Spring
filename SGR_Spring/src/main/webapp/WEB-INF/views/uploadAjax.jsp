<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

</head>
<body>

	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>

	<div class='uploadedList'></div>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

// 	console.log(file);
	var formData = new FormData();
	
	formData.append("file", file);

	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false, 
		  //$.ajax로 파일 전송을 위해 일반적인 query String으로 변환하지 않고 
		  //다른 형식으로 데이터를 보냄
		  contentType: false,
		// 파일 전송 시 multipart/form-data로 전송해야 하므로 
		type: 'POST',
		  success: function(data){
			  
			  alert(data);
		  }
	});
});
</script>

</body>
</html>