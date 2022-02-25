<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	 
<title>관리자설정_${p.pro_name }_상세페이지</title>
 
 
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
						 
						<div class="label" >
							<label for="PRO_THUMBNAIL">사진</label><br>
							 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200"><br>
						</div> 
						
						
						
						<hr>
						 <p>옵션설정</p>	
						 <c:if test="${cnt<1 }">	
					 		<P>옵션이 없습니다:(</P>
					 		<button><a href="/admin/insertProductOption?no=${p.no}">옵션추가</a></button>
						 </c:if>
						  	
						 <c:if test="${cnt>=1 }">
						 	 	
						 	  <table border="1" width="80%">
								<tr>
									<td> 옵션명 </td>
									<td> 옵션상세명</td>
									<td> 설정</td>
								</tr>
								
								<c:forEach var="findOptionByProNo" items="${findOptionByProNo}">		
									<tr>
										<td><a href="../admin/insertProductOption?no=${p.no }">${findOptionByProNo.pro_option_name }</a></td>				 
										<td><a href="../admin/insertProductOption?no=${p.no }">${findOptionByProNo.pro_option_detail_name }</a></td>
								 		<td><a href="../admin/deleteProductOption?no=${findOptionByProNo.no}"><button>삭제</button></a></td>   
									</tr>
								</c:forEach>
						</table>			 
						 </c:if>	
						
						  
					</section><!-- 본문 -->					
					 
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>