// 위시리스트 상품삭제
function deleteWishList() {
	let select = $("input[name=checkList]:checked");
	let noArr = new Array();
	
	$.each(select, function() {
		let no = $($(this).siblings()[0]).val();
		noArr.push(no);
	});
	
	let re = confirm("해당 상품을 삭제하시겠습니까?");
	if(re == true){
		$.ajax({
			url: "deleteWishList",
			data: {data:noArr},
			success: function() {
				alert("해당 상품을 위시리스트에서 삭제하였습니다.");
				location.href="wishList";
			}
		});
		
	}//end if
} 


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

function getProductInfo(member_no, pro_price,pro_saleprice, pro_name, pro_no ) {

	let cart_option = $("#pro_option_name > option:selected").text();
	let option_detail = $("#pro_option_detail_name > option:selected").text();
	let index = option_detail.indexOf("(");
	let cart_option_detail = option_detail.substr(0,index);
	let cart_qty = $("#qty").val();
	let option_code = $("#pro_option_name > option:selected").val();
	let option_detail_code = $("#pro_option_detail_name > option:selected").val();
	
	let option_price = $("#pro_option_detail_name > option:selected").val();
	
	//상품옵션이 아예없을경우
	if(cart_option == null){
		cart_option = "";
		cart_option_detail="";
	}
	
	if(cart_option == "선택" || option_detail == "선택"){
		alert("옵션을 선택해주세요");
		return
	}
	
	// 상품가격 + 옵션가격
	if(option_price != null && option_price!=""){
		pro_price += Number(option_price)
		pro_saleprice += Number(option_price)
	}
	
	let data = {
			cart_name: pro_name,
			cart_price:pro_price,
			cart_saleprice:pro_saleprice,
			pro_no:pro_no,
			cart_option:cart_option,
			cart_option_detail:cart_option_detail,
			cart_qty:cart_qty,
			member_no:member_no,
			option_code: option_code,
			option_detail_code:option_detail_code
	};
	
	return data;
}
