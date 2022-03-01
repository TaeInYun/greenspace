function minus(b) {
			
			let qty = $(b).siblings();
			let value = Number( $( qty ).val() );
						
 			if(value == 1){
				$(qty).val(1);
			}else{
				$(qty).val(value-1);
			} 
}

function plus(b){
	let qty = $(b).siblings()[1];
	let value = Number( $( qty ).val() );
	$(qty).val(value+1);
	
}

function updateQty(cart_qty, no){
	let data = {
		cart_qty:cart_qty,
		no:no
	}
	
	$.ajax({
		url: "updateQty",
		data:  data,
		success: function(msg){
			alert("해당 상품의 수량이 "+msg + "되었습니다.");
			location.href="/shop/cart";
		}
	});//end ajax 
}