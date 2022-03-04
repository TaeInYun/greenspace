// 전체체크에 관한 기능 추가
function checkedAll() {
	if( $("#checkedAll").is(":checked") ){
		$("input[name=checkList]").prop("checked", true);
	}else{
		$("input[name=checkList]").prop("checked", false);
	}
}

// 체크에 따라 주문정보의 가격표시
function showOrderPriceInfo(){
	let select = $("input[name=checkList]:checked");
	let tot_price = 0;
	let tot_saleprice = 0;
	let tot_discount = 0;
	let delivery_price = 0;
	
	$.each(select, function() {
		let qty = $( $(this).siblings()[4] ).val();
		tot_price += Number( $($(this).siblings()[0]).val() ) * qty;
		tot_discount += Number( $($(this).siblings()[3]).val() ) * qty;
		tot_saleprice += Number( $($(this).siblings()[1]).val() ) * qty ;
	});
	
	
	if( tot_saleprice < 50000){
		delivery_price = 2500;
	}
	
	tot_saleprice += delivery_price
	
	$("#tot_price").html(tot_price);
	$("#tot_discount").html(tot_discount);
	$("#tot_saleprice").html(tot_saleprice);
	$("#delivery_price").html(delivery_price);
}