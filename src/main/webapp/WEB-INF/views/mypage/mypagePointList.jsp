<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
	 
</script>
</head>
<body>
<h2>포인트 내역</h2>
 현재포인트:${findPresentPoint.presentPoint} 
 
 <table border="1" width="80%">
				<tr>	
					<td> 번호</td>
					<td> 상태 </td>
					<td> 포인트</td>				 
					<td> 사용일자</td>			 
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
			
 
</body>
</html>