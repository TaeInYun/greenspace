<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	.inputArea,span,table{
		margin: 10px;
	} 
	.modal-dialog{
		width: 600px;
	}
	table {
    	width: 100%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
  	}
  	th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  	}
  	button{
		border-radius: 20px;		 
		width: 200px;
		background-color: #DCEDC8;
		border: 0.5px solid green;
		margin: 5px;
		padding: 5px  
	}
	button:hover {
  		color: #2ecc71;
	}
	h2{
		text-align: left;	 
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){  	
	
	
	
	
		$(document).on("change","#pro_option_code",function(){	
			let pro_option_code =$("#pro_option_code > option:selected").val();
			let data={pro_option_code:pro_option_code};
			 
			$.ajax({url:"/findDBDetailOption",
				data:data,
				success:function(data){
				$("#pro_option_detail_code").empty();
				 $('#pro_option_detail_code').append(	'<option value="' +null + '">' + null + '</option>'	);
				  $.each(data, function(index,value){	
				 	 $('#pro_option_detail_code').append(	'<option value="' +this.pro_option_detail_code + '">' + this.pro_option_detail_name + '</option>'	).attr(this.pro_option_detail_code);	
				 })	
			}})
		})
		
		
		$(document).on("change","#pro_option_detail_code ",function(){				
			let select_combo=  $("#pro_option_detail_code > option:selected").val();
			let discriminant= $("td").hasClass(select_combo)
			
		 	if(discriminant==true){ 
			 	alert("이미 선택된 옵션입니다.");
				$("#pro_option_detail_code > option:selected").prop('disabled',true);
			}	
		  
		})
		
	   
})//FUNCTION

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
					 	 	<h2>옵션</h2>
					 	 	<hr>
							<div class="card-body"> 
							 	<form action="/admin/insertProductOption" method="post"  enctype="multipart/form-data">				 		
								<div class="inputArea">
									<label for="pro_add_price">추가금액</label>
									<input type="text" id="pro_add_price" name="pro_add_price" value="0" />
								</div>
								
								<div class="inputArea">
									<input type="hidden" id="pro_no" name="pro_no"  value="${p.no}"/>
								</div>
									
								<div class="inputArea">
									<label for="pro_option_code">옵션명</label>
									 <select id="pro_option_code" name="pro_option_code">
										<option value="">선택</option>					
										<c:forEach var="findDBOption" items="${findDBOption}">							
											<option value="${findDBOption.pro_option_code}">${findDBOption.pro_option_name}</option>				
										</c:forEach>
									</select>
								</div>
								
								<div class="inputArea">
									<label for="pro_option_detail_code">옵션상세</label>
									 <select id="pro_option_detail_code" name="pro_option_detail_code">
										<option value="">선택</option>		
									</select>			
								</div>
								
								<div class="inputArea">
									<button  value="확인" id="submit">옵션등록하기</button>			 
								</div>
							</form>	
							<hr>
							
							 
								 <span>옵션현황</span>
								 <c:if test="${cnt<1 }">	
							 		<span>옵션이 없습니다!</span>
								 </c:if>
								  	
								 <c:if test="${cnt>=1 }">						 	 	
								 	
									 
									  <table>
										<tr>	
											<td>번호</td>
											<td> 옵션명 </td>
											<td> 옵션상세명</td>
											<td> 설정</td>
										</tr>
										 
										<c:forEach var="findOptionByProNo" items="${findOptionByProNo}">		
											<tr>
												<td class="${findOptionByProNo.no}">${findOptionByProNo.no }</td>				 
												<td class="${findOptionByProNo.pro_option_code}">${findOptionByProNo.pro_option_name }</td>				 
												<td class="${findOptionByProNo.pro_option_detail_code }">${findOptionByProNo.pro_option_detail_name }</td>
												<td> <a id="deleteOption" data-toggle="modal" data-target="#deleteOptionModal" role="button"  href="../admin/deleteProductOption?pro_no=${p.no }&no=${findOptionByProNo.no}">삭제</a></td>
															
											</tr>
										</c:forEach>
										
									
									</table>		 
									
										<div id="deleteOptionModal" class="modal fade" tabindex="-1" role="dialog"> 
							 				<div class="modal-dialog"> 
							 					<div class="modal-content"> 
							 					</div> 
							 				</div> 
							 		    </div>	  			 			
						  			 		    	 
								 </c:if>	
						  
							</div> 
						</div>
 					
								 
					  		 
 
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 	
 	
 	
 	
 	
 	
		 
		 
		 
		 						
</body>
</html>