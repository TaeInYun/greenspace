function requestPay(cnt, arr_cartNo) {
	IMP.init("imp27131305");
	
	let proName = $("#listCart p:first").text();
	
	// 배송정보
	let name = $("input[name=name]").val();
	let phone = $("input[name=phone]").val();
	let addr_road = $("input[name=addr_road]").val();
	let addr_postal = $("input[name=addr_postal]").val();
	let addr_detail = $("input[name=addr_detail]").val();
	let msg = $("input[name=addr_msg]").val();
	
	let receiver = {
		receiver_name : name,
		receiver_phone : phone,
		receiver_postal: addr_postal,
		receiver_addr: addr_road,
		receiver_detail: addr_detail,
		receiver_msg: msg
	};
	
	//사용 포인트
	let usePoint = $("#usePoint").val();
	//적립 포인트
	let savePoint = $.trim($("#savePoint").text());

	let payment_code = '0A';
	let ord_status_code = 'PAYCOM'
	
	let totalPrice = $("#payPrice").text();
	let addr_no = $("input[name=addr_no]").val();
	let receiver_no = $("input[name=receiver_no]").val();
	
	if(addr_no == null){
		addr_no = 0;
	}
	if(receiver_no == null){
		receiver_no = 0;
	}
	
	if(cnt > 1){
		proName += "외 총 " + (cnt-1) + " 개의 상품"
	}

	$.ajax({
		url:"/getCntOfToday",
		success: function(cntOfToday) {
			let cntOrder = ("00000" + cntOfToday).slice(-5);
			let today = new Date();
			let year = today.getFullYear();
			let month = ("00" + (today.getMonth() + 1)).slice(-2);
			let date = ("00" + today.getDate()).slice(-2);
			let hours = ("00" +today.getHours()).slice(-2);
			let minutes = ("00" +today.getMinutes()).slice(-2);
			let seconds = ("00" +today.getSeconds()).slice(-2);
			
			let ord_id = year + month + date + "-" + hours + minutes + seconds + "-" + cntOrder;
		    
		    IMP.request_pay({ // param
		        pg: "kcp",
		        pay_method: "card",
		        merchant_uid: ord_id,
		        name: proName,
		        amount: totalPrice,
		        buyer_name: name,
		        buyer_tel: phone,
		        buyer_addr: addr_road,
		        buyer_postcode: addr_postal
		    }, function (rsp) { // callback
		        if (rsp.success) {
					
					ord_id = rsp.merchant_uid;
					ord_price = rsp.paid_amount;
					let apply_num = rsp.apply_num;
					let imp_uid = rsp.imp_uid;
					let orders = {
						ord_id: ord_id,
						ord_use_point : usePoint,
						ord_price: ord_price,
						payment_code: payment_code,
						ord_status_code:ord_status_code,
						apply_num:apply_num,
						address_no: addr_no,
						receiver_no:receiver_no,
						point_save:savePoint,
						imp_uid:imp_uid
					};
					
					let data = {
						arr_cartNo:arr_cartNo,
						orders:orders,
						receiver: receiver
					}
					
				$.ajax({
						url: "/shop/resultOrder",
						type: "post",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						async: false,
						success: function(msg){
							location.href="resultOrder";
						}
					});//end insert
				
		        } else {
					alert(rsp.error_msg)
		        }
		    });
		}//end success
		
	});//end getCngOftoday
	
  }