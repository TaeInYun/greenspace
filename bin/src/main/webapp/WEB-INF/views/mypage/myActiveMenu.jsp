<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/mySubMenu.css">
<style type="text/css">
#submenubar li{cursor:pointer}
.sub{background-color: #efefef;}
</style>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	  $(".menu1").click(function(){
          if($(".sub").is(":visible")){
              $(".sub").css("display","none");
          }
          else{
              $(".sub").css("display","block");
          }
      })
})
</script>

<body>
   <div id="submenubar">
            <a class="menu1">ç����Ȱ��</a>
            <a class="menu2">�Խù�Ȱ�� </a>
            <a class="menu3">���Ȱ�� </a> 
                <ul class="sub" style="display: block;">
                    <li><a href="/mypage/myChallenge">���� ç����</a></li>
                    <il><a href="/mypage/myCerBoard">ç���� ����</a></il>
                </ul>
   
        </div>
</body>

</html>