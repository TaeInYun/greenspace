<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	 <form action="listmember" method="post">
	 	<table border="1">	 		
	 		<tr>
	 			<td>���̵�</td>
	 			<td>${m.id} </td>
	 		</tr>
	 		<tr>
	 			<td>��й�ȣ</td>
	 			<td><input type="text" name="pwd"/></td>
	 		</tr>
	 		<tr>
	 			<td>�̸�</td>
	 			<td><input type="text" name="name"/></td>
	 		</tr>
	 		<tr>
	 			<td>�г���</td>
	 			<td><input type="text" name="nickname"/></td>
	 		</tr>
	 		<tr>
	 			<td>�̸���</td>
	 			<td><input type="text" name="email"/></td>
	 		</tr>
	 		<tr>
	 			<td>�ڵ�����ȣ</td>
	 			<td><input type="text" name="phone"/></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<input type="submit" value="��ȸ"/>
	 			</td>
	 		</tr>	 		
	 	</table>
	 	
	 </form>
	
</body>
</html>