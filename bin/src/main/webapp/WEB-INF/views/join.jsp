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
						//0�̸� ��밡�� , 1�̸� �ߺ�
						console.log(data);
						if(id==""){
							$("#chkIdMsg").html("�ʼ��Է��Դϴ�.");
						}
						else if(data!=1){
							$("#chkIdMsg").html("��밡���� ���̵��Դϴ�.");
						}else if(data==1){
							$("#chkIdMsg").html("��� �Ұ����� ���̵��Դϴ�.");
						}
					}
				})
		})
		
		
		//��й�ȣ Ȯ��
		$('#pwd2').blur(function(){
			if($('#pwd2').val()==""){
				$("#chkPwdMsg").html("�ʼ��Է�");
			}
			else if($('#pwd').val() == $('#pwd2').val()){
		    		$("#chkPwdMsg").html("��й�ȣ�� ��ġ�մϴ�.");
		    	   
			   }else if($('#pwd').val() != $('#pwd2').val()){
				   $("#chkPwdMsg").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			   }
		})  	   
		
})

</script>
</head>
<body>
<h2>ȸ������</h2>
	<form action="join" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div>
		���̵�<br>
		<input type="text" name="id" id="id"><br>
		<span id="chkIdMsg"></span>
		</div>
		<div>
		��й�ȣ<br>
		<input type="password" name="pwd" id="pwd"><br>
		</div>
		<div>
		��й�ȣ Ȯ��<br>
		<input type="password" name="pwd_ck" id="pwd2"><br>
		<span id="chkPwdMsg"></span>
		</div>		
		<div>
		�̸�<br>
		<input type="text" name="name">
		</div>
		<div>
		�г���<br>
		<input type="text" name="nickname">
		</div>
		<div>
		�̸���<br>
		<input type="text" name="email">
		</div>
		<div>
		��ȭ��ȣ<br>
		<input type="text" name="phone">
		</div>		
		<input type="submit" value="���">
	</form>
</body>
</html>