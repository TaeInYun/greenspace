<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
	<title>녹지공간 - 회원정보</title>
	<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/searchDate.js"></script>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
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

		$(function(){
			//에러메세지 출력함수--------------------------------------
			
			
			 var phoneCheck = false;            // 휴대번호
			 var codeCheck = false;      		//인증번호 공백
			 var codeckCheck = false;      		//인증번호 일치
			
			 var phone = $("#phone").val();
		     var userCode = $("#userCode").val();
		     
		     
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
			
		})
		
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
					url:"http://localhost:8080/checkVerification",
					data:{phone:phone},
					
					success:function(data){
						code = data;
						console.log(code);
						 showSuccessMsg(oMsg, "인증번호를 발송했습니다.");
						 phoneCheck = true;
						$("#input_code").css("display","block");
					}
				})	
			});//end 휴대폰 유효성 검사
			
		})
			//비밀번호
			$("#changePwdBtn").click(function(){
				if($("#changePwdHiddenBtn").is(":visible")){
				/*toggleClass(기존클래스명 바꿀클래스명);*/
					$("#changePwdBtn").toggleClass("btn01 btn02");
					$("#changePwdHiddenBtn").slideUp();
				}else {
					$("#changePwdBtn").toggleClass("btn02 btn01");
					$("#changePwdHiddenBtn").slideDown();
				}
			});

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
				var userCode = $("#userCode").val();
				var oMsg = $("#codeMsg").css("display","block");
				
				if(userCode == code){
					showSuccessMsg(oMsg, "인증번호가 일치합니다.");
					$("#phone_form").submit();  
				}else{
					showErrorMsg(oMsg, "인증번호가 일치하지 않습니다.");
					
				}
				
			});//end 인증번호 확인버튼 클릭시
			
		})
		
			//비밀번호 중복 유효성 확인
			$(function(){
				$('#newPwd').keyup(function(){
					$('#chkNotice').html('');
				});

				$('#newPwdChk').keyup(function(){

					if($('#newPwd').val() != $('#newPwdChk').val()){
						$('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
						$('#chkNotice').attr('color', '#f82a2aa3');
					} else{
						$('#chkNotice').html('비밀번호 일치함<br><br>');
						$('#chkNotice').attr('color', '#199894b3');
					}

				});
			});


			//비밀번호의 취소 버튼
			$("#cancelPwdBtn").click(function (){
				$("#changePwdHiddenBtn").slideUp();
			})

			//닉네임 변경
			$(document).ready(function(){
				$("#changeNickNameBtn").click(function(){
					if($("#changeNickNameHiddenBtn").is(":visible")){
						/*toggleClass(기존클래스명 바꿀클래스명);*/
						$("#changeNickNameBtn").toggleClass("btn01 btn02");
						$("#changeNickNameHiddenBtn").slideUp();
					}else{ $("#changeNickNameBtn").toggleClass("btn02 btn01");
						$("#changeNickNameHiddenBtn").slideDown();
					}
				});
			});

			//닉네임 취소번튼
			$("#cancelNickNameBtn").click(function (){
				$("#changeNickNameHiddenBtn").slideUp();
			})

			//이메일 변경
			$(document).ready(function(){
				$("#changeEmailBtn").click(function(){
					if($("#changeEmailHiddenBtn").is(":visible")){
						/*toggleClass(기존클래스명 바꿀클래스명);*/
						$("#changeEmailBtn").toggleClass("btn01 btn02");
						$("#changeEmailHiddenBtn").slideUp();
					}else{ $("#changeEmailBtn").toggleClass("btn02 btn01");
						$("#changeEmailHiddenBtn").slideDown();
					}
				});
			});

			//이메일 취소버튼
			$("#cancelEmailBtn").click(function (){
				$("#changeEmailHiddenBtn").slideUp();
			})

			//휴대전화 변경
			$(document).ready(function(){
				$("#changeCellphone").click(function(){
					if($("#hiddenChangeCellphone").is(":visible")){
						/*toggleClass(기존클래스명 바꿀클래스명);*/
						$("#changeCellphone").toggleClass("btn01 btn02");
						$("#hiddenChangeCellphone").slideUp();
					}else{ $("#changeCellphone").toggleClass("btn02 btn01");
						$("#hiddenChangeCellphone").slideDown();
					}
				});
			});
			
			
			//휴대전화 취소
			$("#cancelCellphoneBtn").click(function (){
				$("#hiddenChangeCellphone").slideUp();
			})

			//환불계좌 변경
			$(document).ready(function(){
				$("#changeAccountBtn").click(function(){
					if($("#changeAccountHiddenBtn").is(":visible")){
						/*toggleClass(기존클래스명 바꿀클래스명);*/
						$("#changeAccountBtn").toggleClass("btn01 btn02");
						$("#changeAccountHiddenBtn").slideUp();
					}else{ $("#changeAccountBtn").toggleClass("btn02 btn01");
						$("#changeAccountHiddenBtn").slideDown();
					}
				});
			});

			//환불계좌 취소
			$("#cancelAccountBtn").click(function (){
				$("#changeAccountHiddenBtn").slideUp();
			})
			
			

		}); 
		</script>
</HEAD>
<BODY>
	<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
				<main class="mypage-main">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div>
							<h3>기본 회원정보</h3>
					</div>
					<div>
						<hr>아이디 : ${m.id}
					</div>
					<div>
						<hr>비밀번호 : ********
						<button id="changePwdBtn" class="btn01">비밀번호 변경</button>
							<form action="/mypage/updatePwd2" method="post">
								<ul id="changePwdHiddenBtn" class="example01" style="display: none;">
									<br> 현재비밀번호 <input type="password" id="pwd" name="pwd" required>
									<br> 신규비밀번호 <input type="password" id="newPwd" name="newPwd" required>
									<br> 신규비밀번호 확인 <input type="password" id="newPwdChk" name="newPwdChk" required>
									<font id="chkNotice" size="2"></font>
									<button id="cancelPwdBtn" type="button">취소</button>
									<input type="submit" value="확인">
								</ul>
							</form>
					</div>
					<div>
						<hr>이름 : ${m.name}
					</div>
					<div>
						<hr>닉네임 : ${m.nickname }
						<button id="changeNickNameBtn" class="btn01">닉네임 변경</button>
						<form action="/mypage/updateNickName" method="POST" >
							<ul id="changeNickNameHiddenBtn" class="example01" style="display: none;">
								*길이는 최대 15자 이내로 작성해주세요
								<br>*중복 닉네임 불가
								<br>*이모티콘 및 일부 특수문자 사용불가
								<div class="nickname_wrap">
									<input type="text" name="nickName" id="nickName"><br>
									<span class="error_msg" id="nickNameMsg" style="display:none"></span>
									<span class="success_msg" id="" style="display:none"></span>
									<button id="cancelNickNameBtn" type="button">취소</button>
									<button type="submit">변경</button>
								</div>	
							</ul>
						</form>
					</div>
					<div>
						<hr> 이메일 : ${m.email}
						<button id="changeEmailBtn" class="btn01">이메일 변경</button>
							<form action="/mypage/memberInfo" method="POST" >
								<ul id="changeEmailHiddenBtn" class="example01" style="display: none;">
									이메일 <input type="text" name="email">
									<br>
									<button id="cancelEmailBtn" type="button">취소</button>
									<button type="submit">변경</button>
								</ul>
							</form>
					</div>
					<div>
						<hr>휴대전화 : ${m.phone}
						<button id="changeCellphone" class="btn01">핸드폰 번호 변경</button>
						<ul id="hiddenChangeCellphone" class="example01" style="display: none;">
	        				<form id="phone_form" action="/mypage/updatePhone" method="post">
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
							</form>
      					</ul>
					</div>
					<div>
						<hr> 환불계좌 : ${m.account_bank} ${m.account_number}
						<button id="changeAccountBtn" class="btn01">환불계좌 등록</button>
							<form action="/mypage/updateAccount" method="POST" >
								<ul id="changeAccountHiddenBtn" class="example01" style="display: none;">
									<select name="bank" >
										<option value="bankName">은행선택</option>
										<option value="국민은행">국민은행</option>
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="기타">기타</option>
									</select>
									<br> 계좌번호 : <input type="text" name="accountNumber">
									<button id="cancelAccountBtn" type="button">취소</button>
									<button  type="submit">등록</button>
								</ul>
							</form>
					</div>
					<div>
						<hr>
						<a href=/mypage/mainAddress>
							<button>내 주소 관리</button>
						</a>
					</div>
				</main>			
		</div>
	</div>
		

</BODY>
</HTML>