<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="/css/style.css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body { margin:0; padding:0; }
ul, li { margin:0; padding:0; list-style:none; display: inline-blockblock;} 
a{cursor:pointer;}
div#root { width:1200px; margin:0 auto; }		 
section#content { float:right; display:inline-block; width:84%; }
#calendar{position:relative; display:inline-block;  width: 450px;}
aside { float:left; width:10%   margin: 0px;   padding: 0px; text-align: left; }
 
header#header div#header_box { text-align:center; padding:30px 0; }
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
  p{
  	display: inline-block;
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
				 
				 
 					<table>						 						 
						<c:forEach var="findAllCommentByMember_no" items="${findAllCommentByMember_no}">			 
						  <tr>
								<td >${findAllCommentByMember_no.com_regdate}</td>				 
								<td >${findAllCommentByMember_no.com_content}</td>				 
						 		<td><a id="updateComments"  data-toggle="modal" data-target="#updateModal" role="button"  href="/board/updateComments?no=${findAllCommentByMember_no.no}&member_no=${findAllCommentByMember_no.member_no}&com_content=${findAllCommentByMember_no.com_content}">수정</a></td>
								<td><a id="deleteComments"  data-toggle="modal" data-target="#deleteModal" role="button"  href="/board/deleteComments?no=${findAllCommentByMember_no.no}&member_no=${findAllCommentByMember_no.member_no}">삭제</a></td>
						 </tr>		 
						</c:forEach>
					</table>
 				 
 							<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog"> 
								<div class="modal-dialog"> 
									<div class="modal-content"> 
									</div> 
								</div> 
						    </div>	
						    
						    <div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
								<div class="modal-dialog"> 
									<div class="modal-content"> 
									</div> 
								</div> 
						    </div>	
		
					</section>					
					  
					<aside id="aside">
						<jsp:include page="../mypage/myAside.jsp"/>
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>
















 
 
 
</body>
</html>