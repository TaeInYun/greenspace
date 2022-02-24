<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$.ajax({
			url : "test.action",
			type : 'post',
			data : {
				name : "이름",
				age : "20",
				gender : "man"
			},
			success : function(data) {
						
		     },
			error : function() {
				alert("error");
			}
		});

	});

</script>
</head>
<body>
<hr>
	<table border="1" width="80%">
		<thead>
			<tr>
				<td>옵션명</td>
				 
			</tr>
		</thead>
		<tbody>
		
		</tbody>	
	</table>
</body>
</html>