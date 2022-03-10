<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/mychallenge.css">
<link rel="stylesheet" href="/css/popup.css"> 
<style type="text/css">
#confirmBtn{
	border-right:1px solid #cccccc; 
	font-weight:bolder;
	color:#04AA6D;
}
</style>	 
<!-- ��Ʈ��Ʈ�� -->
<link rel="stylesheet" href="/css/popup.css">
<link href="/css/mychallenge.css" rel="stylesheet"/>  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/popup.js"></script>
<script type="text/javascript">
$(function(){
	
	$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
	$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
	
	
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
			
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					console.log(data)
					$("#listTable").load("/mypage/myChallenge #listTable")
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
					$("#listTable").load("/mypage/myChallenge #listTable")
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
					$("#listTable").load("/mypage/myChallenge #listTable")
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
			console.log(data);
			$.ajax({
				url: "updateChgStatus",
				data:  data,
				success: function(data){
					console.log(data)
					$("#listTable").load("/mypage/myChallenge #listTable")
					//location.href = "/mainpage/member"
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
				url: "insertEndChg",
				data:  {member_no:member_no},
				success: function(data){
					console.log(data)
					if(data==1){
						alert("������ ç���� �Ϸ�!");
						location.href = "/mypage/myChallenge"
					}else{
						alert("�����Ϸ��� ç������ �����ϴ�!");
						location.href = "/mypage/myChallenge"
					}
				}
		});//end ajax	

	});
	
	//�����۾������� Ŭ��
	$("#insertCerBtn").on("click",function(){
	//	let member_no = $( $(document).find("input[name=member_no]")).val();
		window.open("/board/insertCerBoard",'������ �ۼ�','width=500px,height=600px,menubar=0');

	});
	
	
	//�����ۺ������� Ŭ��
	$("#goCerBtn").on("click",function(){
		location.href = "/mypage/myCerBoard"
	});
	
	
})
</script>
</head>
<body>
<div id="root">
	
	<jsp:include page="../mainpage/popup.jsp"/>  

	
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
				<jsp:include page="./myActiveHeader.jsp"></jsp:include>
				<div class="search">
					<div class="search__btns">
						<a href="/mypage/myChallenge"><button type="button">My ç����</button></a>
						<a href="/mypage/myCerBoard"><button type="button">My ����</button></a>
					</div>
				</div>
		
		<div id="content_box">
		
			<input type="hidden" name="member_no" value=${m.no }>	
		
			<div id="calendar">
				<jsp:include page="../mypage/calendar.jsp"/>
			</div> 

		<div id=chglist>
		<div id="tree_num">
		<p>���ݱ��� ${tree.tree_num }�׷��� ������ ��Ⱦ��!</p><br>
		</div>
	
		<div style="margin-bottom: 10px">ç�������</div>
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
	</div>	
			</main>
		</div>
	</div>
</body>
</html>