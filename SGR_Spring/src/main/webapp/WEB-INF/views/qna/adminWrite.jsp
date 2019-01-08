<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
$(document).ready(function() {
     
    //Main 카테고리를 선택 할때 마다 AJAX를 호출할 수 있지만 DB접속을 매번 해야 하기 때문에 main, sub카테고리 전체를 들고온다.
     
    //****************이부분은 DB로 셋팅하세요.
    //Main 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
    var cateArray = new Array();
    var cateObject = new Object();
     
    cateObject = new Object();
    cateObject.main_category_cd = "A01";
    cateObject.main_category_nm = "TOP";
    cateArray.push(cateObject);
     
    cateObject = new Object();
    cateObject.main_category_cd = "B01";
    cateObject.main_category_nm = "OUTER";
    cateArray.push(cateObject);

    cateObject = new Object();
    cateObject.main_category_cd = "C01";
    cateObject.main_category_nm = "BOTTOM";
    cateArray.push(cateObject);
    
    
    cateObject = new Object();
    cateObject.main_category_cd = "D01";
    cateObject.main_category_nm = "ACC";
    cateArray.push(cateObject);
    
    cateObject = new Object();
    cateObject.main_category_cd = "E01";
    cateObject.main_category_nm = "SHOES";
    cateArray.push(cateObject);
    
    
    //Sub 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
    var catesubArray = new Array();
    var catesubObject = new Object();
     
    //TOP에 해당하는 sub category 리스트
    catesubObject = new Object();
    catesubObject.main_category_cd = "A01";
    catesubObject.sub_category_cd = "A011"
    catesubObject.sub_category_nm = "TEE" 
    catesubArray.push(catesubObject);
     
    catesubObject = new Object();
    catesubObject.main_category_cd = "A01";
    catesubObject.sub_category_cd = "A012"
    catesubObject.sub_category_nm = "BLOUSE" 
    catesubArray.push(catesubObject);

    catesubObject = new Object();
    catesubObject.main_category_cd = "A01";
    catesubObject.sub_category_cd = "A013"
    catesubObject.sub_category_nm = "SHIRT" 
    catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "A01";
    catesubObject.sub_category_cd = "A014"
    catesubObject.sub_category_nm = "KNIT" 
    catesubArray.push(catesubObject);
    
    //OUTER에 해당하는 sub category 리스트
    catesubObject = new Object();
    catesubObject.main_category_cd = "B01";
    catesubObject.sub_category_cd = "B011"
    catesubObject.sub_category_nm = "JACKET" 
   	catesubArray.push(catesubObject);
     
    catesubObject = new Object();
    catesubObject.main_category_cd = "B01";
    catesubObject.sub_category_cd = "B012"
    catesubObject.sub_category_nm = "CARDIGAN" 
   	catesubArray.push(catesubObject);

    catesubObject = new Object();
    catesubObject.main_category_cd = "B01";
    catesubObject.sub_category_cd = "B013"
    catesubObject.sub_category_nm = "COAT" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "B01";
    catesubObject.sub_category_cd = "B014"
    catesubObject.sub_category_nm = "JUMPER" 
   	catesubArray.push(catesubObject);
    
    //BOTTOM에 해당하는 sub category 리스트
    catesubObject = new Object();
    catesubObject.main_category_cd = "C01";
    catesubObject.sub_category_cd = "C011"
    catesubObject.sub_category_nm = "PANTS" 
   	catesubArray.push(catesubObject);
     
    catesubObject = new Object();
    catesubObject.main_category_cd = "C01";
    catesubObject.sub_category_cd = "C012"
    catesubObject.sub_category_nm = "OPS" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "C01";
    catesubObject.sub_category_cd = "C013"
    catesubObject.sub_category_nm = "SKIRT" 
   	catesubArray.push(catesubObject);
    
    //ACC에 해당하는 sub category 리스트
    catesubObject = new Object();
    catesubObject.main_category_cd = "D01";
    catesubObject.sub_category_cd = "D011"
    catesubObject.sub_category_nm = "EARRING" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "D01";
    catesubObject.sub_category_cd = "D012"
    catesubObject.sub_category_nm = "HAT" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "D01";
    catesubObject.sub_category_cd = "D013"
    catesubObject.sub_category_nm = "LEGGINGS" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "D01";
    catesubObject.sub_category_cd = "D014"
    catesubObject.sub_category_nm = "BAG" 
   	catesubArray.push(catesubObject);
    
    //SHOES에 해당하는 sub category 리스트
    catesubObject = new Object();
    catesubObject.main_category_cd = "E01";
    catesubObject.sub_category_cd = "E011"
    catesubObject.sub_category_nm = "WARKER" 
   	catesubArray.push(catesubObject);
   
    catesubObject = new Object();
    catesubObject.main_category_cd = "E01";
    catesubObject.sub_category_cd = "E012"
    catesubObject.sub_category_nm = "BOOTS" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "E01";
    catesubObject.sub_category_cd = "E013"
    catesubObject.sub_category_nm = "SNEAKERS" 
   	catesubArray.push(catesubObject);
    
    catesubObject = new Object();
    catesubObject.main_category_cd = "E01";
    catesubObject.sub_category_cd = "E014"
    catesubObject.sub_category_nm = "FLAT" 
   	catesubArray.push(catesubObject);
    
    //****************이부분은 DB로 셋팅하세요.
     
     
    //메인 카테고리 셋팅
    var cateSelectBox = $("select[name='cate_cd']");
     
    for(var i=0;i<cateArray.length;i++){
    	cateSelectBox.append("<option value='"+cateArray[i].main_category_cd+"'>"+cateArray[i].main_category_nm+"</option>");
    }
     
    //*********** 1depth카테고리 선택 후 2depth 생성 START ***********
    $(document).on("change","select[name='cate_cd']",function(){
         
        //두번째 셀렉트 박스를 삭제 시킨다.
        var catesubSelectBox = $("select[name='catesub_cd']");
        catesubSelectBox.children().remove(); //기존 리스트 삭제
         
        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
        $("option:selected", this).each(function(){
            var selectValue = $(this).val(); //main category 에서 선택한 값
            catesubSelectBox.append("<option value=''>전체</option>");
            for(var i=0;i<catesubArray.length;i++){
                if(selectValue == catesubArray[i].main_category_cd){
                     
                	catesubSelectBox.append("<option value='"+catesubArray[i].sub_category_cd+"'>"+catesubArray[i].sub_category_nm+"</option>");
                }
            }
        });
         
    });
    //*********** 1depth카테고리 선택 후 2depth 생성 END ***********
         
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
			<!-- 셀렉트 박스 -->
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-md-4 control-label" >분류</label>  -->
<!-- 			 <select name="cate_cd" style="width:200px"> -->
<!--         <option value="">전체</option> -->
<!--     </select> -->
<!--    <select name="catesub_cd" style="width:200px" > -->
<!--         <option value="">전체</option> -->
<!--     </select> -->
<!--     </div>				 -->
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