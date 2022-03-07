<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function kakaopost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // http://postcode.map.daum.net/guide 에서 예제를 활용하여 커스텀

        	document.querySelector("#addr_postal").value = data.zonecode;   //우편번호
            document.querySelector("#addr_road").value =  data.address;     //주소
            document.querySelector("#addr_detail").value =  data.buildingName;  //상세주소
        }
    }).open();
 }
 
$(function(){
	$("#changeTest").change(function(){
		let n=$(this).val();
		$("#addr_main").val(n);
	})
});


/*
$(function(){
	$("select[name=location]").change(function(){
	  console.log($(this).val()); //value값 가져오기
	  console.log($("select[name=location] option:selected").text()); //text값 가져오기
	  
	  $(this).val()
	  $("select[name=location] option:selected").text()
	  $
	  
	});
	
});
*/


</script>
</head>
<body>

	<h2>주소수정</h2>
	<form action="/mypage/updateAddress" method="post" enctype="multipart/form-data">
	
		
		<!-- 리뷰번호:<br>-->
		<%-- <input type="hidden" name="no" value="${a.no }"> --%> <br> <!-- hidden -->
		 <input type="button" value="우편번호찾기" onclick="kakaopost()">
		<!--메인/서브: -->
		<%-- <input type="hidden" name="addr_main" value="${a.addr_main} "> <br> --%> 		
		<select id="changeTest" >		
		  <option value=1>메인</option>
		  <option value=0>서브</option>
		  
		</select> <br>
		
		<input type="hidden" name="addr_main" id="addr_main"><br>
		우편번호: <input type="text" name="addr_postal" id="addr_postal" value="${a.addr_postal}"> <br>
		주소: <input type="text" name="addr_road" id="addr_road" value="${a.addr_road}"> <br>			
		주소상세: <input type="text" name="addr_detail" id="addr_detail" value="${a.addr_detail}"> <br> 
		배송매세지:	<input type="text" name="addr_msg" value="${a.addr_msg}"> <br>
		받는사람:	<input type="text" name="addr_receiver" value="${a.addr_receiver}"> <br>
		휴대전화번호:	<input type="text" name="addr_phone" value="${a.addr_phone}"> <br>
		주소이름:	<input type="text" name="addr_title" value="${a.addr_title}"> <br>
		<!--회원번호:	-->
		<input type="hidden" name="member_no" value="${m.no }" > <br> <!-- hidden -->
		
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>



</form>
</body>
</html>