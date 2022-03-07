<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간</title>
 <link href="/css/main.css" rel="stylesheet"/> 	 
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#mainButton").click(function(){
			location.href='../login'
		})
		$("#etsButton").click(function(){
			location.href='../easyToStart/easyToStartList'
		})
		$("#shopButton").click(function(){
			location.href='../shop/listProduct_home'
		})
		$("#commuButton").click(function(){
			location.href='../board/listCommunity'
		})
		$("#ecoButton").click(function(){
			location.href=''
		})
		
	})

</script>
</head>
<body>
 
<div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</header>		 
		
		<section id="container">		
			<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">
					 			 
									<div id="mainsigleBox" style=" width: 100%; height: 500px" class="sigleBox">
										 <img src="/upload/main.png"  id="main_photo"  >
										<div id="main_textBOX"  >									 
										 	   
										 		<span id="title"  style="text-align: center; font-size: 30px; margin: 15px;  "><strong>지구를 지키는 에코라이프!<br></strong> 
										 		<strong>녹지공간과 함께!</strong></span>
										 		<span id="textBOX_content"  style="text-align: center;">일상 속 생활습관 몇가지를
													바꾸는 것만으로도 가능한 에코라이프!<br>
													여러사람들과 챌린지도 하고 달성하며
													내가 얼마나 환경에 기여했는지 확인해볼까요?</span>
												 <button id="mainButton"> 로그인/회원가입 </button>     
										</div>										
									</div>
									  									
									 <div id="eco" style=" width: 100%; height: 500px" class="sigleBox">
										 <img src="/upload/main_eco.png"   class="photo"  > 
										 <div id="eco_textBOX"  class="textBOX">
										 	 
										 		<span id="title" class="title">생활속에서 환경보호를<br> 
																			   어떻게 실천하는지<br>
																			   궁금한 당신에게<br></span>
											 	<span id="textBOX_content" class="textBOX_content">
												 	환경에 대한 여러 정보를 담은 잡지<br>
													일상생활에서, 욕실에서, 주방에서도 <br>
													환경보를 실천할 수 있고 심지어는 잘몰랐던<br> 
													분리수거에 대한 정보까지 알뜰하게 담았어요!<br>
											 	</span>
										 		
										 	
										 	 <button class="btn" id="ecoButton" style="background-color: #fff">  ECO Magazine 바로가기 </button> 
										 	
										</div>
									</div>			 
									<div id="ets" style=" width: 100%; background-color:#f1f3f5; height: 500px" class="sigleBox" >
										<img src="/upload/main_ets.png"  class="photo">	
										<div id="ets_textBOX" class="textBOX">
												<span id="title" class="title">관심은 있지만 <br>어떻게 실천해야할지<br>막막한 당신에게</span>
												<span id="textBOX_content" class="textBOX_content"> 환경에 관심은 많지만 어떻게, 어떤 것부터<br>
													 실천해야 할지 모르는 분들을 위해 준비했어요.<br>
													 Easy To Start 가이드를 통해<br>
													일상 속 실천할 수 있는 친환경적 습관을 길러봐요!<br>
												 </span>
										 		  <button class="btn" id="etsButton"> Easy To Start 바로가기 </button> 
										 	
										</div>	
									</div>		 
									<div id="shop"style=" width: 100%; height: 500px"  class="sigleBox">
										<img src="/upload/main_shop.png"    class="photo">
										<div id="shop_textBOX" class="textBOX">
												<span id="title" class="title">
													소비까지도<br>
													환경보호를 하면서<br> 
													즐기고 싶은 당신에게<br>
												</span>
										 		<span id="textBOX_content" class="textBOX_content">
										 			친환경적인 물건을 구매하고 싶은데<br>
													여러 사이트 찾으러 돌아다니기 힘드시진 않나요?<br>
													녹지공간에서 자체적으로 생산하고 있는<br>
													친환경 제품을 만나보세요! ZERO Plastic<br>										 			
										 		</span>										 		 
											 <button class="btn" id="shopButton" style="background-color: #fff"> Shop으로 쇼핑 바로가기 </button> 
										</div>	
									</div>			 
									<div id="commu" style=" width: 100%; background-color:#f1f3f5; height: 500px" class="sigleBox">
										<img src="/upload/main_Community_img.png" class="photo">	
										<div id="commu_textBOX" class="textBOX" >
												<span id="title" class="title"> 
													환경보호를 같이 하면서<br>
													일상을 공유하고 <br>
													소통하고 싶은 당신에게<br>
												</span>
										 		<span id="textBOX_content" class="textBOX_content">
										 		환경에 대해서 궁금은 한데 물어볼 곳은 없고<br>
												그래서 녹지공간에서 커뮤니티 공간을 마련했습니다.<br>
												일반 게시판에서 다같이 소통하고<br>
												공유 게시판에서 사람들의 환경실천을 같이 구경해요!<br>
										 		</span>
										 	 <button class="btn" id="commuButton"> Community 바로가기 </button> 
										</div>
									</div>			 
								  
					</section>					
					 			
			</div><!-- 전체  section box-->
		</section>
</div>




		
</body>
</html>

 