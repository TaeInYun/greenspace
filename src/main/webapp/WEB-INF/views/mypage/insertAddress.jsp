<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 function kakaopost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // http://postcode.map.daum.net/guide 에서 예제를 활용하여 커스텀

        	document.querySelector("#addr_postal").value = data.zonecode;   //우편번호
            document.querySelector("#addr_road").value =  data.address;
            document.querySelector("#addr_detail").value =  data.buildingName;
        }
    }).open();
 }
 
 $(function(){
	$("#changeTest").change(function(){
		let n = $(this).val();
		console.log(n);
		$("#addr_main").val(n);
	})
 });
</script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
</head>
<body>

<jsp:include page="../header.jsp"/>


	<h2>메인주소입력</h2>
	<form action="insertAddress" method="post">		
		<!--  리뷰번호:
		<input type="hidden" name="no"> <br> -->
		<div id="container"> <input type="button" value="우편번호찾기" onclick="kakaopost()" class="btn btn-primary"> <br> </div>
		
		
		<!-- 메인/서브: -->
		<select id="changeTest" >
		  <option value=1>메인</option>
		  <option value=0>서브</option>
		</select> <br> 
		
		 <input type="text" name="addr_main" id="addr_main"> <br>  
		<!-- 1메인0서브 이건 value사용할듯? 아니면 maininsert insert -->
		우편번호: <input type="text" name="addr_postal" id="addr_postal"> <br>
		주소: <input type="text" name="addr_road" id="addr_road"> <br>			
		주소상세: <input type="text" name="addr_detail" id="addr_detail" > <br> 
		배송매세지:	<input type="text" name="addr_msg" > <br>
		받는사람:	<input type="text" name="addr_receiver" > <br>
		휴대전화번호:	<input type="text" name="addr_phone" > <br>
		주소이름:	<input type="text" name="addr_title" > <br>
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" > <br> <!-- hidden -->
		
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>

</html>