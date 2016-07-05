/* 如果其中有一个函数出错了，这个JS文件就不能被引用了。*/
/**
 * JS报修函数
 * author:蒋新宇 2015.12.10 
 */
//------------------------------------------------------------------>
// 输入框获得焦点时，显示提示内容
function showDesc(obj) {
	var id = obj.name;
	document.getElementById(id).style.display = "inline";
}
//判断选择类型
function checkStyle() {
	var s = document.getElementById("style").value;
	if (s == "null") {
		document.getElementById("stylePrompt").innerHTML = "请选择您要报修的类型!";
		return false;
	} else {
		document.getElementById("stylePrompt").innerHTML = "";
		return true;
	}
}

// 判断报修人名字格式
function checkUsername() {
	var username = document.getElementById("personName").value;
	if (username == "") {
		document.getElementById("namePrompt").innerHTML = "输入不能为空!";
		return false;
	} else if (!isName(username)) { // 调用下面判断函数
		document.getElementById("namePrompt").innerHTML = "请您输入正确的姓名格式!";
		return false;
	} else if (username.length > 10) // 判断用户名的长度
	{
		document.getElementById("namePrompt").innerHTML = "您输入的姓名过长!";
		return false;
	} else {
		document.getElementById("namePrompt").innerHTML = "";
		return true;
	}
}
function isName(obj) { // 判断用户名是否用汉字输入
	var hanzi = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
	var bool = 0;
	for (var i = 0; i < obj.length; i++) {
		if (!hanzi.test(obj[i])) {
			bool++;
			break;
		}
	}
	if (bool == 0) {
		return true;
	} else {
		return false;
	}
}

// 报修地址只是简单的判断是否为空
function checkLocation() {
	var ad = document.getElementById("address").value;
	if (ad == "") {
		document.getElementById("addressPrompt").innerHTML = "请输入地址!以便维修人员更好的上门服务.";
		return false;
	} else {
		document.getElementById("addressPrompt").innerHTML = "";
		return true;
	}
}

// 判断报修人联系方式
function checkPhoneNumber() {
	var phone = document.getElementById("phoneNumber").value;
	// 判断是否是手机号码格式
	var mob = /^1\d{10}$/;
	// 判断是否是电话格式
	var ph = /^0\d{2,3}-?\d{7,8}$/;
	if (!mob.test(phone) && !ph.test(phone)) {
		document.getElementById("phonePrompt").innerHTML = "请您输入正确的联系方式!";
		return false;
	} else {
		document.getElementById("phonePrompt").innerHTML = "";
		return true;
	}
}
//------------------------------------------------------------------>
// 考虑浏览器兼容的提示关闭本页面
function wClose() {
	if (confirm("您确定要关闭本页吗？")) {
		if (navigator.userAgent.indexOf("MSIE") > 0) {
			if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
				window.opener = null;
				window.close();
			} else {
				open(location, '_self').close();
			}
		} else if (navigator.userAgent.indexOf("Firefox") > 0) {
			window.location.href = 'about:blank ';
		}else if(navigator.userAgent.indexOf("Chrome") > 0){
			open(location, '_self').close();
		}else {
			window.opener = null;
			window.open('', '_self', '');
			window.close();
		}
	}
}

// 链接按钮函数
function jsLink(url){
	var link = document.getElementById("link").value;
	link = "http://" + window.location.host + url;
	document.getElementById("link").value = link ; 
	alert("生成链接成功，请点击右上复制按钮，进行链接复制。然后使用快捷键Ctrl+V可以进行粘贴！注意:要点击两次.");
}

//复制按钮函数
function jsCopy(){
	var clip = new ZeroClipboard(document.getElementById("btn_copy")); 
	alert("请再点击一次,才能复制成功!然后使用快捷键Ctrl+V在地址栏进行粘贴！");
}

/*//动态显示提示信息
this.vtip = function() {
	this.xOffset = -10;
	this.yOffset = 10;
	$(".vtip").unbind().hover(function(a) {
		this.t = this.title;
		this.title = "";
		this.top = (a.pageY + yOffset);
		this.left = (a.pageX + xOffset);
		//在这里设置标签和id
		$("body").append('<button id="btn_link">' + this.t + "</button>");
		$("body").append('<button id="btn_copy">' + this.t + "</button>");
		$("body").append('<button id="btn_cancel">' + this.t + "</button>");
		$("p#vtip #vtipArrow").attr("url", "./vtip_arrow.png");
		$("p#vtip").css("top", this.top + "px").css("left", this.left + "px").fadeIn("slow")
	}, function() {
		this.title = this.t;
		$("p#vtip").fadeOut("slow").remove()
	}).mousemove(function(a) {
		this.top = (a.pageY + yOffset);
		this.left = (a.pageX + xOffset);
		$("p#vtip").css("top", this.top + "px").css("left", this.left + "px")
	})
};
$(document).ready(function(a) {
	vtip();
});*/

//------------------------------------------------------------------>
// 接受按钮函数
function acceptRequest(state,delFlag) {
	if (delFlag == "1") {
		var c = document.getElementById("btn_finish");
		c.value = "已取消";
		document.getElementById("btn_finish").value = c.value;
		document.getElementById("btn_finish").disabled = true;
		c.style.background = "#C4C4C4";
		var c1 = document.getElementById("btn_accept");
		c1.value = "已取消";
		document.getElementById("btn_accept").value = c1.value;
		document.getElementById("btn_accept").disabled = true;
		c1.style.background = "#C4C4C4";
		return false;
	} else {
		if (state == "0") {
			return true;
		} else if (state == "1") {
			var c = document.getElementById("btn_accept");
			c.value = "已接受";
			document.getElementById("btn_accept").value = c.value;
			document.getElementById("btn_accept").disabled = true;
			c.style.background = "#C4C4C4";
			return false;
		}
		finishBtn(state);
	}
}

// 按钮数值变化以及按钮不可用
function finishBtn(state) {
	if (state == "2") {
		var c = document.getElementById("btn_finish");
		c.value = "已完成";
		document.getElementById("btn_finish").value = c.value;
		document.getElementById("btn_finish").disabled = true;
		c.style.background = "#C4C4C4";
		var c1 = document.getElementById("btn_accept");
		c1.value = "已接受";
		document.getElementById("btn_accept").value = c1.value;
		document.getElementById("btn_accept").disabled = true;
		c1.style.background = "#C4C4C4";
		return false;
	} else
		return true;
}

//在报修用户资料上动态显示时间
/*setInterval(function() {
	var now = (new Date()).toLocaleString();
	$('#current-time').text("现在时间为: "+now);
}, 100);*/

/*//接受返回,完成返回
function back(src){
	window.location.href = "http://" + window.location.host + url;
}*/
//------------------------------------------------------------------>
function checkPassword(){
	var oldpsw = document.getElementById("old");
	var newpsw = document.getElementById("new");
	var newpsw1 = document.getElementById("new1");
	
	if(oldpsw.value == "" || oldpsw.value == null){
		alert("请输入旧密码!");
		return false;
	}else{
		if(newpsw.value != "" || newpsw.vallue != null){
		if((newpsw.value == oldpsw.value)){
			alert("新密码不能和旧密码一样!");
			return false;
		}else if(newpsw.value == newpsw1.value){
			alert("密码修改成功!");
			return true;
		}else{
			alert("确认密码与新密码不一致!");
			return false;
		}
	}else{
		alert("请输入新密码!");
		return false;
	}
	}
	document.getElementById("updatepsd").onsubmit();
}
