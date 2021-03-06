function searchByDate(data) {
	
	$.ajax({
		url: "/mypage/findOrderListByDate",
		data:data,
		success:function(po){
			$("tbody").empty();
			
			$.each(po.ord, function(){
				let a =	$("<a></a>").attr("href", "/shop/detailProduct?no=" + this.pro_no).html($("<img></img>").attr("src", "/upload/"+ this.pro_thumbnail));
				let div = $("<div></div>").attr("class","product_table-productInfo");							

				let product = $("<div></div>").append( $("<a></a>").attr("href", "/shop/detailProduct?no=" + this.pro_no).html(this.pro_name));
				div.append(product);
				
				if(this.option_name != null){
					let option = $("<div></div>").html( "(" + this.option_name + ")" + this.option_detail);
					div.append(option);
				}
				
				let proInfo = $("<td></td>").append(  $("<div></div>").append(a, div) );
				let ordDate = $("<td></td>").html(this.day);
				let ordId = $("<td></td>").append($("<a></a>").html(this.id).attr("href", "/shop/detailOrderList?id="+this.id+"&&day=" + this.day))
				let proPrice = $("<td></td>").html(this.pro_price + "원 (" + this.pro_qty + "개)")
				let status = $("<td></td>").html(this.status).append($("<input></input>").attr("type","button").attr("value","후기 작성"));
				
				let tr = $("<tr></tr>").append(proInfo, ordDate, ordId, proPrice, status);
				
				$("tbody").append(tr);
				
				//$("#paging > a").attr("id", po.period);
			});//end ${list}
			$("#paging").html("")
			let ul = $("<ul></ul>")
			
			for(let i = 1; i <= po.totalPage; i++){
				let a = $("<a></a>").attr("href","#").attr("id",po.period).html(i);
				$(ul).append($("<li></li>").append(a));
			}
			
			$("#paging").html(ul);
		}
	});
}