<html>
<head>
<script type="text/javascript">
function show_popup()
{
var p=window.createPopup()
var pbody=p.document.body
pbody.style.backgroundColor="red"
pbody.style.border="solid black 1px"
pbody.innerHTML="这是一个 pop-up！在 pop-up 外面点击，即可关闭它！"
p.show(150,150,200,50,document.body)
}
</script>
</head>

<body>
<button onclick="show_popup()">显示 pop-up！</button>
</body>

</html>
