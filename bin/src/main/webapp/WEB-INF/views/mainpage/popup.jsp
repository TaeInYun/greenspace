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
	      modalClose(); //��� �ݱ� �Լ� ȣ��
	      //���� �̺�Ʈ ó��
	  });
	  $("#modal-open").click(function(){      
	      $("#popup").css('display','flex').hide().fadeIn();
	      //�˾��� flex�Ӽ����� �ٲ��� �� hide()�� ����� �ٽ� fadeIn()���� ȿ��
	  });
	  
	   $("#modal-goCerBtn").click(function(){      
		      $("#popup1").css('display','flex').hide().fadeIn();
		      //�˾��� flex�Ӽ����� �ٲ��� �� hide()�� ����� �ٽ� fadeIn()���� ȿ��
		  }); 
	  
	  $("#closeBtn").click(function(){
	      modalClose(); //��� �ݱ� �Լ� ȣ��
	  });
	  
	  function modalClose(){
	      $("#popup").fadeOut(); //���̵�ƿ� ȿ��
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
            <p>ç������ �Ϸ��Ͻø�<br>
            ���̻� �������¸� ������ �� �����ϴ�.<br>
            �Ϸ��Ͻðڽ��ϱ�?</p>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn" id="confirmBtn">�Ϸ�</span>
        <span class="pop-btn" id="closeBtn">���</span>
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
            <p>ç���� ���� �Ϸ�!<br>
            �ۼ��Ͻ� ���� Ȯ���Ϸ�<br>
            ���ðڽ��ϱ�?<br>
            </p>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn" id="confirmBtn">��������</span>
        <span class="pop-btn" id="closeBtn">â�ݱ�</span>
      </div>
    </div>
   </div>
   </div><!-- end popup1 -->
   
</body>
</html>