<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_상품목록</title>

<style type="text/css">
	table {
	text-align: center;
	width: 100%;
	margin: 10px;
}

.search {
  position: relative;
  width: 300px;
  margin: 10px;
}

#input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 20px;
  padding: 10px 12px;
  font-size: 14px;
}

#icon {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
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
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!-- 모달창 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $function(){
	  
	 $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }"); 
	 $("#updateProduct").find(".modal-content").load("/admin/updateProduct?no=${p.no }"); 
	 
 }
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
					 	 
					 	<form action="/admin/listProduct" method="post">
						   
							    <div class="search">
									  <input type="text"name="keyword" id="input" placeholder="검색어 입력">
									  <img id="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
						</form>
						<table>
							<tr>
								 
								<td>번호</td>
								<td>사진</td>
								<td>이름</td>
								<td>브랜드</td>
								<td>가격</td>
								<td>할인가</td>
								<td>재고수</td>								 
								<td colspan=3>설정</td>
							</tr>
							
							<c:forEach var="p" items="${list }">
								<tr>
									 
									<td>${p.no }</td>
									<td><img  src="/upload/${p.PRO_THUMBNAIL }" width="100" height="100"></td>
									<td>
										<a href="/admin/detailProduct?no=${p.no}">${p.pro_name} </a>					
									</td>				 
									<td>${p.pro_brand }</td>
									<td>${p.pro_price }</td>
									<td>${p.pro_saleprice }</td>
									<td>${p.pro_stock }</td>
								 
									 
							 
 
									<td> <a id="updateProduct" data-toggle="modal" data-target="#updateModal" role="button" href="/admin/updateProduct?no=${p.no }">수정</a></td>
									<td> <a id="deleteProduct" data-toggle="modal" data-target="#deleteModal" role="button" href="/admin/deleteProduct?no=${p.no }">삭제</a></td>
									<td> <a href="/admin/insertProductOption?no=${p.no }">옵션</a></td>
								</tr>	
				 	 		</c:forEach>
						</table>
						
						
  			 			<!-- 모달창 -->
  			 			<div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 			
  			 			
  			 			
  			 			<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 		    
					  			 		     
 
					  			 			
					  			 			
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