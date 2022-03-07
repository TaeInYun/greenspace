<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 #header_shop{
  	 margin: 0;
	 padding:0px;
	 display: inline-block;
	 width: 100%;
	 
 }
 #a{
 	 display: inline-block;
	 width: 200px;
 }
  #form{
 	 display: inline-block;
	 width: 200px;
	 margin-left: 160px;
 }
 .search {
  position: relative;
  width: 300px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 20px;
  padding: 10px 12px;
  display: inline-block;
  font-size: 14px;
}

#icon {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}
 
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div id="header_shop">
	<div id="a" >
		<a href="/shop/listProduct_home?filter=pro_hit">베스트</a>&nbsp; 
		<a href="/shop/listProduct_home?filterASC=pro_saleprice">특가</a>&nbsp;	
		<a href="/shop/listProduct_home?filter=pro_date">신상품</a>&nbsp;
	</div>
	 <div id="form">
		<form action="/shop/listProduct_home" method="post">
			  <div class="search">
					  <input type="text"name="keyword"  placeholder="검색어 입력">
					  <img id="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
		</form>
</div>
</div>	 
	
	<hr> 
</body>


</html>