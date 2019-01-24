<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	
	//카테고리 처음 불러오기	(1차가 TOP인데 2차가 안불러 와져서 한번 불러오는것.)
	cateSelect();
	
})

function cateSelect(){
	
 var	cate_nm =  $("#exampleFormControlSelect1").val();	//현재 카테고리 선택되어 있는 값을 가져옴
	
 //아작스 시작
 $.ajax({
		url:"/category",				//자바(서버) 로 보낼 url명
		type: "POST",					//서버로 보낼때 전송방식
		data : {							//서버로 보낼 데이터들
				cateGory1 : cate_nm
		},
		
		dataType : "Json", //서버에서 보내는 데이터 타입
		
// 		contentType : "application/json; charset=UTF-8" ,//서버로 보내는타입 
		
		//ajax 성공했을떄 success 메소드로 원하는 것 실행시킴(이런걸 콜백함수라고 함).
		//error:function() -- 에러났을때 원하는 것 실행시킴
		success : function(result) {		
					
			// map(키,값) 형식을 JSON으로 변환 해서 확인함 [필요없음]
			console.log("success : "+JSON.stringify(result.cateGory2)); 
				
			//map(키,값) 형식을 cateGory22에 담음                  [필요없음]
			var cateGory22 =JSON.stringify(result.cateGory2);			
			
			//2차 카테고리 초기화  -1차 카테고리 별로 2차카테고리를 재설정 해줘야 하기 때문. 이거 없으면 2차카테고리가 계속 늘어남
			$("#catesub_nm").empty();				
			
			//2차카테고리 초기화 - 맨 위에 선택하세요가 뜨게끔 설정해주는 것.
			$("#catesub_nm").append('<option>선택하세요</option>'); 
			
	
			 //콘솔찍어 데이터들 확인
			console.log("result.cateGory2-name = "+result.cateGory2[0].catesub_nm);
			console.log("result.cateGory2[0].catesub_cd = "+result.cateGory2[0].catesub_cd);
			console.log("result = "+result);
			console.log("MSG = "+result.msg);
					
			
		//	배열 반복문인듯. var = 인덱스(배열 방번호)  in = 변수
			for(var i in result.cateGory2) {
				
			//	ID가 catesub_cd인곳을 찾아서 append 메소드로 해당 html끝부분에 append() 괄호 안 내용을 그대로 추가해줌
				$("#catesub_nm").append("<option name='catesub_cd' value='"+result.cateGory2[i].catesub_cd+"'>"+result.cateGory2[i].catesub_nm+"</option>"); 
				
				$("#catesub_cd option:checked").val();
				
				//로그찍어봄
				console.log(result.cateGory2[i].catesub_nm);
				console.log(result.cateGory2[i].catesub_cd);
				
			
			}
	  },
	  //에러 났을시 success를 안타고 이쪽을 탐.
	  	error:function(jqXHR){
	  		alert(jqXHR.status);
	  		alert(jqXHR.statusText);
	  	}

	});
}
</script>
<script type="text/javascript">
$(function(){
   var cate2val = $('#catesub_cd');
	$('#catesub_nm').change(function(){
		var element = $(this).find('option:selected');
		var myTag = element.attr('value');
		cate2val.val(myTag);
	});
});
</script>
</head>
<body>
<form action="write.do" method="post">
		<h1 style="text-align: center; color: silver;">문의 작성하기</h1>
			<fieldset>
			<legend></legend>
			<!-- hidden -->
			<input type="hidden" value="1" name="goods_no">
			<input type="hidden" value="a011" name="catesub_cd">
			셀렉트 박스
			<div class="form-group">
				<label class="col-md-4 control-label" >분류</label> 
			 <select  id="exampleFormControlSelect1" onchange="cateSelect()" class="form-control" name="cate_nm">
		
				<!-- 반복문으로 1차 카테고리 불러오고 갯수만큼 select 출력 -->
				<c:forEach items="${depthOne}" var="cate1">
				<option >${cate1.cate_nm}</option>
				</c:forEach>
				
		</select>
		</div>
		<div style='display:inline;float:left;width:180px' >
				
				<!-- 이 부분에 1차 선택시마다 2차 카테고리,  append()안에 내용이 들어감.-->
		<select id="catesub_nm" class="form-control"  onchange="alert(this.options[this.selectedIndex].value)">

		</select>
   			 </div>				
				<br>
				<div class="form-group">
				<label class="col-md-4 control-label" >Title</label> 
				<div class="col-md-4">
				<input type="text" 	name='qna_title' class="form-control input-md"  placeholder="문의하실 제목을 적어주세요.">
				</div>
				</div>
						<br/>
				<div class="form-group">
				<label class="col-md-4 control-label">Content</label>
				<div class="col-md-4">
				<textarea class="form-control" name="qna_content" rows="5"  style=" resize: none;"
				placeholder="문의하실 내용을 적어주세요."></textarea>
				</div>
				</div>
					<br/><br/><br/><br/>
				<div class="form-group">
				<br/><label class="col-md-4 control-label">Writer</label> 
				<div class="col-md-4">
				<input type="text" 	name="mb_id" class="form-control input-md" value="${login.mb_id } " readonly="readonly">
				</div>
				</div>

			<br><br><br><br><br>
				<div class="box-footer" >
				<label class="col-md-4 control-label" for=""></label>
				<div class="btnJoinArea" ><center>
						<button type="submit" class="btn btn-default">작성</button>
						<button type="submit" class="btn btn-white">목록</button>
					</center>
					</div>
					</div>
				</fieldset>
</form>
</body>
</html>