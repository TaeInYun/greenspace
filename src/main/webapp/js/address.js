function kakaopost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // http://postcode.map.daum.net/guide 에서 예제를 활용하여 커스텀
			$("input[name=addr_postal]").val(data.zonecode);
			$("input[name=addr_road]").val(data.address);
			$("input[name=addr_detail]").val(data.buildingName);
        }
    }).open();
 }

function chooseNewAddr(){
	$("#receiverInfo input").val("");
	$("#receiverInfo input").attr("readonly", false);
	$("#receiverNo").attr("name", "receiver_no").val(0);
	$("input[name=addr_postal]").attr("style", "width:57%; display:inline;margin:0px;");
	$("input[name=addr_msg]").attr("type", "text").attr("placeholder","배송 요청메세지를 입력해주세요");
	$("input[name=kakao-search]").attr("type", "button").attr("style","width:20%;display:inline;margin:0px 5px;").val("검색");
	
}
function chooseBasicAddr(){
	$("#receiverInfo input").attr("readonly", true);
	$("#receiverNo").attr("name", "addr_no");
	$("input[name=addr_msg]").attr("type", "hidden");
	$("input[name=addr_postal]").attr("style", "width:80%; display:block; margin:0px;");
	$("input[name=kakao-search]").attr("type", "hidden")
}