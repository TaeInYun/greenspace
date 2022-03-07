<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>

		$(document).ready(function(){

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
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<a href="mypage/mypagePointList?no=${m.no } ">포인트기록</a>
	<h3>기본 회원정보</h3>
 
	 
	아이디 : ${m.id}

	<br> 비밀번호 : ${m.pwd}
	<button id="changePwdBtn" class="btn01">비밀번호 변경</button>
	<form method="post">
		<ul id="changePwdHiddenBtn" class="example01" style="display: none;">
			<br> 현재비밀번호 <input type="password" id="pwd" name="pwd" required>
			<br> 신규비밀번호 <input type="password" id="newPwd" name="newPwd" required>
			<br> 신규비밀번호 확인 <input type="password" id="newPwdChk" name="newPwdChk" required>
			<font id="chkNotice" size="2"></font>
			<button id="cancelPwdBtn" type="button">취소</button>
			<input type="submit" value="확인">
		</ul>
	</form>

	<br> 이름 : ${m.name}

	<br> 닉네임 : ${m.nickname }
	<button id="changeNickNameBtn" class="btn01">닉네임 변경</button>
	<form>
		<ul id="changeNickNameHiddenBtn" class="example01" style="display: none;">
			*길이는 최대 15자 이내로 작성해주세요
			<br>*중복 닉네임 불가
			<br>*이모티콘 및 일부 특수문자 사용불가
			<div class="nickname_wrap">
				<div >닉네임</div>
				<input type="text" name="nickName" id="nickName"><br>
				<span class="error_msg" id="nickNameMsg" style="display:none"></span>
				<span class="success_msg" id="" style="display:none"></span>
			</div>
			<button id="cancelNickNameBtn" type="button">취소</button>
			<button name="button">완료</button>
		</ul>
	</form>


	<br> 이메일 : ${m.email}
	<button id="changeEmailBtn" class="btn01">이메일 변경</button>
	<form>
		<ul id="changeEmailHiddenBtn" class="example01" style="display: none;">
			이메일 변경
			<br> 이메일 <input type="text" name="student_id">
			<br>
			<button id="cancelEmailBtn" type="button">취소</button>
			<button name="button">완료</button>
		</ul>

	</form>


	<br> 휴대전화 : ${m.phone}
	<button id="changeCellphone" class="btn01">핸드폰 번호 변경</button>
	<form>
		<ul id="hiddenChangeCellphone" class="example01" style="display: none;">
			<br> 핸드폰번호 <input type="text" name="cellPhone">
			<br> 인증번호  <input type="text" name="cellPhone">
			<button name="button">인증확인</button>
			<button id="cancelCellphoneBtn" type="button">취소</button>
			<button name="button">완료</button>
		</ul>
	</form>


	<br> 환불계좌 : ${m.account_number}
	<button id="changeAccountBtn" class="btn01">환불계좌 등록</button>
	<form>
		<ul id="changeAccountHiddenBtn" class="example01" style="display: none;">
			<select name="bank">
				<option value="bankName">은행선택</option>
				<option value="학생">국민은행</option>
				<option value="회사원">신한은행</option>
				<option value="기타">우리은행</option>
				<option value="기타">카카오뱅크</option>
				<option value="기타">기타</option>
			</select>
			<br> 계좌번호 : <input type="text" name="cellPhone">
			<button id="cancelAccountBtn" type="button">취소</button>
			<button name="button">등록</button>
		</ul>
	</form>



	<br> 배송지 :	<button name="button">배송지 관리</button>



</BODY>
</HTML>