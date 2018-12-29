<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table summary="글쓰기 전체 테이블">
		<form name="BoardWriteForm" method="post" id="writeForm" 	action="write.do">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
<table summary="테이블 구성">
				<caption>게시판 글쓰기</caption>
				<tr>
					<td>작성자</td>
					<td>
					ADMIN
<!-- 					<form action="id"> -->
<!-- 					</a><input type=text name= size=10 maxlength=8 > -->
<!-- 					</form> -->
					</td>
				</tr>
				<tr>
					<td>제 목</td>
					<td><input type=text name=not_title></td>
				</tr>
				<tr>
					<td>내 용</td>
					<td><textarea name=not_content rows="10" cols="100"></textarea></td>
				</tr>
				<tr>
					<td colspan=2><hr size=1></td>
				</tr>
				<tr>
					<td colspan="2">
					<div align="center">
							<input type="submit" id="insert" value="등록">&nbsp;&nbsp; 
<!-- 							//제이쿼리 펑션 사용할려면 타입 버튼으로 해야댐 -->
								<input type="button" value="뒤로" onclick="move('<%=request.getContextPath() %>/list.no');" />
						</div></td>
				</tr>
			</table>
		</form>
	</table>
</body>
</html>