function chooseNewAddr(){
	$("#receiverInfo input").val("");
	$("#receiverInfo input").attr("readonly", false);
	$("#receiverNo").attr("name", "receiver_no").val(0);
	$("input[name=addr_msg]").attr("type", "text").attr("placeholder","배송 요청메세지를 입력해주세요");
}

function chooseBasicAddr(){
	$("#receiverInfo input").attr("readonly", true);
	$("#receiverNo").attr("name", "addr_no");
	$("input[name=addr_msg]").attr("type", "hidden");
}