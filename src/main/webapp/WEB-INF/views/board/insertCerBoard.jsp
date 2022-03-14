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
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/attrzone.js"></script>
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
<title>녹지공간-인증 게시판</title>
</head>
<body>
<div id="root">
<div id="container">
	<div>
	<div id="wirte_title">
	<h2>인증게시판 작성</h2>
	<i class="material-icons" style="font-size: 14px; color:green; padding-top: 10px;">&#xe001; 하루에 한번만 작성 가능합니다.</i>
	</div>	
	
	
	<div id="writeForm_box">

	<form action="insertCerBoard" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="member_no" value="${m.no }">
		<input type="hidden" name="chg_user_no" value="${endlist[0].no}">		
		<input type="hidden" name="cer_status" id="cer_status" value="공개">		
		<table id="writeForm_box_table">
			<tr>	
				<th scope="row">글공개</th>
				<td>
					<div class="inputArea">
						<label class="switch">
						<input type="checkbox" checked>
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
			<tr>	
				<th scope="row">내용</th>
				<td>
					<div class="inputArea">
					<textarea rows="10" cols="60" name="cer_content"></textarea><br>		
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
				</td>
			</tr>
			
			<tr>
			<th scope="row">사진</th>		
				<td>		
					<input type='file' id='btnAtt' name="files" multiple='multiple'/>
					<div id='att_zone' 
					data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
				</td>
			</tr>
			</table>
				
			<div id="write_btn">  	
			<button type="submit">등록</button>
			<button type="button" onclick="history.go(-1);" >취소</button>	
			</div>
		</form>
		
		</div>
	</div>	
</div>
</div>
</body>
</html>