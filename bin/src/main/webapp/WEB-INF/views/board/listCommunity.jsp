<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<H2>커뮤니티</H2>

	<table border="1" width="80%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>닉네임</td>
			<td>등록일</td>
		</tr>
        <c:set var="num" value="${searchVo.totalCount - ((searchVo.curPage-1) * 10) }"/>
        <c:forEach var="c" items="${list}">
			<tr>
				<c:set>
                </c:set>
                <td>${c.no }</td>		 
				<td><a href="/board/detailCommunity?no=${c.no }">${c.commu_title}</a></td>				 
				<td>${c.nickname }</td>
				<td><fmt:formatDate value="${c.commu_date }" pattern="yy.MM.dd HH:ss"/></td>			
			</tr>
		</c:forEach>
	</table> 	
    <c:forEach var="i" begin="1" end="${totalPage}">
        <a href="listCommunity?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
    </c:forEach>

</body>
</html>