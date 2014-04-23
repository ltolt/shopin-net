jQuery.extend({
    checkRepetition:function(pLen,str) {
            var res = ""
            for ( i=0; i<str.length ; i++ ) {
                var repeated=true;
                for (j=0;j < pLen && (j+i+pLen) < str.length;j++)
                    repeated=repeated && (str.charAt(j+i)==str.charAt(j+i+pLen))
                if (j<pLen) repeated=false;
                if (repeated) {
                    i+=pLen-1
                    repeated=false;
                }
                else {
                    res+=str.charAt(i);
                }
            }
            return res;
     },
    strength:function(password){
        var score = 0;
        var html="";
        var step1='<input type="text" style="width:50px;background:red;border:0" disabled="true"/>';
        var step2='<input type="text" style="background:blue;border:0" disabled="true"/>';
        var step3='<input type="text" style="background:green;border:0" disabled="true"/>';
        if(password.length<=5){
           score += password.length * 10;
        }else {
           score += 5 * 10+(password.length-5)*5; 
        }

        score += ( jQuery.checkRepetition(1,password).length - password.length ) * 1;
        score += ( jQuery.checkRepetition(2,password).length - password.length ) * 1;
        score += ( jQuery.checkRepetition(3,password).length - password.length ) * 1;
        score += ( jQuery.checkRepetition(4,password).length - password.length ) * 1;
        if (password.match(/(.*[0-9].*[0-9].*[0-9])/))  score += 5 ;
        if (password.match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/)) score += 5;
        if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  score += 5;
        if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  score += 10;
        if (password.match(/([!,@,#,$,%,^,&,*,?,_,~])/) && password.match(/([0-9])/))  score += 10;
        if (password.match(/([!,@,#,$,%,^,&,*,?,_,~])/) && password.match(/([a-zA-Z])/))  score += 10;
        if (password.match(/^\w+$/) || password.match(/^\d+$/) )  score -= 10;
        if ( score < 0 )  score = 0;
        if ( score > 100 )  score = 100;
        if(password.length<6&&score>50){
            score=50;
        }
        if(score<=50){
            html='<input type="text" style="background:red;border:0;width:'+score+'px;" disabled="true"/>';
            jQuery(step1).css("width",""+score+"px").html();
        }
        if(score>50&&score<=75){
            html='<input type="text" style="background:red;border:0;width:50px;" disabled="true"/>';
            html+='<input type="text" style="background:blue;border:0;width:'+(score-50)*2+'px;" disabled="true"/>';
        }
        if(score>75){
            html='<input type="text" style="background:red;border:0;width:50px;" disabled="true"/>';
            html+='<input type="text" style="background:blue;border:0;width:50px;" disabled="true"/>';
            html+='<input type="text" style="background:green;border:0;width:'+(score-75)*2+'px;" disabled="true"/>';
        }
        return html;
    }

});
