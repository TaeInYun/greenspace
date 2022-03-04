<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	  $("#confirmBtn").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	      //컨펌 이벤트 처리
	  });
	  $("#modal-open").click(function(){      
	      $("#popup").css('display','flex').hide().fadeIn();
	      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
	  });
	  
	   $("#modal-goCerBtn").click(function(){      
		      $("#popup1").css('display','flex').hide().fadeIn();
		      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
		  }); 
	  
	  $("#closeBtn").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	  });
	  
	  function modalClose(){
	      $("#popup").fadeOut(); //페이드아웃 효과
	      $("#popup1").fadeOut();
	  }

	});
</script>
<body>

	<!-- popup -->
	<div class="container"> 
 	<div class="popup-wrap" id="popup">
    <div class="popup">	
      <div class="popup-head"></div>
      <div class="popup-body">
        <div class="body-content">
            <p>챌린지를 완료하시면<br>
            더이상 도전상태를 변경할 수 없습니다.<br>
            완료하시겠습니까?</p>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn" id="confirmBtn">완료</span>
        <span class="pop-btn" id="closeBtn">취소</span>
      </div>
    </div>
   </div>
   </div><!-- end popup -->

 
   	<!-- popup1 -->
	<div class="container"> 
 	<div class="popup-wrap" id="popup1">
    <div class="popup">	
      <div class="popup-head"></div>
      <div class="popup-body">
        <div class="body-content">
            <p>챌린지 인증 완료!<br>
            작성하신 글을 확인하러<br>
            가시겠습니까?<br>
            </p>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn" id="confirmBtn">보러가기</span>
        <span class="pop-btn" id="closeBtn">창닫기</span>
      </div>
    </div>
   </div>
   </div><!-- end popup1 -->
   
</body>
</html>