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
            <a class="menu1">챌린지활동</a>
            <a class="menu2">게시물활동 </a>
            <a class="menu3">댓글활동 </a> 
                <ul class="sub" style="display: block;">
                    <li><a href="/mypage/myChallenge">나의 챌린지</a></li>
                    <il><a href="/mypage/myCerBoard">챌린지 인증</a></il>
                </ul>
   
        </div>
</body>

</html>