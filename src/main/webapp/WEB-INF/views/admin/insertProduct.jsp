<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
<!-- 파일 업로드 스크립트 -->
<script>
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#input_file").on("change", fileCheck);
		});

/**
 * 첨부파일로직
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fileCheck(e) {
    var files = e.target.files;
    
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}

/*
 * 폼 submit 로직
 */
	function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
   /*
   * 파일업로드 multiple ajax처리
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "/file-upload",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
</script>
</head>
<body> 
	<h2>상품 등록</h2>
	<hr>
	<form action="/admin/insertProduct" method="post"  enctype="multipart/form-data" name="dataForm" id="dataForm" onsubmit="return registerAction()">		 
		카테고리 : <select name="cat_code">
					<option value="BA">욕실</option>
					<option value="KI">주방</option>
					<option value="PFO">식품</option>
					<option value="PCO">화장품</option>
					<option value="PPE">애완용품</option>
					<option value="POF">사무용품</option>
					<option value="PDA">일상용품</option>
				</select><br>
		상품이름 : <input type="text" name="pro_name"><br>
		상품브랜드 : <input type="text" name="pro_brand"><br>
		상품가격 : <input type="text" name="pro_price"><br>
		상품할인가 : <input type="text" name="pro_saleprice"><br>
		상품재고 : <input type="text" name="pro_stock"><br>
		상품평균출고날짜 : <input type="text" name="pro_delivery"><br>
		상품내용 : <br><textarea rows="10" cols="80" name="pro_content"></textarea><br>	
		사진 : 	
		<input id="input_file" multiple="multiple" type="file" name="uploadFile">
	 	<button id="btn-upload" type="button" >파일 추가</button>  		 
	  	<div class="data_file_txt" id="data_file_txt">
			<span>첨부 파일</span>
			<br/>
			<div id="articlefileChange">
			</div>
		</div>
	  	<button type="submit">전송</button>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>