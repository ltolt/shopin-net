$(function(){
	$(".mousemove li").hover(function(){
		$(this).addClass("over");
		},function(){
		$(this).removeClass("over");
	});
});
/*点击计数*/
if(!localStorage.countAll){
                                                                                                
    localStorage.countAll = 0;
}
document.getElementById('countspan').innerHTML = localStorage.countAll;
function countNumber(){
    localStorage.countAll++;
    document.getElementById('countspan').innerHTML = localStorage.countAll;
}