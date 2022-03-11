<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
   
    <title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="../header.jsp"></jsp:include>
		<div>
			<a href="#">공지사항 </a>
			<a href="listOne"> 문의사항(QnA)</a>
		</div>
    	<div>
    		<button>
    			<a href="insertNotice">  글 등록  </a>
    		</button>
    	</div>
    	<div>
    		<form action="listBoard" method="post">
	        	<input type="text" name="keyword" class="keyword">
	        	<input type="submit" value="검색">
    		</form>
    	</div>
		<div>
			<table border="1" width="80%">
				<tr>
		            <td>글 번호</td>
		            <td>글 제목</td>
		            <td>작성일</td>
	        	</tr>
        	<c:forEach var="notice" items="${list}">
	    	<c:set var="i" value="${i+1}"/>
	            <tr>
	                <td>
	                	${i+start}
	                </td> 
	                <td>
	                	<a href="detail?no=${notice.no}">${notice.notice_title}</a>
	                </td>
	                <td>
	                    <fmt:formatDate value="${notice.notice_date}" pattern="yyyy.MM.dd"/>
	                </td>
	            </tr>            
	      	</c:forEach>
    		</table>	
		</div>

    
        
	    

    <c:forEach var="i" begin="1" end="${totalPage }">
        <a href="listNotice?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
    </c:forEach>
	
	
	
	</div>
	
	
	

</body>
</html>