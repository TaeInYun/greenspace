<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <h2>EasyToStart</h2>
        <a href="">전체</a><br>
        <a href="">일상생활</a><br>
        <a href="">욕실</a><br>
        <a href="">주방</a><br>
        <a href="">분리수거</a><br>

<table border="1" width="80%">
    <tr>
        <td>썸네일</td>
        <td>제목</td>
        <td>좋아요</td>
    </tr>
    <c:forEach var="b" items="${getList }">
        <tr>
            <td>${b.ets_thumbnail}</td>
            <td>${b.ets_title }</td>
            <td> <a>♡</a> ${b.ets_like}</td>
        </tr>
    </c:forEach>
</table>

<c:forEach var="i" begin="1" end="${totalPage }">
    <a href="listBoard?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
</c:forEach>
</body>
</html>
