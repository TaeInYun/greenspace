<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간</title>
<style type="text/css">
body { margin:0; padding:0; }
div#root { width:900px; margin:0 auto; }
header#header div#header_box { text-align:center; padding:30px 0; }		 
section#content {   width:950px;text-align:center; } 
section#content .sigleBox {  background-color:#03A65A; width:100%;    margin-bottom: 10px;   } 
section#content .photo {    float:right;    width: 47%; height: 300px; margin-top:170px; margin-right: 10px;  } 
section#content .textBOX {    float:left;   width: 45%; height: 100%;  display: inline;  } 
section#content .title {  margin:50px; text-align: center; font-size: 25px; font-style: oblique; line-height: 40px; clear: both;} 
section#content .textBOX_content {    margin:30px;        text-align: center; font-size: 15px; line-height: 20px; clear: both; } 
.textBOX_link{
margin:10px;
margin-top: 40px;
}

span{
	display: block;
}
#main_textBOX{
	 
	 
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate( -50%, -50% )
	
}
#main_photo{
	width: 100%;
	height: 500px;
	border-style: solid;
	 
}
#mainsigleBox{
	position: relative
}
 
</style>
</head>
<body>
 
<div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="header.jsp"/>
			</div>
		</header>		 
		
		<section id="container">		
			<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">
					 			 
									<div id="mainsigleBox" style=" width: 100%; height: 500px" class="sigleBox">
										 <img src="/upload/main.png"  id="main_photo"  >
										<div id="main_textBOX"  >
											 
										 	   
										 		<span id="title" class="title">지구를 지키는 에코라이프!<br> 녹지공간과 함께!</span>
										 		<span id="textBOX_content" class="textBOX_content">일상 속 생활습관 몇가지를
													바꾸는 것만으로도 가능한 에코라이프!
													여러사람들과 챌린지도 하고 달성하며
													내가 얼마나 환경에 기여했는지 확인해볼까요?</span>
										 		<span id="textBOX_link" class="textBOX_link"><a href="/login">회원가입/로그인</a></span>
										 	
										 	 
										 	
										</div>										
									</div>
									  									
									 <div id="eco" style=" width: 100%; height: 500px" class="sigleBox">
										 <img src="/upload/main_eco.png"   class="photo"  > 
										 <div id="eco_textBOX"  class="textBOX">
										 	 
										 		<span id="title" class="title">제목 : 항상 새로운 환경뉴스를 알려주는 친구항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_content" class="textBOX_content">아래 멘트: 항상 새로운 환경뉴스를 알려주는 
										 		친구아래 멘트: 항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_link" class="textBOX_link"><a href="">ECO매거진 이동하기</a></span>
										 	
										 	 
										 	
										</div>
									</div>			 
									<div id="ets" style=" width: 100%; height: 500px" class="sigleBox">
										<img src="/upload/main_ets.png"  class="photo">	
										<div id="ets_textBOX" class="textBOX">
												<span id="title" class="title">제목 : 항상 새로운 환경뉴스를 알려주는 친구항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_content" class="textBOX_content">아래 멘트: 항상 새로운 환경뉴스를 알려주는 
										 		친구아래 멘트: 항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_link" class="textBOX_link"><a href="">ECO매거진 이동하기</a></span>
										 	
										</div>	
									</div>		 
									<div id="shop"style=" width: 100%; height: 500px"  class="sigleBox">
										<img src="/upload/main_shop.png"    class="photo">
										<div id="shop_textBOX" class="textBOX">
												<span id="title" class="title">제목 : 항상 새로운 환경뉴스를 알려주는 친구항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_content" class="textBOX_content">아래 멘트: 항상 새로운 환경뉴스를 알려주는 
										 		친구아래 멘트: 항상 새로운 환경뉴스를 알려주는 친구</span>										 		 
												<span id="textBOX_link" class="textBOX_link"><a href="../shop/listProduct_home">shop 이동하기</a></span>
										 	
										</div>	
									</div>			 
									<div id="commu" style=" width: 100%; height: 500px" class="sigleBox">
										<img src="/upload/main_Community_img.png" class="photo">	
										<div id="commu_textBOX" class="textBOX" >
												<span id="title" class="title">제목 : 항상 새로운 환경뉴스를 알려주는 친구항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_content" class="textBOX_content">아래 멘트: 항상 새로운 환경뉴스를 알려주는 
										 		친구아래 멘트: 항상 새로운 환경뉴스를 알려주는 친구</span>
										 		<span id="textBOX_link" class="textBOX_link"><a href="">ECO매거진 이동하기</a></span>
										</div>
									</div>			 
								  
					</section>					
					 			
			</div><!-- 전체  section box-->
		</section>
</div>




		
</body>
</html>

 