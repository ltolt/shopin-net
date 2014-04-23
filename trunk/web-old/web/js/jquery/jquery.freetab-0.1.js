/**
 * Free Tab plugin for jQuery
 *
 * v0.1
 *
 * Copyright (c) 2009 Peter Wei
 *
 */

/**
 * 参数配置
 *
 * nav  string    tab导航
 * content     string   tab内容
 * navType  string    导航类型,默认为每条li为一个tab,也可以设成'a'
 * defaultTab  integer    设置当前tab,默认为0
 * width         integer  未用
 * height        integer  未用
 * cssClass      string   name of the CSS class, defaults to 'freetab'
 * selectType     string   是通过id还是class方式查询nav和content。
 * event     integer   鼠标事件，0-onclick;1-onmouseover
 */

(function($) {
    $.fn.freetab = function(options) {

        var defaults = {
            nav: 'tab_nav',
            content: 'tab_content',
            navType: 'li',
            defaultTab: 0,
            width: 468,
            height: 120,
            cssClass: 'freetab',
            selectType: "class",
            event: 0
        };

        var options = $.extend(defaults, options);

        // ----------------------------------------
        // freetab objects and variables
        // ----------------------------------------

        var target = this;
        var selectSymbol = '.';
        //得到导航tab
        var nav = this.find(selectSymbol + options.nav);

        //得到tab内容
        var content = this.find(selectSymbol + options.content);


        var curTab = options.defaultTab;

        var navItems = nav.find(options.navType).not($(".except"));


        var items = this.find(".tab_item");


        var startFreetab = function() {


            //初始化tab
            //设置当前tab样式
            navItems.eq(curTab).addClass("hover");

            //隐藏所有tab内容
            items.not(curTab).hide();
            //打开当前tab内容
            items.eq(curTab).show();

            //给item1指定不同样式
            //items.eq(curTab).find("ul").addClass("firstItemStyle").end().find("li a").addClass("firstItemStyle");

            if (options.event == 0) {
                //切换tab时-onclick事件
                navItems.click(changeTab);
            } else if (options.event == 1) {
                //切换tab时-onmouseover事件
                navItems.mouseover(changeTab);
            }

        };


        //切换tab
        var changeTab = function(i) {
            //得到当前索引
            var curIndex = navItems.index(this);
            //如果点击不等于当前tab
            //if (curTab != curIndex) {
                //切换tab样式
                navItems.not(curIndex).removeClass();
                $(this).addClass("hover");

                curTab = curIndex;
                //切换tab内容
                items.not(curTab).hide();
                //打开当前tab内容
                items.eq(curTab).show();
                //alert("click current");
            //}

        }

        // ----------------------------------------
        // start the freetab!
        // ----------------------------------------

        startFreetab();
    };
})(jQuery);