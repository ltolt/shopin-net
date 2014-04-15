function innerAll(cateList){
	var innerHTML = '<div class="subcate"><ul>';
	for(var key in cateList){
		innerHTML  += '<li><a href='+key+' title='+cateList[key]+'>'+cateList[key]+'</a></li>';
	}
	innerHTML  += '</ul></div>';
	return innerHTML;
}

var running = false;//是否在运行中
var delay = 200;
var allCateTimer = null;

//当菜单html刚载入完成开始监控菜单是否展示
$('div#categorys:not(.homenav)').hover(
    function(){
        var $this = this;
        allCateTimer = setTimeout(function() { 
            $($this).find('div.allcate > a').addClass('hover');
            $($this).children('ul').removeClass('undis');
        }, delay);
    },
    function(){
        var $this = this
        allCateTimer = setTimeout(function() {
            $($this).find('div.allcate > a').removeClass('hover');
            $($this).children('ul').addClass('undis');
            //兼容IE6显示所有select 元素
            $("select.menuVisible").each(function() {
              if ($(this).css("visibility") == 'hidden') {
                $(this).removeClass('menuVisible').css('visibility', 'visible');
              }
            });
        }, delay);
    }
);

$('div#categorys > ul > li').hover(
    function(ev){
        var $this = this;
        allCateTimer = setTimeout(function() {
            var bottomHeight = document.documentElement.clientHeight - ev.clientY;
            
            if (bottomHeight <= 250) {
                $($this).addClass('over').find('div.submenubox').addClass('submenuboxBottom').removeClass('undis');
            } else {
                $($this).addClass('over').find('div.submenubox').removeClass('submenuboxBottom').removeClass('undis');
            }
            //兼容IE6隐藏所有select 元素
            $("select").each(function() {
              if ($(this).css('visibility') != 'hidden') {
                $(this).addClass('menuVisible').css('visibility', 'hidden');
              }
            });
            if ($($this).find("div.subcate").size()<= 0) {
                async_topMenu($this);
            }
        }, delay);
    },
    function(){
        var $this = this;
        if (allCateTimer){
					clearTimeout(allCateTimer);
        }
        allCateTimer = setTimeout(function() { 
					$($this).removeClass('over').find('div.submenubox').addClass('undis');}, delay);
    }
);
