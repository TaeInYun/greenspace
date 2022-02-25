<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
$(function(){  	
	
	
		$(document).on("change","#pro_option_code ",function(){				
			 	
			let pro_option_code =$("#pro_option_code > option:selected").val().trim(); 
			let data={pro_option_code:pro_option_code};
			 
			$.ajax({url:"/findOptionDetailName",data:data,success:function(data){
				$("#pro_option_detail_code").empty();
				 $('#pro_option_detail_code').append(	'<option value="' +null + '">' + null + '</option>'	);
				  $.each(data, function(index,value){	
				 	 $('#pro_option_detail_code').append(	'<option value="' +this.pro_option_detail_code + '">' + this.pro_option_detail_name + '</option>'	).attr(this.pro_option_detail_code);	
				 })	
			}})
		})
		
		
		$(document).on("change","#pro_option_detail_code ",function(){				
			let c=  $("#pro_option_detail_code > option:selected").val();
			alert(c);
			
			if($("td").hasClass(c)=true){ 
			 alert("이미 선택된 옵션입니다.");
			$("#pro_option_code").val("선택");	
			$("#pro_option_detail_code").val("선택");	
			$("#pro_option_detail_code > option:selected").prop('disabled',true);
		}	
			
		})
		

 
			   
})//FUNCTION

</script>
</head>
<body>
<h2>옵션추가</h2>
<hr>
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
			 <input type="submit" value="확인" id="submit">
		</div>
	</form>	
	
	 
	 
	 
	<h3>${p.pro_name}의 옵션 현황</h3>	  
	<table border="1" width="80%">
			<tr>
				<td> 옵션명 </td>
				<td> 옵션상세명</td>
				<td> 설정</td>
			</tr>
			
			<c:forEach var="op" items="${op}">		
				<tr>
					<td class="${op.pro_option_name}">${op.pro_option_name }</td>				 
					<td class="${op.pro_option_detail_code}">${op.pro_option_detail_name }</td>
					<td><a href="../admin/deleteProductOption?no=${op.no}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
	</table>	
 
</body>
</html>