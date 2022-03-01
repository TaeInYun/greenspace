
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_상품목록</title>
<link href="/css/shop.css" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	 
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
					 	<H2>상품목록</H2>
					 	
					 	<form action="/admin/listProduct" method="post">
						 	<select name="searchColumn">
						 		<option value="">전체</option>
						 		<option value="PBA">욕실</option>
						 		<option value="PKI">주방</option>
						 		<option value="PFO">식품</option>
						 		<option value="PCO">화장품</option>
						 		<option value="PPE">애완용품</option>
						 		<option value="POF">사무용품</option>
						 		<option value="PDA">일상용품</option>
						 	</select>
						  
						 	<input type="text" name="keyword">
							<input type="submit" value="검색">
						</form>
						<table border="1" width="80%">
							<tr>
								<td><input type="checkbox" id="checkedAll" checked="checked"></td>
								<td>상품번호</td>
								<td>사진</td>
								<td>상품이름</td>
								<td>상품브랜드</td>
								<td>상품가격</td>
								<td>상품할인가</td>
								<td>재고수</td>								 
								<td colspan=3>상품관리</td>
							</tr>
							
							<c:forEach var="p" items="${list }">
								<tr>
									<td><input type="checkbox" name="checkList"></td>				
									<td>${p.no }</td>
									<td><img  src="/upload/${p.PRO_THUMBNAIL }" width="100" height="100"></td>
									<td>
										<a href="/admin/detailProduct?no=${p.no}">${p.pro_name} </a>					
									</td>				 
									<td>${p.pro_brand }</td>
									<td>${p.pro_price }</td>
									<td>${p.pro_saleprice }</td>
									<td>${p.pro_stock }</td>
								 
									<td><button><a  href="/admin/updateProduct?no=${p.no }">수정</a></button></td>
									<td><button><a  href="/admin/deleteProduct?no=${p.no }">삭제</a></button></td>
									<td><button><a  href="/admin/insertProductOption?no=${p.no }">옵션</a></button></td>
								</tr>	
							</c:forEach>
						</table>
							<c:forEach var="i" begin="1" end="${totalPage }">
								<a href="/admin/listProduct?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
							</c:forEach>	
					  			 
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>









	 			 
	
	
</body>
</html>