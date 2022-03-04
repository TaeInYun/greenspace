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
    <h3>공지사항</h3>
    <table border="1" width="80%">
        <tr>
            <td>목록</td>
            <td>글제목</td>
            <td>작성일</td>
        </tr>
        <c:set var="num" value="${searchVo.totalCount - ((searchVo.curPage-1) * 10) }"/>
        <c:forEach var="notice" items="${list}">
            <tr>
                <c:set>

                </c:set>
                <td>${notice.no}</td>
                <td>${notice.notice_title}</td>
                <td>${notice.notice_date}</td>
            </tr>
        </c:forEach>
    </table>

    <c:forEach var="i" begin="1" end="${totalPage }">
        <a href="listNotice?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
    </c:forEach>


</body>
</html>
