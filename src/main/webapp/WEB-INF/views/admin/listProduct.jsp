<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_상품목록</title>
<link href="/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	table {
	text-align: center;
	width: 100%;
	margin: 10px;
}

.search {
  position: relative;
  width: 300px;
  margin: 10px;
}

#input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 20px;
  padding: 10px 12px;
  font-size: 14px;
}

#icon {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}
table {
    	width: 100%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
  }
  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $function(){
	  
	 $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }"); 
	 $("#updateProduct").find(".modal-content").load("/admin/updateProduct?no=${p.no }"); 
	 
 }
</script>
</head>
<body>








	 			 
	
	
</body>
</html>