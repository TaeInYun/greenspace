<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/popup.css">
 <link href="/css/style.css" rel="stylesheet"/> 
 <link href="/css/main.css" rel="stylesheet"/> 	 
	 
<!-- ��Ʈ��Ʈ�� -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script><title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/popup.js"></script>
<script type="text/javascript">
$(function(){

	
	//�����ϱ� ��ư Ŭ���� ���� ING�� ����
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
	
	
	//�Ϸ� ��ư Ŭ���� ���� END�� ����
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
	

	
	//���� ��ư Ŭ���� ���� STA�� ����
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
	
	
	//�����Ϸ� ��ư Ŭ���� ���� ING�� ����
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
	
	
	//�Ϸ�� ����Ʈ insert
	$("#confirmBtn").on("click",function(){
	    
		let member_no = $( $(document).find("input[name=member_no]")).val();
		
		$.ajax({
			url:"checkEndStatus",
			data:{member_no:member_no},
			success:function(data){
			if(data==0){
				alert("�����Ϸ��� ç������ �����ϴ�!");
			}else{
				
				$.ajax({
					url: "insertEndChg",
					data:  {member_no:member_no},
					success: function(data){
						console.log(data)
						if(data == -1) {
							alert("�����Դϴ�!");
							location.href = "/mainpage/member"
							}else {
								alert("������ ç���� �Ϸ�!");
								location.href = "/mainpage/member"
							}
					}
			});//end ajax	*/
	
			}
		}});


	});
	
	
	//������ �������� Ŭ��
	$("#insertCerBtn").on("click",function(){
	//	let member_no = $( $(document).find("input[name=member_no]")).val();
		window.open("/board/insertCerBoard",'������ �ۼ�','width=500px,height=600px,menubar=0');

	});
	
	//������ Ȯ�ΰ��� Ŭ��
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
			<!-- ���� -->			
					<section id="content">
				<div id="mainsigleBox" style=" width: 100%;  background-color:#DCEDC8; height: 500px" class="sigleBox" >
				 	  			 	 
				 	 	<img id="memberPhoto" src= "/upload/Lv1.png"    >				 	  
					 
				 			 
				 	<div id="main_member_textBOX" style="width: 50%; margin-top:50px;margin-left:30px;  text-align: left; float: left; font-size: 15px; font-weight: bold;"   >			 
				 	
						<div id=memberInfo  >
							<input type="hidden" name="member_no" value=${m.no }>
							<strong>${m.nickname}</strong>��<br>
							���ڷ��� : ${m.levels}Lv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��밡�� ����Ʈ : ${m.point_save}
						</div>

 

	<div id=chglist>
		<div id="tree_num">
		<p>���ݱ��� ${tree.tree_num }�׷��� ������ ��Ⱦ��!</p>
		</div>
	
		ç�������
		<div id="listTable">
		<table border="1" width="100%">
			<c:forEach var="c" items="${chglist}" >
			<tr>
				<td>${c.chg_title}</td>
				
				<c:if test="${c.chg_status_code eq 'STA'}" >
					<c:choose>
						<c:when test="${empty endlist}">
						<td><button type="button" id="startBtn" class="btn btn-primary btn-sm" value="${c.chg_no}"  >�����ϱ�</button></td>			
						</c:when>
						 <c:when test="${not empty endlist}">
						 <td><button type="button" id="startBtn" class="btn btn-primary btn-sm" value="${c.chg_no}" disabled="disabled" >�����ϱ�</button></td>			
						</c:when>
						</c:choose>
				</c:if>
				
				<c:if test="${c.chg_status_code eq 'ING'}">
				<td><button   type="button" id="finishBtn" class="btn btn-primary btn-sm" value="${c.chg_no}" >�Ϸ�</button>
				<button type="button" id="ResetBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" >����</button></td>
				</c:if>	
				
				<c:if test="${c.chg_status_code eq 'END'}">
				<c:choose>
					<c:when test="${empty endlist}">
					<td><button type="button" id="endBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" >�����Ϸ�!</button></td>
					</c:when>
					 <c:when test="${not empty endlist}">
					 <td><button type="button" id="endBtn" class="btn btn-secondary btn-sm" value="${c.chg_no}" disabled="disabled">�����Ϸ�!</button></td>
					</c:when>
				</c:choose>
				</c:if>	
			</tr>
			</c:forEach>
		</table>
	</div><!-- end ���� ��� -->
	
	<br>
		 
	 <c:if test="${empty endlist}">
	<button type="button" id="modal-open" class="btn btn-primary btn-lg"   >���� ç���� �Ϸ�</button>
	 </c:if>
	 <c:if test="${not empty endlist}">
	 <c:choose>
	 <c:when test="${cercnt eq 0 }">
	<button type="button" id="insertCerBtn" class="btn btn-primary btn-lg" >������ ��������</button>
	</c:when>
	<c:when test="${cercnt eq 1 }">
	<button type="button" id="goCerBtn" class="btn btn-primary btn-lg" >������ Ȯ���ϱ�</button>
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
										 	 
										 		<span id="title" class="title">��Ȱ�ӿ��� ȯ�溸ȣ��<br> 
																			   ��� ��õ�ϴ���<br>
																			   �ñ��� ��ſ���<br></span>
											 	<span id="textBOX_content" class="textBOX_content">
												 	ȯ�濡 ���� ���� ������ ���� ����<br>
													�ϻ��Ȱ����, ��ǿ���, �ֹ濡���� <br>
													ȯ�溸�� ��õ�� �� �ְ� ������� �߸�����<br> 
													�и����ſ� ���� �������� �˶��ϰ� ��Ҿ��!<br>
											 	</span>
										 		
										 	
										 	 <button class="btn_member" id="ecoButton" style="background-color: #fff">  ECO Magazine �ٷΰ��� </button> 
										 	
										</div>
									</div>			 
									<div id="ets" style=" width: 100%; background-color:#f1f3f5; height: 500px" class="sigleBox" >
										<img src="/upload/main_ets.png"  class="photo">	
										<div id="ets_textBOX" class="textBOX">
												<span id="title" class="title">������ ������ <br>��� ��õ�ؾ�����<br>������ ��ſ���</span>
												<span id="textBOX_content" class="textBOX_content"> ȯ�濡 ������ ������ ���, � �ͺ���<br>
													 ��õ�ؾ� ���� �𸣴� �е��� ���� �غ��߾��.<br>
													 Easy To Start ���̵带 ����<br>
													�ϻ� �� ��õ�� �� �ִ� ģȯ���� ������ �淯����!<br>
												 </span>
										 		  <button class="btn_member" id="etsButton"> Easy To Start �ٷΰ��� </button> 
										 	
										</div>	
									</div>		 
									<div id="shop"style=" width: 100%; height: 500px"  class="sigleBox">
										<img src="/upload/main_shop.png"    class="photo">
										<div id="shop_textBOX" class="textBOX">
												<span id="title" class="title">
													�Һ������<br>
													ȯ�溸ȣ�� �ϸ鼭<br> 
													���� ���� ��ſ���<br>
												</span>
										 		<span id="textBOX_content" class="textBOX_content">
										 			ģȯ������ ������ �����ϰ� ������<br>
													���� ����Ʈ ã���� ���ƴٴϱ� ������� �ʳ���?<br>
													������������ ��ü������ �����ϰ� �ִ�<br>
													ģȯ�� ��ǰ�� ����������! ZERO Plastic<br>										 			
										 		</span>										 		 
											 <button class="btn_member" id="shopButton" style="background-color: #fff"> Shop���� ���� �ٷΰ��� </button> 
										</div>	
									</div>			 
									<div id="commu" style=" width: 100%; background-color:#f1f3f5; height: 500px" class="sigleBox">
										<img src="/upload/main_Community_img.png" class="photo">	
										<div id="commu_textBOX" class="textBOX" >
												<span id="title" class="title"> 
													ȯ�溸ȣ�� ���� �ϸ鼭<br>
													�ϻ��� �����ϰ� <br>
													�����ϰ� ���� ��ſ���<br>
												</span>
										 		<span id="textBOX_content" class="textBOX_content">
										 		ȯ�濡 ���ؼ� �ñ��� �ѵ� ��� ���� ����<br>
												�׷��� ������������ Ŀ�´�Ƽ ������ �����߽��ϴ�.<br>
												�Ϲ� �Խ��ǿ��� �ٰ��� �����ϰ�<br>
												���� �Խ��ǿ��� Ÿ���� ȯ���õ�� ���� �����ؿ�!<br>
										 		</span>
										 	 <button class="btn_member" id="commuButton"> Community �ٷΰ��� </button> 
										</div>
									</div>







	</section>					
					 			
			</div><!-- ��ü  section box-->
		</section>
</div>
</body>
</html>