<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#id").blur(function(){
			var id = $("#id").val();
			
				$.ajax({
					url:"checkId",
					data:{id:id},
					success:function(data){
						//0이면 사용가능 , 1이면 중복
						console.log(data);
						if(id==""){
							$("#chkIdMsg").html("필수입력입니다.");
						}
						else if(data!=1){
							$("#chkIdMsg").html("사용가능한 아이디입니다.");
						}else if(data==1){
							$("#chkIdMsg").html("사용 불가능한 아이디입니다.");
						}
					}
				})
		})
		
		
		//비밀번호 확인
		$('#pwd2').blur(function(){
			if($('#pwd2').val()==""){
				$("#chkPwdMsg").html("필수입력");
			}
			else if($('#pwd').val() == $('#pwd2').val()){
		    		$("#chkPwdMsg").html("비밀번호가 일치합니다.");
		    	   
			   }else if($('#pwd').val() != $('#pwd2').val()){
				   $("#chkPwdMsg").html("비밀번호가 일치하지 않습니다.");
			   }
		})  	   
		
})

</script>
</head>
<body>
<h2>회원가입</h2>
	<form action="join" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div>
		아이디<br>
		<input type="text" name="id" id="id"><br>
		<span id="chkIdMsg"></span>
		</div>
		<div>
		비밀번호<br>
		<input type="password" name="pwd" id="pwd"><br>
		</div>
		<div>
		비밀번호 확인<br>
		<input type="password" name="pwd_ck" id="pwd2"><br>
		<span id="chkPwdMsg"></span>
		</div>		
		<div>
		이름<br>
		<input type="text" name="name">
		</div>
		<div>
		닉네임<br>
		<input type="text" name="nickname">
		</div>
		<div>
		이메일<br>
		<input type="text" name="email">
		</div>
		<div>
		전화번호<br>
		<input type="text" name="phone">
		</div>		
		<input type="submit" value="등록">
	</form>
</body>
</html>