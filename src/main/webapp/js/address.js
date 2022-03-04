function chooseNewAddr(){
	$("#receiverInfo input").val("");
	$("#receiverInfo input").attr("readonly", false);
	$("#receiverNo").attr("name", "receiver_no")
}

function chooseBasicAddr(){
	$("#receiverInfo input").attr("readonly", true);
	$("#receiverNo").attr("name", "addr_no");
}