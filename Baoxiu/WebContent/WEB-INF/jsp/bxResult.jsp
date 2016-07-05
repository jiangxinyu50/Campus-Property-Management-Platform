<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>物业报修管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<link href="${ctxStatic}/styles/bootstrap.min.css" rel="stylesheet" />
<link href="${ctxStatic}/styles/NewGlobal.css" rel="stylesheet" />

<script type="text/javascript" src="${ctxStatic}/Scripts/zepto.js"></script>
<style type="text/css">
.input1{
    width: 145px; padding: 0px 0px; margin-bottom: 5px; margin-left: 0;
    background: none repeat scroll 0 0 #F9F9F9;
}
.fl{
  float: left;
}
</style>

</head>
<body>
 <div class="header">
 <a href="${ctx}/index" class="home">
            <span class="header-icon header-icon-home"></span>
            <span class="header-name">主页</span>
</a>
<div class="title" id="titleString">报修管理</div>
<a href="${ctx}/login" class="back">
            <span class="header-icon header-icon-return"></span>
            <span class="header-name">退出</span>
        </a>
 </div>

        
  <div class="container hotellistbg">
         <ul class="unstyled hotellist"  style="color: #1C86EE;">
           
             <li>
              <div class="inline">
                  <label name="name" class="fl" style="font-size: 1.5em;margin-right: 2.5em;">李XX</label><label name="phone">13913803970</label>
                  <p name="location1" class="fl">地址：</p><label name="location">南京林业大学</label>
                  <p name="style" class="fl">类型：</p><label name="type">水电</label>
                  <p name="expctTime1" class="fl">时间：</p><label name="expctTime">2016-4-16</label>
                  <p name="address1" class="fl">备注：</p><label name="address">无</label>
                  <p name="repairStatus" class="fl">状态：</p><label name="state">已报修</label>
                  <p name="url" class="fl">链接：</p><input type="text" name="url" class="input1" style="left: auto;"></input><button name="copy" style="margin: 5px;margin-bottom: 9px; margin-left: 15px;width: 65px;">复制</button>
              </div>
              <div class="clear"></div>  
               <ul class="unstyled">
                   <li><a href="/" class="link" title="点击显示资料链接" alt="点击显示资料链接">链接</a></li>
                   <li><a href="/" class="cancel">取消</a></li>
                   <li><a href="/" class="delete">删除</a></li>
               </ul>
             </li>

         </ul>
  </div>
      <!--分页设置-->
      <div id="ctl00_ContentPlaceHolder1_AspNetPager1" style="width:100%;text-align:center;">
       <a class="nextprebutton" class="nextprebutton" disabled="disabled" style="margin-right:5px;">首页</a>
        <a class="nextprebutton" class="nextprebutton" disabled="disabled" style="margin-right:5px;">上页</a>
        <span class="currentpage" style="margin-right:5px;">1</span><a href="HotelReview.aspx@id=5&page=2" style="margin-right:5px;">2</a><a href="HotelReview.aspx@id=5&page=3" style="margin-right:5px;">3</a><a href="HotelReview.aspx@id=5&page=4" style="margin-right:5px;">4</a><a href="HotelReview.aspx@id=5&page=5" style="margin-right:5px;">5</a><a href="HotelReview.aspx@id=5&page=6" style="margin-right:5px;">...</a>
        <a class="nextprebutton" class="nextprebutton" href="HotelReview.aspx@id=5&page=2" style="margin-right:5px;">下页</a>
        <a class="nextprebutton" class="nextprebutton" disabled="disabled" style="margin-right:5px;">尾页</a>
      </div>

  <div class="footer">
  <div>
      <a href="${ctx}/tzgl" class="ui-link">物业通知管理</a> <font color="#878787">|</font> 
       <a href="${ctx}/admin" class="ui-link">管理员管理</a> <font color="#878787">|</font>                 
       <a href="${ctx}/list" class="ui-link">电脑版</a>
  </div>
  <div>
    <p style="color:#bbb;">作者：蒋新宇 &copy; 毕业设计 2016</p>
  </div>
  </div>

</body>
</html>