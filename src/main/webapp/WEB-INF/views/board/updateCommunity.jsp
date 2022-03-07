<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#att_zone {
  width: 450px;
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){

	
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			  imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
			    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:100%;margin:5px;border:1px solid #00f;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
			  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
			    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
			    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
			        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')
	



})




</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>자유게시판 수정</h2>

	<div>
	<form action="updateCommunity" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="member_no" value="${m.no }">
	<input type="hidden" name="no" value="${c.no}">
		<div class="inputArea">
			제목<br>
			<input type="text" name="commu_title" value="${c.commu_title }"><br>		
		</div>		
		<div class="inputArea">
			내용<br>
			<textarea rows="10" cols="60" name="commu_content">${c.commu_content}</textarea><br>		
		</div>
	      
 		<div id="fileDiv">
 		첨부이미지<br>
                            <c:forEach items="${imglist }" varStatus="row" var="i" >
                                <p>
                                <input type="hidden" name="img_no" value="${i.no}">
                                  <img src="../upload/commu/${i.save_img_name }" width="100" height="100">
                                </p>
                            </c:forEach>
                        </div>
        
        <input type='file' id='btnAtt' name="files" multiple='multiple'/>
		<div id='att_zone' 
	      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>             

	      
		<input type="submit" value="수정">
		<button type="button" onclick="history.go(-1);" >취소</button>
	</form>
	</div>
</body>
</html>