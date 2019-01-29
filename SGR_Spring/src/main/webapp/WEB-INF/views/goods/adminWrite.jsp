<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 
</head>
<body>
<form action="./adminWriteProcess.ad" class="form-horizontal" method="get" >
<h2  style="text-align: center; color: silver;">관리자 상품 등록</h2>
<fieldset> 
<legend></legend>
 <input id="goods_no" name="goods_no" type="hidden"  class="form-control input-md"  > 
 <input id="goods_name" name="goods_name" type="text"  value="ddd"  class="form-control input-md"  > 
 <input id="goods_price" name="goods_price" type="text"  value="10000"  class="form-control input-md"  > 
 <input id="goods_dc" name="goods_dc" type="text"  value="10"  class="form-control input-md"  > 
 <input id="goods_maker" name="goods_maker" type="text"  value="korea"  class="form-control input-md"  > 
 <input id="goods_origin" name="goods_origin" type="text"  value="korea"  class="form-control input-md"  > 
<input id="goods_pcs" name="goods_pcs" type="text"  value="10"  class="form-control input-md"  > 
<input id="goods_charge" name="goods_charge" type="text"  value="10"  class="form-control input-md"  > 
<input id="catesub_cd" name="catesub_cd"  value="A011">
	
<br>
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
  	
    <button type="submit" id="btn" class="btn btn-info">상품 등록</button>
    <button type="reset" class="btn btn-danger">등록 취소</button>
	<button id="adminListBtn"type="button" name="adminListBtn" class="btn btn-white"  onclick="history.back();">목록</button>
 	
  </div>
</div>
<br>
</fieldset>
</form>
</body>
</html>