var arrChk=$("input[name='ck']");
function checkEvent(){
	if(arrChk.attr("checked")==true){
		checkAll();
		$(this).next().html("反选");
	}else{
		checkAllNo()
		$(this).next().html("全选");
	};
};
//全选
function checkAll(){
	arrChk.attr("checked",true);
};
//反选
function checkAllNo(){
	arrChk.attr("checked",false);
}
//有一项未选中 则取消全选状态
$(".pd-cart input[name='ck']").click(function(){
	if($(".pd-cart input[name='ck']").length > 0){
		arrChk.eq(0).attr("checked",false)
	}
});