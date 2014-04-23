/*
 *扩展jQuery本类的方法,弹出消息对话框
 * @param ele  弹出层的位置参考元素
 * @param id   弹出层的id
 * @param htmlcode   弹出层的消息的html字符串
 * @param width 弹出层宽度
 * @param height  弹出层高度
 * @param bgcolor  弹出层背景色
 * @param msgcolor  消息信息颜色
 */
jQuery.extend({
    popdialog:function(ele,id,htmlcode,bgcolor,msgcolor){
        bgcolor=bgcolor||'#E8F5FE';
        msgcolor=msgcolor||'#FF4800';
        var X = $(ele).offset().top;
        var Y = $(ele).offset().left;
        var div=$("#"+id);
        if(div.length===0){
              $("body").append("<div id='"+id+"' align='center'><div id='"+id+"_msg' style='color:"+msgcolor+"'></div></div>");
        }
        div=$("#"+id);
        div.css({border: '1px solid #A9C9E2',
                 position:'absolute',
                 backgroundColor:bgcolor,
                 top:X,
                 left:Y});
        $('#'+id+"_msg").html(htmlcode);
        div.css("padding","5px");
        $('#'+id+"_close").css("width","40px").attr("align","center")
                          .bind('click',function(){$("#"+id).fadeTo(500,0.99).remove();});
        div.show("fast").fadeTo(1000,0.99).fadeOut("fast");
     },
    poptip:function(ele,id,htmlcode,bgcolor,msgcolor){
        bgcolor=bgcolor||'#E8F5FE';
        msgcolor=msgcolor||'#FF4800';
        var X = $(ele).offset().top;
        var Y = $(ele).offset().left+$(ele).width();
        var div=$("#"+id);
        if(div.length===0){
              $("body").append("<div id='"+id+"' align='left'><div id='"+id+"_msg' style='color:"+msgcolor+"'></div></div>");
        }
        div=$("#"+id);
        div.css({
                   border: '1px solid #A9C9E2',
                   position:'absolute',
                   backgroundColor:bgcolor,
                   top:X,
                   left:Y
                  });
        $('#'+id+"_msg").html(htmlcode).css({margin:"5px 5px 5px 5px"});
        div.show("fast").fadeTo(2000,0.99).fadeOut("fast");
     },
     popalert:function(ele,id,htmlcode,fun,bgcolor,msgcolor){
        bgcolor=bgcolor||'#E8F5FE';
        msgcolor=msgcolor||'#FF4800';
        var X = $(ele).offset().top;
        var Y = $(ele).offset().left;
        var div=$("#"+id);
        if(div.length===0){
              var code="<div id='"+id+"' align='center'><div id='"+id+"_msg' style='color:"+msgcolor+"'></div>"
                      +"<div id='"+id+"_button'><span id='"+id+"_okay'>确定</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span id='"+id+"_cancel'>取消</span></div></div>"
              $("body").append(code);
        }
        div=$("#"+id);
        div.css({border: '1px solid #A9C9E2',
                 position:'absolute',
                 backgroundColor:bgcolor,
                 top:X,
                 left:Y});
        $('#'+id+"_msg").html(htmlcode);
        div.css("padding","5px");
        $('#'+id+"_okay").css({'width':'40px','color':'blue','cursor':'pointer'})
                .bind('click',function(){$("#"+id).remove();fun(ele);});
        $('#'+id+"_cancel").css({'width':'40px','color':'blue','cursor':'pointer'})
                .bind('click',function(){$("#"+id).remove();});
        div.show("fast");
     }
});
