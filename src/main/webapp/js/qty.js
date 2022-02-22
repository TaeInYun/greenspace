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