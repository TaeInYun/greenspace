<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	 
<title>Insert title here</title>
 
 
</head>
<body>
	<h2>상품 상세</h2>
	
	 <div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../shop/shopHeader.jsp"/>
			</div>
		</header>	
		 <section id="container">		
				<div id="container_box"> 
				<!-- 본문 -->			
 
					<section id="content">	
							 	
					 		<hr>	
							상품번호 : ${p.no }<br>	
							카테고리 : ${p.cat_code }<br>	
		 					상품이름 : ${p.pro_name }<br>				
							상품가격 :${p.pro_price}<br>	
							상품할인가 :${p.pro_saleprice}<br>
							상품재고 :${p.pro_stock}<br>
							상품설명 : ${p.pro_content }<br>	
							평균출고일자 : ${p.pro_delivery }<br>	
							입고일자 : ${p.pro_date }<br>	
							조회수 : ${p.pro_hit }<br>	
							<img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200"><br>
						  
						  	<hr>
						  	
						 <c:if test="${cnt>=1 }">				 	
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
						 </c:if>	
						
						  
					</section><!-- 본문 -->					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>