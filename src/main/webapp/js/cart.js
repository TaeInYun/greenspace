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