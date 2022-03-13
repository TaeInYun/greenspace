<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<link rel="stylesheet" href="/css/toggleSwitch.css">
<style type="text/css">
#writeForm_box_table textarea{
	height:150px;
}
</style>
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
    
    
	//썸넬 이미지 미리보기
    $("#cer_thumbnail").on('change', function(){
        readURL(this);
    });


function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#previewImg').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}

	
});
</script>
<meta charset="UTF-8">
<title>녹지공간- 인증 게시판</title>
</head>
<body>

<div id="container">
	<div>
	<div id="wirte_title">
	<h2>인증 게시판 수정</h2>
	</div>	
	
	
	<div id="writeForm_box">

	<form action="updateCerBoard" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="no" value="${c.no }">
	<input type="hidden" name="member_no" value="${c.member_no }">
	<input type="hidden" name="cer_status" id="cer_status" value="${c.cer_status}">		
	
	<table id="writeForm_box_table">
		<tr>
		<th scope="row">글공개</th>
		<td><div class="inputArea">
				<label class="switch">
					<input type="checkbox">
					<span class="slider round"></span>
				</label>
			</div>	
		</td>
		</tr>
		
		<tr>
		<th scope="row">완료 챌린지</th>
			<td>
				<ul style="font-weight: 600; list-style:disc; margin-left: 20px;">
					<c:if test="${c.chg_title1 ne null }">
					<li>${c.chg_title1 }</li>
					</c:if>
					<c:if test="${c.chg_title2 ne null }">
					<li>${c.chg_title2 }</li>
					</c:if>
					<c:if test="${c.chg_title3 ne null }">
					<li>${c.chg_title3 }</li>
					</c:if>
				</ul>	
			</td>
		</tr>
		
		<tr>
			<th scope="row">내용</th>
			<td>
				<div class="inputArea">
				<textarea rows="10" cols="60" name="cer_content" >${c.cer_content}</textarea><br>		
				</div>
			</td>
		</tr>

		<tr>
		<th scope="row">썸네일</th>		
			<td>
			<div>
				<input type="file" id="cer_thumbnail" name="uploadFile" />
			</div>
				<div id="previewImg_box">
					<img id="previewImg"/>
				</div>
			
			<div id="current_thumbnail">	
			<c:if test="${empty c.cer_thumbnail}"> 
 				<span>현재 썸네일 없음</span> 
 			</c:if>
 			
 			 <c:if test="${!empty c.cer_thumbnail}"> 
			<input type="hidden" name="cer_thumbnail" value="${c.cer_thumbnail }">
		    <img id="current_ThumbImg" src="../upload/cer/${c.cer_thumbnail }"><span>(현재 썸네일)</span>
			</c:if>
			</div>
			</td>
		</tr>
		
		
		<tr>
	    
 		<th scope="row">첨부 사진</th>	
 				<td>
 				 <c:if test="${empty imglist}"> 
 				<span>첨부된 사진이 없습니다.</span> 
 				</c:if>
 				
       			 
       				 <c:forEach items="${imglist }" varStatus="row" var="i" >
       				 <div id="fileDiv">
       				 	<div id="fileDiv_img">
       					 <input type="hidden" name="img_no" value="${i.no}">
                         <img src="../upload/cer/${i.save_img_name }" width="100" height="100">                      
              		   	</div>
              		   </div>                   
                      </c:forEach>
                 
                </td>   
                
		</tr>
		
		<tr>
		<th scope="row">사진 수정</th>
			<td>
			 <input type='file' id='btnAtt' name="files" multiple='multiple'/>
			<div id='att_zone' 
		      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div> 
			
			</td>
		</tr>
		</table>
		
			<div id="write_btn">  	
			<button type="submit">수정</button>
			<button type="button" onclick="history.go(-1);" >취소</button>
			</div>
       </form>
	</div>
</div>
</body>
</html>