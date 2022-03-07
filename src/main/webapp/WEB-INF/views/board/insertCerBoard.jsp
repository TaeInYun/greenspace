<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/toggleSwitch.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var chg_title1=$("input[name='chg_title1']").val();
	var chg_title2=$("input[name='chg_title2']").val();
	var chg_title3=$("input[name='chg_title3']").val();
	
	var check = $("input[type='checkbox']");
	

    $(check).click(function(){
        var chk = $(this).is(":checked");
        if(chk){
        	$('#cer_status').val('공개');   	 
        } else {
        	$('#cer_status').val('비공개');
        }
       console.log(cer_status);
	});
	
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>챌린지 인증 작성</h2>
	<i class="material-icons" style="font-size: 1rem">&#xe001; 하루에 한번만 작성 가능합니다.</i>

	<div>
		글 공개
		<label class="switch">
			<input type="checkbox" checked>
			<span class="slider round"></span>
		</label> 
	</div>

	<div>
	<form action="insertCerBoard" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="member_no" value="${m.no }">
	<input type="hidden" name="chg_user_no" value="${endlist[0].no}">		
	<input type="hidden" name="cer_status" id="cer_status" value="공개">		
		<div class="inputArea">
			<p></p>
			<table id="chgTable" border="1" width="50%">
			<tr>
			<td>완료한 챌린지 목록</td>
			</tr>
			<c:forEach var="c" items="${endlist}"  varStatus="status">
			<tr>
				<td><input type="hidden" name="chg_title${status.index+1}" value="${c.chg_title}">${c.chg_title}</td>	
			</tr>
			</c:forEach>
			</table>
		</div>
		<div class="inputArea">
		내용<br>
		<textarea rows="10" cols="60" name="cer_content"></textarea><br>		
		</div>
		<div class="inputArea">
		<label for="cer_thumbnail">이미지</label>
		<input type="file" name="uploadFile" multiple/>
		<div class="select_img"><img src="" /></div>		
		</div>	

		<input type="submit" value="등록">
		<button type="button" onclick="history.go(-1);" >취소</button>
	</form>
	</div>
</body>
</html>