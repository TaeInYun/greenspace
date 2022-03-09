	$(function(){
		/* 회원 로그인 */
		
			
		 $("#loginBtn").click(function(){
		
			var id = $("#id").val();
    		var pwd = $("#pwd").val();
	    	
	    	/* 아이디 공백일시 */
			 if(id==""){
				 $(".error_id").css("display","block");
				 $(".error_pwd").css("display","none");
				 return false;
			}
	    	
		    /* 비밀번호 공백일시 */
			 if(pwd==""){
				 $(".error_id").css("display","none");
				 $(".error_pwd").css("display","block");
				 return false;
			}
	    	
			 /* 로그인 메서드 서버 요청 */
		        $("#login_form").attr("action", "/login");
		        $("#login_form").submit();   
			});
		
		
		/* 비회원 로그인 */
		 $("#loginOrderBtn").click(function(){
			
			var orderName = $("#orderName").val();
	    	var orderNum = $("#orderNum").val();
	    	
	    	var data = {name:orderName,ord_id:orderNum};
	    	console.log(data);
	    	
		    	/* 주문자명 공백일시 */
				 if(orderName==""){
					 $(".error_orderName").css("display","block");
					 $(".error_orderNum").css("display","none");
					 return false;
				}
		    	
			    /* 주문번호 공백일시 */
				 if(orderNum==""){
					 $(".error_orderName").css("display","none");
					 $(".error_orderNum").css("display","block");
					 return false;
				}
			    
				/* 일치하는지 확인 */
					$.ajax({
						type:"POST",
						url:"loginByOrderId",
						data:data,
						success:function(data){
						console.log(data);
						if(data == "fail") {
								$(".error_msg").html("주문자명과 주문번호가 일치하지 않습니다").css("display","block");
								$(".error_orderName").css("display","none");
								$(".error_orderNum").css("display","none");
							}else {
								location.href="/loginByOrderIdOK"
							}
						}
					});

		 });
		
	});/**
 * 
 */