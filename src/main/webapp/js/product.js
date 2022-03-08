// 위시리스트 상품삭제
function deleteWishList(noArr) {
	
	let re = confirm("해당 상품을 삭제하시겠습니까?");

	if(re == true){
		
		$.ajax({
			url: "/shop/deleteWishList",
			data: {data:noArr},
			success: function() {
				alert("해당 상품을 위시리스트에서 삭제하였습니다.");
				location.href="/shop/wishList";
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
	let addMsg = $("#addMsg").html(msg);
	addMsg.append( $("<a></a>").attr("href","./cart").html("장바구니로 가기") )
}
//위시리스트 추가 메세지
function insertWishMSG(msg){
	let addMsg = $("#addMsg").html(msg);
	addMsg.append( $("<a></a>").attr("href","./wishList").html("위시리스트로 가기") )
}

//카트 추가하기
function insertCart(isOption,cart_option,pro_price,pro_saleprice, pro_name, pro_no ) {
	// 옵션이 있는 상품
	if(isOption != 0){
		$.each( $("#optionList tr"), function(){
			let selectOption = $(this).find("td");
			let cart_option_detail = $(selectOption[0]).text();
			let option_price = $(selectOption[1]).text();
			let cart_qty = $($(this).find("#qty")).val();
			
			let totPrice = pro_price + Number(option_price)
			let totSalePrice = pro_saleprice + Number(option_price)
			
			let data = {
				cart_name: pro_name,
				cart_price:totPrice,
				cart_saleprice:totSalePrice,
				pro_no:pro_no,
				cart_option:cart_option,
				cart_option_detail:cart_option_detail,
				cart_qty:cart_qty
			};
			
			$.ajax({
				url:"isCart",
				data:data,
				success: function(cnt){
					if(cnt == 0){ //장바구니에 없는 상품
						$.ajax({
							url: "insertCart",
							data: data,
							success: function(msg){
								insertCartMSG(msg);
							}
						});//end insertCart ajax
					}else{
						insertCartMSG("이미 장바구니에 있는 상품입니다.");
					} 					
				}
			});//end isCart
		});//end each	
	}else{
		
		let cart_qty = $("#qty").val();
		
		let data = {
			cart_name: pro_name,
			cart_price:pro_price,
			cart_saleprice:pro_saleprice,
			pro_no:pro_no,
			cart_qty:cart_qty
		};
		
		$.ajax({
			url:"isCart",
			data:data,
			success: function(cnt){
				if(cnt == 0){ //장바구니에 없는 상품
					$.ajax({
						url: "insertCart",
						data: data,
						success: function(msg){
							insertCartMSG(msg);
						}
					});//end insertCart ajax
				}else{
					insertCartMSG("이미 장바구니에 있는 상품입니다.");
				} 					
			}
		});//end isCart	
	}
}


//위시리스트 추가하기
function insertWish(isOption,cart_option,pro_no ) {
	// 옵션이 있는 상품
	if(isOption != 0){
		$.each( $("#optionList tr"), function(){
			let selectOption = $(this).find("td");
			let cart_option_detail = $(selectOption[0]).text();
			
			
			let data = {
				pro_no:pro_no,
				cart_option:cart_option,
				cart_option_detail:cart_option_detail
			};
			
			$.ajax({
				url: "isWishList",
				data: data,
				success: function(cnt){
					if(cnt == 0){
						$.ajax({
							url: "insertWishList",
							data: data,
							success: function(msg){
								insertWishMSG(msg);
							}
						});//end insertWishList ajax
					}else{
						insertWishMSG("위시리스트에 존재하는 상품입니다.");
					}
				}
			});//end isWishList
			
		});//end each	
	}else{
		
		let data = {
			pro_no:pro_no
		};
		
		$.ajax({
			url: "isWishList",
			data: data,
			success: function(cnt){
				if(cnt == 0){
					$.ajax({
						url: "insertWishList",
						data: data,
						success: function(msg){
							insertWishMSG(msg);
						}
					});//end insertWishList ajax
				}else{
					alert("위시리스트에 존재하는 상품입니다.");
				}
			}
		});//end isWishList
	}
}
