/**
 * Price Query Check
 * 
 * Copyright (c) 2010 Shopin.net
 *
 */

//var jq = jQuery.noConflict();
jQuery(document).ready(function($) {

    //价格查询
    $("#priceQuery").click(function() {
        var sprice = $("#price-search input[name='startPrice']");
        var eprice = $("#price-search input[name='endPrice']");

        if (checkNum($(sprice).val())) {
            $(".errorInfo").html("<b>只能输入数字和小数点</b>");
            $(sprice).focus();
            return false;
        }

        if (checkNum($(eprice).val())) {
            $(".errorInfo").html("<b>只能输入数字和小数点</b>");
            $(eprice).focus();
            return false;
        }

        var queryLink = $("#queryParam").val().replace("startPrice", sprice.val());
        queryLink = queryLink.replace("endPrice", eprice.val());
        //alert(queryLink);
        window.location = queryLink;
    });

    //校验数字和小数点
    var checkNum = function(s) {
        reg = /[^\d.]/g;
        if (reg.test(s)) {
            return true;
        }
        return false;
    }
});