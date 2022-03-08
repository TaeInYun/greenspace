<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
				<!-- ���� -->			
				<section id="content">					
 				<div id="presentPoint">
 					��������Ʈ:${findPresentPoint.presentPoint} 	
 				</div>	 
			 	  <table>
						<tr>	
							<td> ��ȣ</td>
							<td> ���� </td>
							<td> ����Ʈ</td>				 
							<td> �������</td>			 
						</tr>
						 
						<c:forEach var="findAllPointByNO" items="${findAllPointByNO}">			 
						  <tr>
								<td >${findAllPointByNO.no }</td>				 
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
			</div><!-- ��ü  section box-->
		</section>
</div>
















 
 
 
</body>
</html>