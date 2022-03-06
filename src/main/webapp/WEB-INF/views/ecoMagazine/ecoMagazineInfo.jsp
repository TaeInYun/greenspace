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
    <h3> 에코매거진 </h3>

    <hr>
    <a href="#">유용정보 </a>
    <a href="ecoMagazineNews">환경관련기사</a>
    <a href="ecoMagazineCampaign">캠페인/후원안내</a>
    <br>
    <br>
    <a href="insertNotice">  글 등록  </a><br>
    <form action="listBoard" method="post">
        <input type="text" name="keyword">
        <input type="submit" value="검색">
    </form>


       
</body>
</html>
