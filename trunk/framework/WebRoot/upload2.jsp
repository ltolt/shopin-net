<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
 <head>  
  <title> New Document </title>  
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>  
     
<script type="text/javascript">    
//全局变量  
var FileCount=0;//上传文件总数  
 //添加上传文件按钮  
 function addFile(obj)  
 {  
  var filePath=$(obj).prev().val();  
  var FireFoxFileName="";  
  //FireFox文件的路径需要特殊处理  
  if(window.navigator.userAgent.indexOf("Firefox")!=-1)  
  {  
     FireFoxFileName=filePath;  
     filePath=$(obj).prev()[0].files.item(0).getAsDataURL();  
  }  
  if(!checkFile(filePath,FireFoxFileName))  
  {  
    $(obj).prev().val("");  
    return;  
  }  
  if(filePath.length==0)  
  {  
    alert("请选择上传文件");  
   return false;  
  }  
   FileCount++;  
   //添加上传按钮  
   var html='<span>';  
       html+='<input id="f'+FileCount+'" name="'+FileCount+'" type="file"/> ';  
       html+='<input type="button" value="添加" onclick="addFile(this)"/>';  
       html+='</span>';  
   $("#fil").append(html);  
   //添加图片预览  
   html='<li>';  
   html+='<img id="img'+(FileCount-1)+'" src="'+filePath+'" width="100" height="100" style="cursor:pointer;" alt="暂无预览" />';  
   html+='<br/>';  
   html+='<a href="#" name="img'+(FileCount-1)+'" onclick="DelImg(this)">删除</a>';  
   html+='</li>';  
   $("#ImgList").append(html);  
 }  
 //删除上传文件（file以及img）  
 function DelImg(obj)  
 {  
     var ID=$(obj).attr("name");  
     ID=ID.substr(3,ID.length-3);  
     $("#f"+ID).parent().remove();  
     $(obj).parent().remove();  
     return false;  
 }  
  //检查上传文件是否重复,以及扩展名是否符合要求  
function checkFile(fileName,FireFoxFileName)  
{  
 var flag=true;  
 $("#ImgList").find(":img").each(function(){  
     if(fileName==$(this).attr("src"))  
     {  
        flag=false;  
        if(FireFoxFileName!='')  
        {  
         alert('上传文件中已经存在\''+FireFoxFileName+'\'!');  
        }  
        else  
        {  
         alert('上传文件中已经存在\''+fileName+'\'!');  
        }  
        return;  
     }  
 });  
 //文件类型判断  
 var str="jpg|jpeg|bmp|gif";  
 var fileExtName=fileName.substring(fileName.indexOf(".")+1);//获取上传文件扩展名  
 if(FireFoxFileName!='')//fireFox单独处理  
 {  
  fileExtName=FireFoxFileName.substring(FireFoxFileName.indexOf(".")+1);  
 }  
 //alert(fileExtName);  
 if(str.indexOf(fileExtName.toLowerCase())==-1)  
 {  
   alert("只允许上传格式为jpg，jpeg，bmp，gif的文件。");  
    flag=false;  
 }  
 return flag;  
}  
</script>     
<style type="text/css">     
  .fil  
  {     
    width:300px;  
  }  
  .fieldset_img  
  {  
     border:1px solid blue;  
     width:550px;  
     height:180px;  
     text-align:left;  
  
  }  
  .fieldset_img img  
  {  
     border:1px solid #ccc;  
     padding:2px;  
     margin-left:5px;  
  }  
  #ImgList li   
  {  
     text-align:center;  
     list-style:none;  
     display:block;  
     float:left;  
     margin-left:5px;  
  }  
</style>     
</head>     
<body>     
<p>上传预览图片:<br>  
<div id="fil" class="fil">  
  <span>  
   <input id="f0" name="f0" type="file"/>  
   <input type="button" value="添加" onclick="addFile(this)"/>  
  </span>  
</div>   
</p>  
<div id="ok">  
<fieldset class="fieldset_img">  
<legend>图片展示</legend>  
<ul id="ImgList">  
<!--li>  
<img id="img1" width="100" height="100" style="cursor:pointer;">  
<br/>  
<a href="#" name="img1" onclick="DelImg(this)">删除</a>  
</li-->  
</ul>  
</fieldset>  
</div>  
     
 </body>  
</html> 