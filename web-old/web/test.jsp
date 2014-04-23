
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Ajax upload demo</title>
    <!-- We will use version hosted by Google-->
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>--%>

	<!-- Required for jQuery dialog demo-->
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/ui-darkness/jquery-ui.css" type="text/css" media="all" />--%>

    <!-- AJAX Upload script itself doesn't have any dependencies-->
    <script type="text/javascript" src="/js/jquery/jquery132min.js"></script>
    <script type="text/javascript" src="/js/ajaxupload.js"></script>



	<script type="text/javascript">
	$(document).ready(function(){
        var serverUrl= 'http://172.16.100.137/servlet/fileupload';
		/* Example 1 */
		var button = $('#button1'), interval;

		new AjaxUpload(button, {
			action: serverUrl,
			name: 'myfile',
			onSubmit : function(file, ext){
				// change button text, when user selects file
				button.text('正在上传');
                if (ext && /^(jpg)$/.test(ext)){

                } else {
					// extension is not allowed
					alert("只允许上传.jpg类型的图片!");
					// cancel upload
					return false;
				}
				// If you want to allow uploading only 1 file at time,
				// you can disable upload button
				this.disable();

				// Uploding -> Uploading. -> Uploading...
				interval = window.setInterval(function(){
					var text = button.text();
					if (text.length < 13){
						button.text(text + '.');
					} else {
						button.text('正在上传');
					}
				}, 200);
			},

			onComplete: function(file, response){
				button.text('上传文件');
				window.clearInterval(interval);
                 var pics=$.trim($("#refundproductpics").val());
                 var start=response.indexOf(">")+1;
                 var end=response.lastIndexOf("<");
                 if(pics!=""){
                     pics+=";"+response.substring(start,end);
                 }else{
                     pics=response.substring(start,end);
                 }

                $("#refundproductpics").attr("value",pics);
				// enable upload button
                if(pics.split(";").length>=5){
                  button.disabled();
                }else{
				    this.enable();
                }

				// add file to the list
				$('<li></li>').appendTo('#example1 .files').text(file);
			}
		});
	});</script>
	</head>
<body>
<ul>
	<li id="example1" class="example">

		<div class="wrapper">
			<div id="button1" class="button">上传文件</div>
		</div>
        <input type="text" id="refundproductpics"/>
		<p>已经上传的文件:</p>
		<ol class="files"></ol>
	</li>
</ul>
<form action="/refund/picUpload/images.html" method="post" enctype="multipart/form-data">
    <input type="file" name="test"/>
    <input type="submit" value="上传"/>

</form>
</body>
</html>