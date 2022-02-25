<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .modal_wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
 
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	 
window.onload = function() {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};

 

</script>
</head>
<body>
<hr>

<button type='button' id="modal_btn">모달창아 나와랏</button>
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a href="#">close</a></div>
    <div>
         <div class="inputArea">
			<label for="pro_add_price">추가금액</label>
			<input type="text" id="pro_add_price" name="pro_add_price" />
		</div>
		
		<div class="inputArea">
			<label for="pro_option_code">옵션명</label>
			 <select id="option" name="option">
				<option value="">선택</option>					
					<c:forEach var="op" items="${op}">							
						<option value="${op.pro_option_name}">${op.pro_opton_name}</option>				
					</c:forEach>
			</select>
		</div>	
		
		 <div class="inputArea">
			<label for="pro_option_detail_code">자세한 옵션</label>
			 <select id="option" name="option">
				<option value="">선택</option>					
					<c:forEach var="op" items="${op}">							
						<option value="${op.pro_option_name}">${op.pro_opton_name}</option>				
					</c:forEach>
			</select>
		</div>	
		
    </div>
<div>


 

 
			 
</body>
</html>