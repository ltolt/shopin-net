function popWin(title, msg, w, h){ 
	var objSelect = document.getElementsByTagName("select"); //捕捉所有select标签
	for(var j=0;j<objSelect.length;j++){
		//设为不显示，再进行下面操作
		objSelect[j].style.display="none";
	} 
	
	var iWidth = document.documentElement.clientWidth;
	var iHeight = document.documentElement.clientHeight;
	
	var bgObj = document.createElement("div");
	bgObj.id = "BgDiv";
	bgObj.style.width = iWidth+"px";
	bgObj.style.height = Math.max(document.body.clientHeight, iHeight)+"px";
	document.body.appendChild(bgObj);
	
	var msgObj=document.createElement("div"); 
	msgObj.id = "MsgDiv";
	msgObj.style.top = (iHeight-h)/2+"px";
	msgObj.style.left = (iWidth-w)/2+"px";
	msgObj.style.width = w+"px";
	msgObj.style.height = h+"px";
	document.body.appendChild(msgObj);

	var table = document.createElement("table"); 
	msgObj.appendChild(table); 
	table.id = "MsgDivTable";
	var tr = table.insertRow(-1); 
	var titleBar = tr.insertCell(-1);
	tr.id = "MsgTitle";
	titleBar.id = "MsgDivTitle";
 	titleBar.innerHTML = title;
	
	var moveX = 0;
	var moveY = 0;
	var moveTop = 0;
	var moveLeft = 0;
	var moveable = false;
	var docMouseMoveEvent = document.onmousemove;
	var docMouseUpEvent = document.onmouseup;
	titleBar.onmousedown = function() {
		var evt = getEvent();
		moveable = true;
		moveX = evt.clientX;
		moveY = evt.clientY;
		moveTop = parseInt(msgObj.style.top);
		moveLeft = parseInt(msgObj.style.left);
		document.onmousemove = function() {
			if (moveable) {
				var evt = getEvent();
				var x = moveLeft + evt.clientX - moveX;
				var y = moveTop + evt.clientY - moveY;
				if ( x > 0 &&( x + w < iWidth) && y > 0 && (y + h < iHeight) ) {
					msgObj.style.left = x + "px";
					msgObj.style.top = y + "px";
				}
			}
		};
	
		document.onmouseup = function () {
			if (moveable) {
				document.onmousemove = docMouseMoveEvent;
				document.onmouseup = docMouseUpEvent;
				moveable = false;
				moveX = 0;
				moveY = 0;
				moveTop = 0;
				moveLeft = 0;
			}
		};
	}

	var closeBtn = tr.insertCell(-1); 
	closeBtn.id = "MsgDivClose";
  	closeBtn.innerHTML = "<span title='关闭'>×</span>";
	closeBtn.onclick = function(){ 
		for(var j=0;j<objSelect.length;j++){
			//再给select显出来
			objSelect[j].style.display="";
		} 
		document.body.removeChild(bgObj); 
		document.body.removeChild(msgObj); 
	}

	var msgBox = table.insertRow(-1).insertCell(-1); 
	msgBox.id = "MsgBox"; 
	msgBox.colSpan = "2"; 
	msgBox.innerHTML = msg; 	

	// 获得事件Event对象，用于兼容IE和FireFox
	function getEvent() {
		return window.event || arguments.callee.caller.arguments[0];
	}
}

function MsgDivClose(){
	$("#MsgDivClose").trigger("click");
}