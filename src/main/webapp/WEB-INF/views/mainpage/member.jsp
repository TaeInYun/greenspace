<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/popup.css">
 <link href="/css/style.css" rel="stylesheet"/> 
 <link href="/css/main.css" rel="stylesheet"/> 	 
	 
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script><title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/popup.js"></script>
<script type="text/javascript">
$(function(){

	
	//도전하기 버튼 클릭시 상태 ING로 변경
	$(document).on("click", "#startBtn", function() {
		
		let chg_no = $(this).val();
		let chg_status_code = 'ING';
		let member_no = $( $(document).find("input[name=member_no]")).val();
		let data = {
					chg_no:chg_no,
					chg_status_code:chg_status_code,
					member_no:member_no
					}
		console.log(data);	
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					console.log(data)
					$("#listTable").load("/mainpage/member #listTable")
					}
			});//end ajax
	});
	
	
	//완료 버튼 클릭시 상태 END로 변경
	$(document).on("click", "#finishBtn", function() {
		
		let chg_no = $(this).val();
		let chg_status_code = 'END';
		let member_no = $( $(document).find("input[name=member_no]")).val();
		let data = {
					chg_no:chg_no,
					chg_status_code:chg_status_code,
					member_no:member_no}
			
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					$("#listTable").load("/mainpage/member #listTable")
					}
			});//end ajax
	});
	

	
	//포기 버튼 클릭시 상태 STA로 변경
	$(document).on("click", "#ResetBtn", function() {
		
		let chg_no = $(this).val();
		let chg_status_code = 'STA';
		let member_no = $( $(document).find("input[name=member_no]")).val();
		let data = {
					chg_no:chg_no,
					chg_status_code:chg_status_code,
					member_no:member_no}
			
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					$("#listTable").load("/mainpage/member #listTable")
					}
			});//end ajax
	});
	
	
	//도전완료 버튼 클릭시 상태 ING로 변경
	$(document).on("click", "#endBtn", function() {
		
		let chg_no = $(this).val();
		let chg_status_code = 'ING';
		let member_no = $( $(document).find("input[name=member_no]")).val();
		let data = {
					chg_no:chg_no,
					chg_status_code:chg_status_code,
					member_no:member_no}
			
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					console.log(data)
					$("#listTable").load("/mainpage/member #listTable")
					
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			});//end ajax
	});
	
	
	//완료된 리스트 insert
	$("#confirmBtn").on("click",function(){
	    
		let member_no = $( $(document).find("input[name=member_no]")).val();
		
		$.ajax({
			url:"checkEndStatus",
			data:{member_no:member_no},
			success:function(data){
			if(data==0){
				alert("도전완료한 챌린지가 없습니다!");
			}else{
				
				$.ajax({
					url: "insertEndChg",
					data:  {member_no:member_no},
					success: function(data){
						console.log(data)
						if(data == -1) {
							alert("오류입니다!");
							location.href = "/mainpage/member"
							}else {
								alert("오늘의 챌린지 완료!");
								location.href = "/mainpage/member"
							}
					}
			});//end ajax	*/
	
			}
		}});


	});
	
	
	//인증글 쓰러가기 클릭
	$("#insertCerBtn").on("click",function(){
	//	let member_no = $( $(document).find("input[name=member_no]")).val();
		window.open("/board/insertCerBoard",'인증글 작성','width=500px,height=600px,menubar=0');

	});
	
	//인증글 확인가기 클릭
	$("#goCerBtn").on("click",function(){
		location.href = "/mypage/myCerBoard"
	});
	
	
	
	
	$("#mainButton").click(function(){
		location.href='login'
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
		location.href='../ecoMagazine/ecoMagazineInfo'
	})
	
	let a = ${m.levels}
	 
	if(a=1){
		 $("#memberPhoto").attr("src", "/upload/Lv1.png");
	}else if(a=2){
		 $("#memberPhoto").attr("src", "/upload/Lv2.png");
	}else if(a=3){
		 $("#memberPhoto").attr("src", "/upload/Lv3.png");
	}else if(a=4){
		 $("#memberPhoto").attr("src", "/upload/Lv4.png");
	}else{
		 $("#memberPhoto").attr("src", "/upload/Lv5.png");
	}
	 
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
				<div id="mainsigleBox" style=" width: 100%;  background-color:#DCEDC8; height: 500px" class="sigleBox" >
				 	  			 	 
				 	 	<img id="memberPhoto" src= "/upload/Lv1.png"    >				 	  
					 
				 			 
				 	<div id="main_member_textBOX" style="width: 50%; margin-top:50px;margin-left:30px;  text-align: left; float: left; font-size: 15px; font-weight: bold;"   >			 
				 	
						<div id=memberInfo  >
							<input type="hidden" name="member_no" value=${m.no }>
							<strong>${m.nickname}</strong>님<br>
							에코레벨 : ${m.levels}Lv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사용가능 포인트 : ${m.point_save}
						</div>

 

	<div id=chglist>
		<div id="tree_num">
		<p>지금까지 ${tree.tree_num }그루의 나무를 살렸어요!</p>
		</div>
	
		챌린지목록
		<div id="listTable">
		<table border="1" width="100%">
			<c:forEach var="c" items="${chglist}" >
			<tr>
				<td>${c.chg_title}</td>
				
				<c:if test="${c.chg_status_code eq 'STA'}" >
					<c:choose>
						<c:when test="${empty endlist}">
						<td><button type="button" id="startBtn" class="btn btn-primary btn-sm" value="${c.chg_no}"  >도전하기</button></td>			
						</c:when>
						 <c:when test="${not empty endlist}">
						 <td><button type="button" id="startBtn" class="btn btn-primary btn-sm" value="${c.chg_no}" disabled="disabled" >도전하기</button></td>			
						</c:when>
						</c:choose>
				</c:if>
				
				<c:if test="${c.chg_status_code eq 'ING'}">
				<td><button   type="button" id="finishBtn" class="btn btn-primary btn-sm" value="${c.chg_no}" >완료</button>
				<button type="button" id="ResetBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" >포기</button></td>
				</c:if>	
				
				<c:if test="${c.chg_status_code eq 'END'}">
				<c:choose>
					<c:when test="${empty endlist}">
					<td><button type="button" id="endBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" >도전완료!</button></td>
					</c:when>
					 <c:when test="${not empty endlist}">
					 <td><button type="button" id="endBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" disabled="disabled">도전완료!</button></td>
					</c:when>
				</c:choose>
				</c:if>	
			</tr>
			</c:forEach>
		</table>
	</div><!-- end 도전 목록 -->
	
	<br>
		 
	 <c:if test="${empty endlist}">
	<button type="button" id="modal-open" class="btn btn-primary btn-lg"   >오늘 챌린지 완료</button>
	 </c:if>
	 <c:if test="${not empty endlist}">
	 <c:choose>
	 <c:when test="${cercnt eq 0 }">
	<button type="button" id="insertCerBtn" class="btn btn-primary btn-lg" >인증글 쓰러가기</button>
	</c:when>
	<c:when test="${cercnt eq 1 }">
	<button type="button" id="goCerBtn" class="btn btn-primary btn-lg" >인증글 확인하기</button>
	</c:when>
	</c:choose>
	</c:if>
 
		</div>
		<jsp:include page="../mainpage/popup.jsp"/>
		</div> <!--  main_textBOX 	 -->
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
										 		
										 	
										 	 <button class="btn_member" id="ecoButton" style="background-color: #fff">  ECO Magazine 바로가기 </button> 
										 	
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
										 		  <button class="btn_member" id="etsButton"> Easy To Start 바로가기 </button> 
										 	
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
											 <button class="btn_member" id="shopButton" style="background-color: #fff"> Shop으로 쇼핑 바로가기 </button> 
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
												공유 게시판에서 타인의 환경실천을 같이 구경해요!<br>
										 		</span>
										 	 <button class="btn_member" id="commuButton"> Community 바로가기 </button> 
										</div>
									</div>







	</section>					
					 			
			</div><!-- 전체  section box-->
		</section>
</div>
</body>
</html>