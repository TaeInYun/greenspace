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

			//��й�ȣ
			$("#changePwdBtn").click(function(){
				if($("#changePwdHiddenBtn").is(":visible")){
				/*toggleClass(����Ŭ������ �ٲ�Ŭ������);*/
					$("#changePwdBtn").toggleClass("btn01 btn02");
					$("#changePwdHiddenBtn").slideUp();
				}else {
					$("#changePwdBtn").toggleClass("btn02 btn01");
					$("#changePwdHiddenBtn").slideDown();
				}
			});

			//��й�ȣ �ߺ� ��ȿ�� Ȯ��
			$(function(){
				$('#newPwd').keyup(function(){
					$('#chkNotice').html('');
				});

				$('#newPwdChk').keyup(function(){

					if($('#newPwd').val() != $('#newPwdChk').val()){
						$('#chkNotice').html('��й�ȣ ��ġ���� ����<br><br>');
						$('#chkNotice').attr('color', '#f82a2aa3');
					} else{
						$('#chkNotice').html('��й�ȣ ��ġ��<br><br>');
						$('#chkNotice').attr('color', '#199894b3');
					}

				});
			});


			//��й�ȣ�� ��� ��ư
			$("#cancelPwdBtn").click(function (){
				$("#changePwdHiddenBtn").slideUp();
			})

			//�г��� ����
			$(document).ready(function(){
				$("#changeNickNameBtn").click(function(){
					if($("#changeNickNameHiddenBtn").is(":visible")){
						/*toggleClass(����Ŭ������ �ٲ�Ŭ������);*/
						$("#changeNickNameBtn").toggleClass("btn01 btn02");
						$("#changeNickNameHiddenBtn").slideUp();
					}else{ $("#changeNickNameBtn").toggleClass("btn02 btn01");
						$("#changeNickNameHiddenBtn").slideDown();
					}
				});
			});

			//�г��� ��ҹ�ư
			$("#cancelNickNameBtn").click(function (){
				$("#changeNickNameHiddenBtn").slideUp();
			})

			//�̸��� ����
			$(document).ready(function(){
				$("#changeEmailBtn").click(function(){
					if($("#changeEmailHiddenBtn").is(":visible")){
						/*toggleClass(����Ŭ������ �ٲ�Ŭ������);*/
						$("#changeEmailBtn").toggleClass("btn01 btn02");
						$("#changeEmailHiddenBtn").slideUp();
					}else{ $("#changeEmailBtn").toggleClass("btn02 btn01");
						$("#changeEmailHiddenBtn").slideDown();
					}
				});
			});

			//�̸��� ��ҹ�ư
			$("#cancelEmailBtn").click(function (){
				$("#changeEmailHiddenBtn").slideUp();
			})

			//�޴���ȭ ����
			$(document).ready(function(){
				$("#changeCellphone").click(function(){
					if($("#hiddenChangeCellphone").is(":visible")){
						/*toggleClass(����Ŭ������ �ٲ�Ŭ������);*/
						$("#changeCellphone").toggleClass("btn01 btn02");
						$("#hiddenChangeCellphone").slideUp();
					}else{ $("#changeCellphone").toggleClass("btn02 btn01");
						$("#hiddenChangeCellphone").slideDown();
					}
				});
			});

			//�޴���ȭ ���
			$("#cancelCellphoneBtn").click(function (){
				$("#hiddenChangeCellphone").slideUp();
			})

			//ȯ�Ұ��� ����
			$(document).ready(function(){
				$("#changeAccountBtn").click(function(){
					if($("#changeAccountHiddenBtn").is(":visible")){
						/*toggleClass(����Ŭ������ �ٲ�Ŭ������);*/
						$("#changeAccountBtn").toggleClass("btn01 btn02");
						$("#changeAccountHiddenBtn").slideUp();
					}else{ $("#changeAccountBtn").toggleClass("btn02 btn01");
						$("#changeAccountHiddenBtn").slideDown();
					}
				});
			});

			//ȯ�Ұ��� ���
			$("#cancelAccountBtn").click(function (){
				$("#changeAccountHiddenBtn").slideUp();
			})

		});
	
		 
		</script>
	
	


</HEAD>
<BODY>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<a href="mypage/mypagePointList?no=${m.no } ">����Ʈ���</a>
	<h3>�⺻ ȸ������</h3>
 
	 
	���̵� : ${m.id}

	<br> ��й�ȣ : ${m.pwd}
	<button id="changePwdBtn" class="btn01">��й�ȣ ����</button>
	<form method="post">
		<ul id="changePwdHiddenBtn" class="example01" style="display: none;">
			<br> �����й�ȣ <input type="password" id="pwd" name="pwd" required>
			<br> �űԺ�й�ȣ <input type="password" id="newPwd" name="newPwd" required>
			<br> �űԺ�й�ȣ Ȯ�� <input type="password" id="newPwdChk" name="newPwdChk" required>
			<font id="chkNotice" size="2"></font>
			<button id="cancelPwdBtn" type="button">���</button>
			<input type="submit" value="Ȯ��">
		</ul>
	</form>

	<br> �̸� : ${m.name}

	<br> �г��� : ${m.nickname }
	<button id="changeNickNameBtn" class="btn01">�г��� ����</button>
	<form>
		<ul id="changeNickNameHiddenBtn" class="example01" style="display: none;">
			*���̴� �ִ� 15�� �̳��� �ۼ����ּ���
			<br>*�ߺ� �г��� �Ұ�
			<br>*�̸�Ƽ�� �� �Ϻ� Ư������ ���Ұ�
			<div class="nickname_wrap">
				<div >�г���</div>
				<input type="text" name="nickName" id="nickName"><br>
				<span class="error_msg" id="nickNameMsg" style="display:none"></span>
				<span class="success_msg" id="" style="display:none"></span>
			</div>
			<button id="cancelNickNameBtn" type="button">���</button>
			<button name="button">�Ϸ�</button>
		</ul>
	</form>


	<br> �̸��� : ${m.email}
	<button id="changeEmailBtn" class="btn01">�̸��� ����</button>
	<form>
		<ul id="changeEmailHiddenBtn" class="example01" style="display: none;">
			�̸��� ����
			<br> �̸��� <input type="text" name="student_id">
			<br>
			<button id="cancelEmailBtn" type="button">���</button>
			<button name="button">�Ϸ�</button>
		</ul>

	</form>


	<br> �޴���ȭ : ${m.phone}
	<button id="changeCellphone" class="btn01">�ڵ��� ��ȣ ����</button>
	<form>
		<ul id="hiddenChangeCellphone" class="example01" style="display: none;">
			<br> �ڵ�����ȣ <input type="text" name="cellPhone">
			<br> ������ȣ  <input type="text" name="cellPhone">
			<button name="button">����Ȯ��</button>
			<button id="cancelCellphoneBtn" type="button">���</button>
			<button name="button">�Ϸ�</button>
		</ul>
	</form>


	<br> ȯ�Ұ��� : ${m.account_number}
	<button id="changeAccountBtn" class="btn01">ȯ�Ұ��� ���</button>
	<form>
		<ul id="changeAccountHiddenBtn" class="example01" style="display: none;">
			<select name="bank">
				<option value="bankName">���༱��</option>
				<option value="�л�">��������</option>
				<option value="ȸ���">��������</option>
				<option value="��Ÿ">�츮����</option>
				<option value="��Ÿ">īī����ũ</option>
				<option value="��Ÿ">��Ÿ</option>
			</select>
			<br> ���¹�ȣ : <input type="text" name="cellPhone">
			<button id="cancelAccountBtn" type="button">���</button>
			<button name="button">���</button>
		</ul>
	</form>



	<br> ����� :	<button name="button">����� ����</button>



</BODY>
</HTML>