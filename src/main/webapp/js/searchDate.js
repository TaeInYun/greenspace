function searchByDate(data) {
	
	$.ajax({
		url: "/mypage/findOrderListByDate",
		data:data,
		success:function(po){
			$("tbody").empty();
			
			$.each(po.ord, function(){
				let a =	$("<a></a>").attr("href", "/shop/detailProduct?no=" + this.pro_no).html($("<img></img>").attr("src", "/upload/"+ this.pro_thumbnail));
				let ul = $("<ul></ul>");							

				let product = $("<li></li>").append( $("<a></a>").attr("href", "/shop/detailProduct?no=" + this.pro_no).html(this.pro_name));
				ul.append(product);
				
				if(this.option_name != null){
					let option = $("<li></li>").html( "(" + this.option_name + ")" + this.option_detail);
					ul.append(option);
				}
				
				let proInfo = $("<td></td>").append(  $("<div></div>").append(a, ul) );
				let ordDate = $("<td></td>").html(this.day);
				let ordId = $("<td></td>").append($("<a></a>").html(this.id).attr("href", "/shop/detailOrderList?id="+this.id+"&&day=" + this.day))
				let proPrice = $("<td></td>").html(this.pro_price + "원 <br>(" + this.pro_qty + "개)")
				let status = $("<td></td>").html(this.status).append($("<input></input>").attr("type","button").attr("value","후기 작성"));
				
				let tr = $("<tr></tr>").append(proInfo, ordDate, ordId, proPrice, status);
				
				$("tbody").append(tr);
				
				//$("#paging > a").attr("id", po.period);
			});//end ${list}
			$("#paging").html("")
			for(let i = 1; i <= po.totalPage; i++){
				let a = $("<a></a>").attr("href","#").attr("id",po.period).html(i);
				$("#paging").append(a, "&nbsp;&nbsp;");
			}
		}
	});
}