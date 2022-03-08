<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
       .yes_select{
          display: none;
          visibility: hidden;
       }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
       $(document).ready(function(){
          $('.addlike').click(function(){
             var likeDiv = $(this)
             var no = likeDiv.siblings(".ets-no").val()
             var 
             
             
             $.ajax({
                 method: "GET",
                 url: "/easyToStart/like/" + no,
               }).done(function( likeCount ) {
            	   
                  likeDiv.children(".count").text(likeCount)
                  $(likeDiv).find(".no_select").css({
                     display: "none",
                    visibility: "hidden"
                  });
                  
                  $(likeDiv).find(".yes_select").css({
                     display: "inline",
                    visibility: "visible"
                  });   
                 });
          });
          
          
          
       });
    
   </script>
   
   
   
</head>
<body>
    <h3>EasyToStart</h3>
    <hr>
    
   <br><a href="#">전체</a> &nbsp
   <a href="">일상생활</a> &nbsp
   <a href="">욕실</a>&nbsp
   <a href="">주방</a>&nbsp
   <a href="">분리수거</a>&nbsp
   
   <hr>
   
    <br><a href="insertNotice">  글 등록  </a><br>

   <table border="1" width="80%">
       <tr>
           <td>썸네일</td>
           <td>제목</td>
           <td>좋아요</td>
       </tr>
       <c:forEach var="e" items="${easyToStart }">
           <tr>
               <td>${e.ets_thumbnail}</td>
               <td>${e.ets_title }</td>
               <td style="user-select: none"> 
                  <input type="hidden" class="ets-no" value="${e.no}">   
                  <div class="addlike">
                  
                     <i class="fa-regular fa-heart no_select" >   
                     </i>   
                     
                     <i class="fa-solid fa-heart yes_select">   </i>
                     <span class = "count">${e.ets_like}</span>
                </div>
                  
               </td>
           </tr>
       </c:forEach>
   </table>

   <c:forEach var="i" begin="1" end="${totalPage }">
       <a href="easyToStartList?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
   </c:forEach>
   
   
   

   
</body>
</html>