<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 내역</title>
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
  		font-size: 20px;
  }
  #presentPoint{
  	margin: 10px;
  }
  p{
  	display: inline-block;
  	margin: 10px;
  }
  .mypage-main{
  
  	float: right;
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


 				<div id="presentPoint">
 					현재포인트: ${findPresentPoint.presentPoint} 	
 				</div>
 				<div id="filter">
 					<p><a href="/mypage/myPointList?no=${findPresentPoint.member_no}">전체</a></p>
 					<p><a href="/mypage/myPointList?no=${findPresentPoint.member_no}&point_status=적립">적립</a></p>
 					<p><a href="/mypage/myPointList?no=${findPresentPoint.member_no}&point_status=사용">사용</a></p>
 			    </div>
 				
 				<table>
						<tr>	
				
							<td> 상태 </td>
							<td> 포인트</td>				 
							<td> 사용일자</td>			 
						</tr>
						 
						<c:forEach var="findAllPointByNO" items="${findAllPointByNO}">			 
						  <tr>
									 
								<td >${findAllPointByNO.point_status }</td>				 
								<td  >${findAllPointByNO.point_amount }</td> 						 
								<td  >${findAllPointByNO.point_date }</td>			 		 			
							</tr>		 
						</c:forEach>
					</table>

 


			</main>
		</div>
	</div>
</body>