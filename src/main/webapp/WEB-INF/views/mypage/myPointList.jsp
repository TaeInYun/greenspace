<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<link href="/css/mypage.css" rel="stylesheet"/> 	 
<style type="text/css">
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
	 
</script>
</head>
<body>
<div id="root">
		<header id="header">
			<div id="header_box">
				<div id="header1_box">
					<jsp:include page="../header.jsp"/>
				</div>
			</div>
		</header>		 
		
		<section id="container">		
			<div id="container_box"> 
				<!-- 본문 -->			
				<section id="content">					
 				<div id="presentPoint">
 					현재포인트: ${findPresentPoint.presentPoint} 	
 				</div>
 				
 				<table>
						<tr>	
							<td> 번호</td>
							<td> 상태 </td>
							<td> 포인트</td>				 
							<td> 사용일자</td>			 
						</tr>
						 
						<c:forEach var="findAllPointByNO" items="${findAllPointByNO}">			 
						  <tr>
								<td >${findAllPointByNO.num}</td>				 
								<td >${findAllPointByNO.point_status }</td>				 
								<td  >${findAllPointByNO.point_amount }</td> 						 
								<td  >${findAllPointByNO.point_date }</td>			 		 			
							</tr>		 
						</c:forEach>
					</table>
 				 
 			
					</section>					
					  
					<aside id="aside">
						<jsp:include page="../mypage/myAside.jsp"/>
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>
















 
 
 
</body>
</html>