<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="/css/style.css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
	 
</script>
</head>
<body>
<div id="root">
<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
			 		
				 
		 		<table border="1" width="80%">
				<tr>
					 
					<td>상품번호</td>
					<td>리뷰제목</td>
					<td>리뷰내용</td>
				 	 
				</tr>
				<c:forEach var="findMyReview" items="${findMyReview }">
					<tr> 
						<td>${findMyReview.pro_no}</td>
						<td>
							${findMyReview.re_title} 					
						</td>				 
						<td>${findMyReview.re_content }</td>						 
					</tr>
				</c:forEach>
			</table> 	
 				 	
 				 	
 							 
		
		 
			</main>
		</div>
	</div>
</body>














 
 
 
</body>
</html>