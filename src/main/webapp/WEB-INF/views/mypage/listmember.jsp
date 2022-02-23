<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <form action="listmember" method="post">
	 	<table border="1">	 		
	 		<tr>
	 			<td>아이디</td>
	 			<td>${m.id} </td>
	 		</tr>
	 		
	 		<tr>
	 			<td>비밀번호</td>
	 			<td><input type="text" name="pwd"/></td>
	 		</tr>
	 		<tr>
	 			<td>이름</td>
	 			<td><input type="text" name="name"/></td>
	 		</tr>
	 		<tr>
	 			<td>닉네임</td>
	 			<td><input type="text" name="nickname"/></td>
	 		</tr>
	 		<tr>
	 			<td>이메일</td>
	 			<td><input type="text" name="email"/></td>
	 		</tr>
	 		<tr>
	 			<td>핸드폰번호</td>
	 			<td><input type="text" name="phone"/></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<input type="submit" value="조회"/>
	 			</td>
	 		</tr>	
	 		 		
	 	</table>
	 	
	 </form>
	
</body>
</html>