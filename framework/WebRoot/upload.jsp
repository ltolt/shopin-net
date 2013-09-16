<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>using commons Upload to upload file </title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script src="./jquery.js"></script>
<script src="./ajaxfileupload.js"></script>
<script type="text/javascript">

function readURL(input) {
	if (input.files && input.files[0]) {
	var reader = new FileReader();

	reader.onload = function (e) {
	$('#img_prev')
	.attr('src', e.target.result)
	.width(150)
	.height(200);
	};

	reader.readAsDataURL(input.files[0]);
	}
	}


  function ShowImage(path){

	　　document.all.divShow.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = path;

	　　}
  function test(){
	  document.all.showimg.src=document.all.file.value;
  }
  
   function upload(){
	   $.ajaxFileUpload({
			  url:'http://localhost/frame/action',//服务器端程序
			  secureuri:false,
			  fileElementId:'up',//input框的ID
			  //dataType: 'json',//返回数据类型
			  dataType: 'json',//返回值类型 一般设置为json
               /*  jsonp: 'jsoncallback',
                jsonpCallback:'success_jsonpCallback',
                function success_jsonpCallback(data) {
                    alert("1");
                }, */
			  beforeSend:function(){//上传前需要处理的工作，如显示Loading...
			  },
			  success: function(data,success){//上传成功
				  alert('success');
			  alert(data);
				  /* if(typeof(data.error) != 'undefined')
                  {
                      if(data.error != '')
                      {
                          alert(data.error);
                      }else
                      {
                          alert(data.msg);
                      }
                  } */
			     
			  },
			  error: function (data, status, e)
              {
                  alert(e);
              }
			});


   }	
  
  

</script>

</head>
<style>
* { font-family: "宋体"; font-size: 14px }
</style>
<body>
<p align="center"> 请您选择需要上传的文件</p>
<form id="form1" name="form1" method="post" action="http://172.16.103.147:7081/oms_core/refundApply/fileuploadLocal" enctype="multipart/form-data">
 <table border="0" align="center">
  <tr>
   <td>上传人：</td>
   <td>
    <input name="name" type="text" id="name" size="20" ></td>
  </tr>   
  <tr>
   <td>上传文件：</td>
   <td><input id="up" name="file" type="file" size="20" onchange="readURL(this);" ></td>
  <td><input name="btnUpload" value="upload" type="button" size="20" onclick="upload(this);"></td>
  </tr>    
  <tr>   
   <td></td><td>
    <input type="submit" name="submit" value="提交" >
    <input type="reset" name="reset" value="重置" >
   </td>
  </tr>
 </table>
</form>
<img id="img_prev" src="#" alt="your image" />
</body>
</html>