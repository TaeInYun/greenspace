<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/popup.css">
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
					location.href = "/mainpage/member"
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
						//document.getElementById("#startBtn").disabled=true;
						//$("#startBtn").attr("disabled",false);
						//$("#endBtn").attr("disabled",false);
						//$('#endBtn').unbind("click");
					}else{
						alert("�����Ϸ��� ç������ �����ϴ�!");
					}
				}
		});//end ajax	

	});
	
	
	//�����۾������� Ŭ��
	$("#insertCerBtn").on("click",function(){
		let member_no = $( $(document).find("input[name=member_no]")).val();
		
		window.open("/board/insertCerBoard",'������ �ۼ�','width=500px,height=600px,menubar=0');

	});
	
})
</script>
</head>
<body>

	<div id="header">
		<jsp:include page="../header.jsp"/>
	</div>

<input type="hidden" name="member_no" value=${m.no }>
	<strong>${m.nickname}</strong>��<br>
	���ڷ��� : ${m.levels}Lv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��밡�� ����Ʈ : ${m.point_save}
<hr>
<div id=chglist>
	<div id="tree_num">
	<p>���ݱ��� x�׷��� ������ ��Ⱦ��!</p>
	</div>
	ç�������
	<div id="listTable">
	<table border="1" width="50%">
		<c:forEach var="c" items="${chglist}">
		<tr>
			<td>${c.chg_title}</td>
			<c:if test="${c.chg_status_code eq 'STA'}">
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
			<td><button type="button" id="finishBtn" class="btn btn-primary btn-sm" value="${c.chg_no}" >�Ϸ�</button>
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
</div>
<br>
 <c:if test="${empty endlist}">
<button type="button" id="modal-open" class="btn btn-primary btn-lg"   >���� ç���� �Ϸ�</button>
 </c:if>
 <c:if test="${not empty endlist}">
<button type="button" id="insertCerBtn" class="btn btn-primary btn-lg" >������ ��������</button>
</c:if>
</div>
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
   
</body>
</html>