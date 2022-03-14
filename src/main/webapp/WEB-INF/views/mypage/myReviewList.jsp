<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 내역</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css"> 
<style type="text/css">
body { margin:0; padding:0; }
ul, li { margin:0; padding:0; list-style:none; display: inline-blockblock;} 
a{cursor:pointer;}
div#root { width:1200px; margin:0 auto; }		 
section#content { float:right; display:inline-block; width:84%; }
#calendar{position:relative; display:inline-block;  width: 450px;}
aside { float:left; width:10%   margin: 0px;   padding: 0px; text-align: left; }
 
header#header div#header_box { text-align:center; padding:30px 0; }
 table {
    	width: 100%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
    	font-size: 13px;
  }
  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  }
  #presentPoint{
  	margin: 10px;
  }
  p{
  	display: inline-block;
  	margin: 10px;
  }
  a{  
  	margin: 10px;
  	margin-bottom: 20px;
  }
  .filter{
  	margin-bottom: 10px;
  	border-style: solid;
  }
  .mypage_aside {
    width: 12%; 
    margin: 5px;
    border-right: 1px solid #eee;
    padding-right: 5px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
$(function() {
	$("#link_orderList").attr("style","color:white; background: #00913A;")
	$( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
	
	$(".myShopping").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
});
</script>
</head>
<body>
<div id="root">
<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
			 		<jsp:include page="./myShoppingHeader.jsp"></jsp:include>
				 
		 		<table border="1" width="80%">
				<tr>
					 
					<td>상품번호</td>
					<td>리뷰제목</td>
					<td>리뷰내용</td>
					<td colspan=2>설정</td>
					 
				 	 
				</tr>
				<c:forEach var="findMyReview" items="${findMyReview }">
					<tr> 
						<td>${findMyReview.pro_no}</td>
						<td>
							${findMyReview.re_title} 					
						</td>				 
						<td>${findMyReview.re_content }</td>			
						<td><a id="updateReview"  data-toggle="modal" data-target="#updateModal" role="button"  href="/shop/updateReview?no=${findMyReview.no}">수정</a></td>
						<td><a id="deleteReview"  data-toggle="modal" data-target="#deleteModal" role="button"  href="/shop/deleteReview?no=${findMyReview.no}">삭제</a></td>
									 
					</tr>
				</c:forEach>
			</table> 	
			
			
			
 							<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog"> 
								<div class="modal-dialog"> 
									<div class="modal-content"> 
									</div> 
								</div> 
						    </div>	
						    
						    <div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
								<div class="modal-dialog"> 
									<div class="modal-content"> 
									</div> 
								</div> 
						    </div>	
		
		 
 				 	
 				 	
 							 
		
		 
			</main>
		</div>
	</div>
</body>














 
 
 
</body>
</html>