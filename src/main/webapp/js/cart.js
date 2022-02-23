// 전체체크에 관한 기능 추가
function checkedAll() {
	if( $("#checkedAll").is(":checked") ){
		$("input[name=checkList]").prop("checked", true);
	}else{
		$("input[name=checkList]").prop("checked", false);
	}
}// 전체체크 함수

// 장바구니 상품삭제
function deleteCart(noArr) {
	let re = confirm("해당 상품을 삭제하시겠습니까?");
	if(re == true){
		$.ajax({
			url: "deleteCart",
			data: {data:noArr},
			success: function() {
				alert("해당 상품을 장바구니에서 삭제하였습니다.");
				location.href="cart";
			}
		});
		
	}//end if
} 

//장바구니 추가 메세지
function insertCartMSG(msg){
	let span = $("<span></span>").attr("class","animate");
	span.html(msg);
	span.append( $("<a></a>").attr("href","./cart").html("장바구니로 가기") )
	$("#btns").append(span);
}

// 체크에 따라 주문정보의 가격표시
function showOrderPriceInfo(){
	let select = $("input[name=checkList]:checked");
	let tot_price = 0;
	let tot_saleprice = 0;
	let tot_discount = 0;
	let delivery_price = 0;
	
	$.each(select, function() {
		tot_price += Number( $($(this).siblings()[0]).val() );
		tot_discount += Number( $($(this).siblings()[3]).val() );
		tot_saleprice += Number( $($(this).siblings()[1]).val() );
	});
	
	
	if( tot_saleprice < 50000){
		delivery_price = 2500;
	}
	
	$("#tot_price").html(tot_price);
	$("#tot_discount").html(tot_discount);
	$("#tot_saleprice").html(tot_saleprice);
	$("#delivery_price").html(delivery_price);
}

