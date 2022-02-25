
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/shop.css" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		//***** 체크박스에 대한 변수 선언
		let checkbox = "input[name=checkList]";
		let allCheck = "#checkedAll";
		
		//***** 체크박스 클릭시 실행되는 이벤트함수
		$(document).on("click","#checkedAll",function() {
			checkedAll();
			
			showOrderPriceInfo();
		});
		
		$(document).on("click", "#listCart "+ checkbox, function() {
			$(allCheck).prop("checked", false)
			showOrderPriceInfo();
		}); 
 
		
		//***** 선택 상품 삭제
		$("#delSelected").click(function(){
			let select = $("input[name=checkList]:checked");
			let noArr = new Array();
			
			$.each(select, function() {
				let no = $($(this).siblings()[2]).val();
				console.log(no);
				noArr.push(no);
			});
			
			deleteCart(noArr);
		});
		
		$("#option").click(function(){
			alert("상품등록");
		})
		
		
	})//end function
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
								<td>카테고리</td>
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
									<td>${p.cat_name }</td>
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