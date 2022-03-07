<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/imginsert.css">
<link rel="stylesheet" href="/css/toggleSwitch.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/imginsert.js"></script>
<script type="text/javascript">
$(function(){
	
	var check = $("input[type='checkbox']");
	 

	  $(check).each(function(){
		  var cer_status = $("#cer_status").val();
		  
		  if( cer_status== "공개" ){
			  $(this).attr("checked", true );
		  }
	  }); 
	
	
    $(check).click(function(){
        var chk = $(this).is(":checked");
        if(chk){
        	 $('#cer_status').val('공개');
        	
        } else {
        	$('#cer_status').val('비공개');
        	
        }
	});
	
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>챌린지 인증 수정</h2>
	
	<div>
		글 공개
		<label class="switch">
			<input type="checkbox">
			<span class="slider round"></span>
		</label>
	</div>


	<form action="updateCerBoard" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="no" value="${c.no }">
	<input type="hidden" name="member_no" value="${c.member_no }">
	<input type="hidden" name="cer_status" id="cer_status" value="${c.cer_status}">		
		<div class="inputArea">
			<p></p>
			<table border="1" width="50%">
			<tr>
			<td>완료한 챌린지 목록</td>
			</tr>
			<c:forEach var="c" items="${endlist}">
			<tr>
				<td>${c.chg_title}</td>	
			</tr>
			</c:forEach>
			</table>
		</div>
		<div class="inputArea">
		내용<br>
		<textarea rows="10" cols="60" name="cer_content" >${c.cer_content}</textarea><br>		
		</div>
		
		<div class="inputArea">
			 <label for="cer_thumbnail">썸네일</label>
				<input type="hidden" name="cer_thumbnail" value="${c.cer_thumbnail }">
		   <input type="file" name="uploadFile">(${c.cer_thumbnail })<br>
		</div>
		 <div id="fileDiv">
 				첨부이미지<br>
                            <c:forEach items="${imglist }" varStatus="row" var="i" >
                                <p>
                                <input type="hidden" name="img_no" value="${i.no}">
                                  <img src="../upload/cer/${i.save_img_name }" width="100" height="100">
                                </p>
                            </c:forEach>
                        </div>
        
        <input type='file' id='btnAtt' name="files" multiple='multiple'/>
		<div id='att_zone' 
	      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div> 
		
		<input type="submit" value="수정">
		<button type="button" onclick="history.go(-1);" >취소</button>
	</form>

</body>
</html>