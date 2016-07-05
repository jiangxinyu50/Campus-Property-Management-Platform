<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
   <meta http-equiv="Content-Type" content="text/html"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
   <meta content="yes" name="apple-mobile-web-app-capable" />
   <link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
   <link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />
   <link href="${ctxStatic}/calendar/calendar.css" rel="stylesheet" type="text/css"/>
   <link href="${ctxStatic}/calendar/calendar.default.css" rel="stylesheet" type="text/css"/>
   <script src="${ctxStatic}/Scripts/repair.js" type="text/javascript"></script>
   <script src="${ctxStatic}/Scripts/zepto.js" type="text/javascript"></script> 
   
   <script src="${ctxStatic}/calendar/touch.js" type="text/javascript"></script><!--新版zepto合并版中不包括touch.js-->
   <script src="${ctxStatic}/calendar/highlight.js" type="text/javascript"></script>
   <script src="${ctxStatic}/calendar/gmu.js" type="text/javascript"></script>
   <script src="${ctxStatic}/calendar/event.js" type="text/javascript"></script>
   <script src="${ctxStatic}/calendar/widget.js" type="text/javascript"></script>
   <script src="${ctxStatic}/calendar/calendar.js" type="text/javascript"></script>

   <!-- 在顶部<head>中引入CSS,在<body>底部引入JS,有利于网页加载 -->
<%--    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script> --%>
<%--    <script src="${ctxStatic}/Scripts/jquery.js"  type="text/javascript"></script> --%>
   <!--<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>-->
   <!--引入Jquery时间选择器的JS库-->
   <!--<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>-->
   <title>在线报修</title>
       	<!--本报修页面样式-->
	  <style>
        .section {
            background: #f3f3f3; font-size: 14px;
        }
        #datepicker_wrap {
            overflow: hidden; height: 0; background: #e1e1e1; box-sizing:border-box;
            -webkit-transition: height 200ms ease-in-out;
            -webkit-box-sizing:border-box;
        }
        #datepicker_wrap>div {
            display: none; padding: 5px 5px 5px 5px;
        }
        .filter {
            padding: 10px;
        }
        .filter:after {
            content: '\0020'; clear: both; display: block; height: 0; font-size: 0; line-height: 0;
        }
        a.datebox {
            border: 1px solid #e1e1e1; text-decoration: none; color: #000; padding: 5px 26px 5px 5px; margin: 0px 5px 0 0;
            position: relative; background: #fff; top: 5px;
        }
       .ui-icon-down {
            position: absolute; top: 50%; right: 5px; background: url(${ctxStatic}/Images/carat-d-black.png) no-repeat;
            width:15px; height: 18px; margin-top: -8px;
        }
        .filter a.ui-state-active, .filter a.ui-state-hover {
            background: #fff;
        }
        .filter a.ui-state-active .ui-icon-down, .filter a.ui-state-hover .ui-icon-down {
            background-position: 	-180px 50%;
        }
        .filter a.search {
            float: right; padding: 5px; margin: 0;
        }
        .result {
            padding: 15px; text-align: left;
        }
    </style>
    <script type="text/javascript">
 // 提交成功
    function success() {
    	// 判断选择类型上有没有进行选中
    	var st = document.getElementById("style").value;
    	var p = document.getElementById("personName").value;
    	var a = document.getElementById("address").value;
    	var ph = document.getElementById("phoneNumber").value;

    	if (st == "null" || p == "" || a == "请输入上门维修地址" || a == "" || ph == "") {
    		alert("请您填写完整正确的报修信息!");
    		return false;
    	} else if (checkStyle() && checkUsername()&& checkLocation()
    			&& checkPhoneNumber()) {
    			alert("提交成功!很快将为您安排维修服务.");
    /*     			alert($("#exceptedTime1").val()); */
    	    	window.location.href = "http://localhost:8181/Baoxiu/baoxiu";
    			return true;		
    	} else {
    		alert("请您填写完整正确的报修信息!");
    		return false;
    	}
    }
    </script>
</head>

<body>
	 <div class="header">
	 <a href="${ctx}/index" class="home">
	            <span class="header-icon header-icon-home"></span>
	            <span class="header-name">主页</span>
	</a>
	<div class="title" id="titleString">在线报修</div>
	<a href="javascript:history.go(-1);" class="back">
	            <span class="header-icon header-icon-return"></span>
	            <span class="header-name">返回</span>
	        </a>
	 </div>
 
   <div class="container width90 pt20">
    <!-- 如果onsubmit事件,不加return,无论是false还是true都将被执行action-insert方法 -->
	<form id="form1" action="${ctx}/insert" method="post" onsubmit="return success()" class="form-horizontal"> 
	<ul name="information" class="search-group unstyled">
		<!-- 姓名name为"name" 联系电话name为"phone" 地址location 类型type 期望时间 exceptedTime,才能将数据传到数据库(通过name属性传值).-->
    			<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon uesr-icon" for="personName"></span>
						<span class="coupon-label">姓　　名：</span>
						<input id="personName" name="name" type="text" onfocus="showDesc(this)" onblur="checkUsername()" class="coupon-input input" style="width:140px;" placeholder="请输入报修人姓名"/>
					</div>
					<label id="namePrompt" name="namePrompt" type="text" style="float:right; color:red;font-size:1.5em;"></label>
				</li>	

				<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon phone-icon" for="phoneNumber"></span>
						<span class="coupon-label">联系电话：</span>
						<input id="phoneNumber" name="phone" onfocus="showDesc(this)" onblur="checkPhoneNumber()" class="coupon-input input" style="width:140px;" placeholder="请输入联系电话" type="text" />
					</div>
					<label id="phonePrompt" name="phonePrompt" type="text" style="float:right; color:red;font-size:1.5em;"></label>
				</li>
				
				<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon location-icon" for="address"></span>
						<span class="coupon-label">报修地址：</span>
						<input id="address" name="location" onblur="checkLocation()" class="coupon-input input" style="width:140px;" placeholder="请输入上门维修地址" type="text" />
					</div>
					<label id="addressPrompt" name="addressPrompt" type="text" style="float:right; color:red;font-size:1.5em;"></label>
				</li>

				<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon style-icon" for="style"></span>
						<span class="coupon-label">报修类型：</span>
						<select id="style" name="type" onblur="checkStyle()" class="coupon-input select">
                           <option value="null" selected="selected">请选择报修类型</option>
                           <option value="水">水</option>             
                           <option value="电">电</option>             
                           <option value="煤气">煤气</option>
                           <option value="家具">家具</option>             
                           <option value="房屋">房屋</option>             
                           <option value="电器">电器</option>
                           <option value="其他">其他</option>
                        </select>
					</div>
					<label id="stylePrompt" name="stylePrompt" type="text" style="float:right; color:red;font-size:1.5em;"></label>
				</li>

				<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon time-icon"></span>
						<span class="coupon-label">报修时间：</span>
					    <span class="coupon-input"><a id="datestart" class="datebox" href="javascript:void(0)"><span class="ui-icon-down"></span></a></span>
					</div>
                    <div id="dp_start" class="none">
                     <div id="datepicker_start"></div>
                     </div>
				</li>

                <li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon time-icon" for="hopeTimes"></span>
						<span class="coupon-label">期望时间：</span>
					    <span class="coupon-input"><a id="hopeTimes" name="hopeTimes"  class="datebox"  href="javascript:void(0)" value=""></a></span>
					     <input id="exceptedTime1" name="exceptedTime1" value="" type="hidden" />
					</div>																				<!--  onblur="checkExceptedTime()" onblur="turnTime()"-->
                    <div id="dp_end" class="none">
                     <div id="datepicker_end"></div>
                     </div>
                    
				<li>
					<div class="coupon-nav coupon-nav-style">
						<span class="search-icon ps-icon"  for="beizhu"></span>
						<span class="coupon-label">备　　注：</span>
                        <textarea id="beizhu" name="address" class="coupon-input input" placeholder="可以填写故障情况,在家时间等" style="resize:none;" type="text"></textarea>
				</li>

        </ul>      
    <!--zepto插件引用-->
	<script type="text/javascript">
    (function ($, undefined) {
        $(function () {//dom ready
            var open = null, today = new Date();
            var month = today.getMonth()+1;
            var day = today.getDate();
            var beginday = today.getFullYear()+'-'+(month< 10 ? ("0" + month) : month)+'-'+(day< 10 ? ("0" + day) : day);
            var endday = today.getFullYear()+'-'+(month< 10 ? ("0" + month) : month)+'-'+(day< 10 ? ("0" + day) : day);
            //设置报修时间为今天
            $('#datestart').html(beginday);
            //设置期望时间事件
            $('#hopeTimes').html(endday + '<span class="ui-icon-down"></span>');
            $('#hopeTimes').val(endday);
            $('#exceptedTime1').val(endday);
            $('#datepicker_end').calendar({//初始化期望时间的datepicker
                date: $('#hopeTimes').text(), //设置初始日期为文本内容
                //设置期望维修时间限制为报修当天到30天内,报修日期+1
                minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1),
                maxDate: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 30),
                select: function (e, date, dateStr) {//当选中某个日期时。
                    //收起datepicker
                    open = null;
                    $('#dp_end').toggle();
                    //把所选日期赋值给文本
                    $('#hopeTimes').html(dateStr + '<span class="ui-icon-down"></span>').removeClass('ui-state-active');
                    $('#hopeTimes').val(dateStr);
                    $('#exceptedTime1').val(dateStr);
                }
            });
            $('#hopeTimes').click(function (e) {//展开或收起日期
                $('#hopeTimes').removeClass('ui-state-active');
                var type = $(this).addClass('ui-state-active').is('#hopeTimes') ? 'start' : 'end';
                $('#dp_end').toggle();

            }).highlight('ui-state-hover');
        });
    })(Zepto);
</script>

     <div class="control-group tc"> 
         <button id="in" style="padding-left:0px;padding-right: 0px;" class="btn-large green button width80" type="submit">立即报修</button>
  </div>
  <div class="control-group tc">
         <button name="consle" style="padding-left:0px;padding-right: 0px;" class="btn-large green button width80">取消</button>
  </div> 
	</form>
</div>

   <!--页面底部-->
  <div class="footer">
  <div> 
      <a href="${ctx}/index" class="ui-link">首页</a> <font color="#878787">|</font> <a href="${ctx}/baoxiu" class="ui-link">在线报修</a> <font color="#878787">|</font> <a href="${ctx}/login" class="ui-link">管理页面</a> <font color="#878787">|</font> <a href="${ctx}/tongzhi" class="ui-link">物业通知</a> <font color="#878787">|</font> <a href="${ctx}/help" class="ui-link">帮助咨询</a></div>

      <p style="color:#bbb;">作者:蒋新宇&nbsp;&nbsp; &copy; &nbsp;&nbsp;毕业设计&nbsp;&nbsp;2016</p>
  </div>
 
</body>
</html>