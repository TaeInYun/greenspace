function requestPay(cnt, arr_cartNo) {
	IMP.init("imp27131305");
	
	// 배송정보
	let name = $("input[name=name]").val();
	let phone = $("input[name=phone]").val();
	let addr_road = $("input[name=addr_road]").val();
	let addr_postal = $("input[name=addr_postal]").val();
	let proName = $("#listCart p:first").text();
	
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
		    
		    let orders = {
				ord_id: ord_id,
				ord_use_point : usePoint,
				ord_price: "2000000",
				payment_code: payment_code,
				ord_status_code:ord_status_code,
				apply_num:"2585222",
				address_no: addr_no,
				receiver_no:receiver_no,
				point_save:savePoint,
				imp_uid:"111111"
			
			};
		    
			let data = {
				arr_cartNo:arr_cartNo,
				orders:orders
			}
					console.log(data);
					$.ajax({
						url: "/shop/resultOrder",
						type: "post",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						async: false,
						dataType: 'json',
						success: function(msg){
							alert("성공")
							location.href="resultOrder";
						}
					});//end insert
		}//end success
	});//end getCngOftoday
  }