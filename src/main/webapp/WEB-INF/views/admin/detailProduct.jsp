<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>관리자설정_${p.pro_name }_상세페이지</title>
<link href="/css/admin.css" rel="stylesheet"/> 	 
<link rel="stylesheet" href="/css/style.css">
 <style type="text/css">
 	 
	 #content_1{
	 	display: inline-block;	 	 
	 	width: 100%;	 	
	 }
	 img{
	 	display: inline-block; 	 
	 	 
	 	margin: 20px;
	 	margin-left:10px;
	 	float: left;
	 }
	 .lableZip{	 	 
	 	width: 60%;
	 	 
	 }
	 .label{	 	 
	 	margin: 10px;
	 	margin-top: 0px;
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
	  p{
	  	margin:10px;
	  }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $(function(){
	  
	 
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
					 	 
					  <div id="content_1"> 
                	<img src="/upload/${p.PRO_THUMBNAIL }" width="360" height="300"><br>   
                    <div class="lableZip" style="float: right;"> 
                                         
                       <div class="label" >
							<label for="no">상품번호</label>
							 <span>${p.no }</span>
						</div>
					 	
					 	<div class="label" >
							<label for="cat_name">카테고리</label>
							<span>${p.cat_name }</span>
						</div>
						
						
						<div class="label" >
							<label for="pro_name">상품이름</label> 
							<span> ${p.pro_name }</span>
						</div>
						
						<div class="label" >
							<label for="review_count">리뷰</label> 
							<span> ${review.count}개(${review.avg }점)</span> 
						</div>
						
						 
							 
						<div class="label" >
							<label for="pro_price">상품가격</label>
							 <span>${p.pro_price }원</span>
						</div>
						
						
						<div class="label" >
							<label for="pro_saleprice">상품할인가</label>
							 <span>${p.pro_saleprice }원</span>
						</div>	 
					 		 
						<div class="label" >
							<label for="pro_saleprice">상품재고</label>
							 <span>${p.pro_stock }개</span>
						</div>	 
						
						<div class="label" >
							<label for="pro_saleprice">상품설명</label>
							 <span>${p.pro_content }</span>
						</div>	 	 
						
						<div class="label" >
							<label for="pro_delivery">평균출고일자</label>
							 <span>${p.pro_delivery }일</span>
						</div>	 	
						
						<div class="label" >
							<label for="pro_hit">조회수</label>
							<span> ${p.pro_hit }</span>
						</div>	
						
						
					 </div>	<!-- lableZip -->
				</div> 	<!-- content_1 -->	
						 
						
						<hr>
						 <p>옵션설정</p>	
						 <c:if test="${cnt<1 }">	
					 		<P>옵션이 없습니다:(</P>
					 		<td> <a id="option" data-toggle="modal" data-target="#optionModal" role="button" href="/admin/insertProductOption?no=${p.no }">추가</a></td>
						 </c:if>
						  	
						 <c:if test="${cnt>=1 }">
						 	 	
						 	  <table>
								<tr>
									<td> 옵션명 </td>
									<td> 옵션상세명</td>
									 
								</tr>
								
								<c:forEach var="findOptionByProNo" items="${findOptionByProNo}">		
									<tr>
										<td>${findOptionByProNo.pro_option_name }</td>				 
										<td>${findOptionByProNo.pro_option_detail_name }</td>
								  
									</tr>
								</c:forEach>
						</table>			 
						 </c:if>	
					  			 			 
					  			 			
					  		 
 
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>
















 
						
						
						
						
						
						
						
						
						
					 
		 
</body>
</html>