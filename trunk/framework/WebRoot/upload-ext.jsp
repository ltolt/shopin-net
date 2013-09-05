<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Uploads</title>
     <link rel="stylesheet" type="text/css" href="http://localhost:86/resources/css/ext-all.css" />
    <!-- ExtJS -->
    <script type="text/javascript" src="http://localhost:86/ext-all.js"></script>
    <!-- Shared -->
    <link rel="stylesheet" type="text/css" href="http://localhost:86/examples/shared/example.css" />

     <!-- GC -->

    <!-- Example -->
    <script type="text/javascript" src="file-upload.js"></script>
	
    <style type="text/css">
        .upload-icon {
            background: url('http://localhost:86/examples/shared/icons/fam/image_add.png') no-repeat 0 0 !important;
        }
        #fi-button-msg {
            border: 2px solid #ccc;
            padding: 5px 10px;
            background: #eee;
            margin: 5px;
            float: left;
        }
        .x-debug .x-form-file-wrap .x-form-file-input {
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0.6);
            opacity: 0.6;
            background-color: gray;
        }
    </style>

</head>
<body>
	<h1>File Upload Field</h1>
	<p>This example demonstrates use of Ext.form.field.File, a file upload field with custom rendering.</p>
    <p>The js is not minified so it is readable. See <a href="file-upload.js">file-upload.js</a>.</p>
	<h2>Basic File Field</h2>
    <p>
        A typical file upload field with Ext style. Direct editing of the text field cannot be done in a
        consistent, cross-browser way, so it is always read-only. The file path reported by the <code>getValue</code>
        method will
    </p>
    <div id="fi-basic"></div>
    <div id="fi-basic-btn"></div>
	 <img id="img_prev" src="#" alt="your image" />

</body>
</html>
