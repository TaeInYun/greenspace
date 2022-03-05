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
    <h3>게시물 등록</h3>
    <hr>
    <form action="insertNotice" method="post" enctype="multipart/form-data">
        글제목 : <input type="text" name="notice_title"><br>
        글내용 : <br>
        <textarea rows="10" cols="80" name="notice_content"></textarea><br>
        <input type="submit" value="등록">
    </form>


</body>
</html>
