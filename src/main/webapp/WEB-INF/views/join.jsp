<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.success_msg{
	
	font-size: 0.7em;
	color: green;
}

.error_msg{
	display:none;
	font-size: 0.7em;
	color: red;
}

#input_code{
		display: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
		
		//에러메세지 출력함수--------------------------------------
		function showErrorMsg(obj, msg) {
		        obj.attr("class", "error_msg");
		        obj.html(msg);
		        obj.show();
		 }

		function showSuccessMsg(obj, msg) {
		        obj.attr("class", "success_msg");
		        obj.html(msg);
		        obj.show();
		}
		//함수끝----------------------------------------------
		
		
		/* 유효성 검사 통과유무 변수 */
		 var idCheck = false;            // 아이디
		 var idckCheck = false;            // 아이디 중복 검사
		 var pwCheck = false;            // 비번
		 var pwckCheck = false;            // 비번 확인
		 var pwckcorCheck = false;        // 비번 확인 일치 확인
		 var nameCheck = false;            // 이름
		 var nickNameCheck = false;            // 닉네임
		 var nickckCheck = false;            // 닉네임 중복검사
		 var emailCheck = false;            // 이메일
		 var emailckCheck = false;            // 이메일 중복검사
		 var phoneCheck = false;            // 휴대번호
		 var codeCheck = false;      		//인증번호 공백
		 var codeckCheck = false;      		//인증번호 일치
		
		//회원가입 버튼(회원가입 기능 작동)
	    $("#joinBtn").click(function(){
	    	
	    	var id = $("#id").val();
	    	var pwd = $("#pwd").val();
	    	var pwdck = $("#pwdck").val();
	    	var name = $("#name").val();
	    	var nickname = $("#nickname").val();
	    	var email = $("#email").val();
	    	var phone = $("#phone").val();
	    	var userCode = $("#userCode").val();
	    	
	   	 	
	    	/* 공백일시 */
			 if(id==""){
				 showErrorMsg($("#idMsg"),"필수입력입니다.");
				 idCheck=false;
			}else{
				idCheck=true;
			}
	    	
			/* 비밀번호 입력칸 공백일시 */
		    if ( pwd == "") {
			            showErrorMsg($("#pwdMsg"),"필수입력입니다.");
			            pwCheck=false;
			        }else{
			        	pwCheck = true;
			 }
			
		    /* 비밀번호 재확인 입력칸 공백일시 */
		    if(pwdck==""){
		    	  showErrorMsg($("#pwdckMsg"),"필수입력입니다.");
		    	  pwckCheck=false;
		    }else{
		    	pwckCheck=true;
		    }
			
			/* 이름 입력칸 공백일시 */
	        if ( name == "") {
		            showErrorMsg($("#nameMsg"),"필수입력입니다.");
		            nameCheck=false;
		        }else{
		        	nameCheck = true;
		        }
		
			/* 닉네임 공백일시 */
			 if(nickname==""){
				 showErrorMsg($("#nickNameMsg"),"필수입력입니다.");
				 nickNameCheck=false;
			}else{
				nickNameCheck=true;
			}
			
				/* 이메일 공백일시 */
			 if(email==""){
				 showErrorMsg($("#emailMsg"),"필수입력입니다.");
				 emailCheck=false;
			}else{
				emailCheck=true;
			}
				
			/* 전화 입력칸 공백일시 */
		     if ( phone == "") {
			        showErrorMsg($("#phoneMsg"),"필수입력입니다.");
			        phoneCheck=false;
			}else{
			        phoneCheck = true;
			  }
		      
				
		   if ($("#input_code").css("display") == "none") {
			   
		      } else { 
		        		/* 인증번호 입력칸 공백일시 */
		    	if ( userCode == "") {
		    			showErrorMsg($("#codeMsg"),"필수입력입니다.");
		    			codeCheck=false;
		    	}else{
		    		codeCheck=true;
		    	}
		    }
		        
	    	  /* 최종 유효성 검사 */
	         if(idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && nickNameCheck && nickckCheck && emailCheck && emailckCheck && phoneCheck && codeCheck && codeckCheck ){

	             $("#join_form").attr("action", "/join");
	             $("#join_form").submit();   
	         }    
	         
	 		return false;
	    });
		 
		
		
		// ================ 아이디 유효성 검사 ================ //
		$("#id").blur(function(){
			
			var id = $("#id").val();
			var oMsg = $("#idMsg");
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
			
	       
			 /* 공백일시 */
			 if(id==""){
				 showErrorMsg(oMsg,"필수입력입니다.");
				 idCheck=false;
			}else{
				idCheck=true;
			}

			 /* 표현식과 맞지 않을때 */
			if(id != ""&& !isID.test(id)){
				showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
	            idCheck=false;
	            return false;	
			}else{
				idCheck=true;
			}
	        
	        /* 아이디 중복체크 */
				$.ajax({
					url:"checkId",
					data:{id:id},
					success:function(data){
						//0이면 사용가능 , 1이면 중복
						if(id != "" && data!=1){
							 showSuccessMsg(oMsg, "사용가능한 아이디입니다!");
							 idckCheck = true;
						}else if(data==1){
							 showErrorMsg(oMsg, "사용중인 아이디입니다.");
							 idckCheck = false;
						}
					}
				})
				
		})//end 아이디 유효성검사
		
		
		// ================ 비밀번호 유효성 검사 ================ //
		$("#pwd").blur(function(){
			var pwd = $("#pwd").val();
			var oMsg = $("#pwdMsg");
			var isPwd = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/
		
				/* 비밀번호 입력칸 공백일시 */
		        if ( pwd == "") {
			            showErrorMsg(oMsg,"필수입력입니다.");
			            pwCheck=false;
			            return false;
			        }else{
			        	pwCheck = true;
			        }
			
	        /* 표현식과 맞지 않을때 */
	        if ( pwd != "" && !isPwd.test(pwd)) {
	            showErrorMsg(oMsg,"8~16자 숫자,영문,특수문자를 조합하여 사용하세요");
	            pwCheck=false;
	            return false;
	        }else{
	        	  $(oMsg).css('display', 'none');
	        	pwCheck=true;
	        }

		})//end 비밀번호 유효성검사
		
		
		// ================ 비밀번호 재확인 유효성검사 ================ //
		$("#pwdck").blur(function(){
			var pwd = $("#pwd").val();
		    var pwdck = $("#pwdck").val();;
		    var oMsg = $("#pwdckMsg");
		 
		    /* 비밀번호 재확인 입력칸 공백일시 */
		    if(pwdck==""){
		    	  showErrorMsg(oMsg,"필수입력입니다.");
		    	  pwckCheck=false;
		    }else{
		    	pwckCheck=true;
		    }
		    
		    /* 비밀번호 일치확인 */
			if(pwdck!="" && pwd == pwdck){
		    	   showSuccessMsg(oMsg,"비밀번호가 일치합니다.");
		    	   pwckcorCheck=true; 
		       }else if(pwdck!="" && pwd != pwdck){
		    	   showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
		    	   pwckcorCheck=false;
		       }
		    
	})//end 비밀번호 재확인 유효성검사
	
	
	
		// ================ 이름 유효성 검사================ //
		$("#name").blur(function(){
			var name = $("#name").val();
		    var oMsg = $("#nameMsg");
			var isName = /^[가-힣a-zA-Z]+$/
	
				/* 이름 입력칸 공백일시 */
		        if ( name == "") {
			            showErrorMsg(oMsg,"필수입력입니다.");
			            nameCheck=false;
			            return false;
			        }else{
			        	nameCheck = true;
			        }
			
		    /* 이름 정규식표현 일치하는지 */
		    if(name != ""&& !isName.test(name)){
				showErrorMsg(oMsg,"공백없이 영문과 한글만 입력하세요.");
				nameCheck=false;
	            return false;	
			} else{
				$(oMsg).css('display', 'none');
				nameCheck=true;
			}
		    
		})//end 이름 유효성검사	
		
		
		// ================ 닉네임 유효성 검사 ================ //
		$("#nickname").blur(function(){
			
			var nickname = $("#nickname").val();
			var oMsg = $("#nickNameMsg");
			var isNicName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
			
			/* 공백일시 */
			 if(nickname==""){
				 showErrorMsg(oMsg,"필수입력입니다.");
				 nickNameCheck=false;
			}else{
				nickNameCheck=true;
			}

			 /* 표현식과 맞지 않을때 */
			if(nickname != ""&& !isNicName.test(nickname)){
				showErrorMsg(oMsg,"닉네임은 공백없이 한글,영문,숫자만 입력하세요.");
				nickNameCheck=false;
	            return false;	
			}else{
				nickNameCheck=true;
			}
	        
	        /* 닉네임 중복체크 */
				$.ajax({
					url:"loginByOrder",
					data:{nickname:nickname},
					success:function(data){
						//0이면 사용가능 , 1이면 중복
						console.log(data);
						if(nickname != "" && data!=1){
							 showSuccessMsg(oMsg, "사용가능한 닉네임입니다!");
							 nickckCheck = true;
						}else if(nickname != "" && data==1){
							 showErrorMsg(oMsg, "사용중인 닉네임입니다.");
							 nickckCheck = false;
						}
					}
				})
		})//end 닉네임 유효성검사	
		
		
		// ================ 이메일 유효성 검사 ================ //
		$("#email").blur(function(){
			
			var email = $("#email").val();
			var oMsg = $("#emailMsg");
			var isEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/
			
			/* 공백일시 */
			 if(email==""){
				 showErrorMsg(oMsg,"필수입력입니다.");
				 emailCheck=false;
			}else{
				emailCheck=true;
			}

			 /* 표현식과 맞지 않을때 */
			if(email != ""&& !isEmail.test(email)){
				showErrorMsg(oMsg,"이메일 형식에 맞지 않습니다.");
				emailCheck=false;
	            return false;	
			}else{
				emailCheck=true;
			}
	        
	        /* 이메일 중복체크 */
				$.ajax({
					url:"checkEmail",
					data:{email:email},
					success:function(data){
						//0이면 사용가능 , 1이면 중복
						if(email != "" && data!=1){
							 showSuccessMsg(oMsg, "사용가능한 이메일입니다!");
							 emailckCheck = true;
						}else if(data==1){
							 showErrorMsg(oMsg, "사용중인 이메일입니다.");
							 emailckCheck = false;
						}
					}
				})
		})//end 이메일 유효성검사		
		
		
		$("#phone").blur(function(){
			var phone = $("#phone").val();
			var oMsg = $("#phoneMsg");
		    var isPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			
		/* 전화 입력칸 공백일시 */
        if ( phone == "") {
	            showErrorMsg(oMsg,"필수입력입니다.");
	            phoneCheck=false;
	        }else{
	        	phoneCheck = true;
	        }
	
		    /* 전화 정규식표현 일치하는지 */
		    if(phone != ""&& !isPhone.test(phone)){
				showErrorMsg(oMsg,"형식에 맞지 않는 번호입니다.");
				$("#btnSend").attr("disabled", true);
				phoneCheck=false;
		        return false;	
			} else{
				$(oMsg).css('display', 'none');
				$("#btnSend").attr("disabled", false);

				phoneCheck=true;
			}
		    
		    
			//--------------휴대폰 유효성검사 인증번호 발송 ---------------
			$("#btnSend").click(function(){
				var phone = $("#phone").val();
				var oMsg = $("#phoneMsg");
				
		    	/* 인증번호 발송 */
				$.ajax({
					url:"checkVerification",
					data:{phone:phone},
					success:function(data){
						code = data;
						 showSuccessMsg(oMsg, "인증번호를 발송했습니다.");
						 phoneCheck = true;
						$("#input_code").css("display","block");
					}
				})	
			});//end 휴대폰 유효성 검사
			
		})
		
		
		//-------------- 인증번호 공백확인 ---------------
		$("#userCode").blur(function(){
			var userCode = $("#userCode").val();
			var oMsg = $("#codeMsg").css("display","block");
				
			/* 인증번호 입력칸 공백일시 */
		    if ( userCode == "") {
			      showErrorMsg(oMsg,"인증번호를 입력해주세요.");
			       codeCheck=false;
			       return false;
			    }
		
		  //-------------- 인증번호 확인버튼 클릭시 ---------------
			$("#btnCheck").click(function(){
				let userCode = $("#userCode").val();
				var oMsg = $("#codeMsg").css("display","block");
				
				if(userCode == code){
					showSuccessMsg(oMsg, "인증번호가 일치합니다.");
					codeckCheck = true;
				}else{
					showErrorMsg(oMsg, "인증번호가 일치하지 않습니다.");
					codeckCheck = false;
				}
				
			});//end 인증번호 확인버튼 클릭시
			
		})
	
		
})
</script>

</head>
<body>
<h2>회원가입</h2>
	<form id="join_form" action="join" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<div class="id_wrap">
		<div >아이디</div>
			<input type="text" name="id" id="id"><br>
			 <span class="error_msg" id="idMsg" style="display:none"></span>
			 <span class="success_msg" id="idMsg" style="display:none"></span>
		</div>
		
		<div class="pwd_wrap">
		<div >비밀번호</div>
			<input type="password" name="pwd" id="pwd"><br>
			 <span class="error_msg" id="pwdMsg"></span>
		<div >비밀번호 확인</div>
			<input type="password" name="pwdck" id="pwdck"><br>
			 <span class="error_msg" id="pwdckMsg"></span>
			 <span class="success_msg" id="pwdckMsg"></span>
		</div>
		
		<div class="name_wrap">
		<div >이름</div>
			<input type="text" name="name" id="name"><br>
			 <span class="error_msg" id="nameMsg" style="display:none"></span>
			 <span class="success_msg" id="nameMsg" style="display:none"></span>
		</div>
		
		<div class="nickname_wrap">
		<div >닉네임</div>
			<input type="text" name="nickname" id="nickname"><br>
			 <span class="error_msg" id="nickNameMsg" style="display:none"></span>
			 <span class="success_msg" id="nickNameMsg" style="display:none"></span>
		</div>	
		
		<div class="email_wrap">
		<div >이메일</div>
			<input type="text" name="email" id="email"><br>
			 <span class="error_msg" id="emailMsg" style="display:none"></span>
			 <span class="success_msg" id="emailMsg" style="display:none"></span>
		</div>	
		
		<div class="phone_wrap">
		<div >휴대전화</div>
			<input type="number" pattern="[0-9]*" name="phone" id="phone" placeholder="숫자만 입력하세요" max="11">
			<input id="btnSend" type="button"  disabled="disabled" value="인증코드 받기"><br>
			
			<div id="input_code">
			<input type="number" id="userCode">
			<input id="btnCheck" type="button" value="인증번호 확인"><br>
			</div>
			
			<span class="error_msg" id="phoneMsg" style="display:none"></span>
			<span class="success_msg" id="phoneMsg" style="display:none"></span>
			<span class="error_msg" id="codeMsg" style="display:none"></span>
			<span class="success_msg" id="codeMsg" style="display:none"></span>		
		</div>				
		
		
		
		<input id="joinBtn" type="button" value="가입하기">
	</form>
</body>
</html>