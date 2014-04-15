var setAmount={
min:1,
max:1000,
reg:function(x){
		return new RegExp("^[1-9]\\d*$").test(x);
},
amount:function(obj,mode){
		var x=$(obj).val();
		if (this.reg(x)){
				if (mode){
						x++;
				}else{
						x--;
				}
		}else{
				alert("请输入正确的数量！");
				$(obj).val(1);
				$(obj).focus();
		}
		return x;                        
},
reduce:function(obj){
		var x=this.amount(obj,false);
		if (x>=this.min){
				$(obj).val(x);
		}else{
				//alert("商品数量最少为"+this.min);
				$(obj).prev().attr("disabled",false);
				$(obj).val(1);
				$(obj).focus();
		}
},
add2:function(obj,store){
		var x=this.amount(obj,true);
		if (x<=store){
				$(obj).val(x);
		}else{
//				alert("商品数量最多为"+store);
				$(obj).next().attr("disabled",false);
				$(obj).val(store);
				$(obj).focus();
		}
},
modify2:function(obj,store){
		var x=$(obj).val();
		if (x<this.min||!this.reg(x)){
				alert("请输入正确的数量！");
				$(obj).val(1);
				$(obj).focus();
		}
		if(x>store){
	//		alert("商品数量最多为"+store);
			$(obj).val(store);
			$(obj).focus();
		}
},

add:function(obj){
		var x=this.amount(obj,true);
		if (x<=this.max){
				$(obj).val(x);
		}else{
				alert("商品数量最多为"+this.max);
				$(obj).val(1000);
				$(obj).focus();
		}
},
modify:function(obj){
		var x=$(obj).val();
		if (x<this.min||x>this.max||!this.reg(x)){
				alert("请输入正确的数量！");
				$(obj).val(1);
				$(obj).focus();
		}
},
validate2:function(obj){
	var x=$(obj).val();
	if(x==this.min){
		$(obj).prev().attr("disabled",false);
	}else{
		var flag=$(obj).prev().attr("disabled");
		if(flag==false){
			$(obj).prev().attr("disabled",true);
		}
	}
	if(x==this.max){
		$(obj).next().attr("disabled",false);
	}else{
		var flag = $(obj).next().attr("disabled");
		if(flag==false){
			$(obj).next().attr("disabled",true);
		}
	}
}
}
