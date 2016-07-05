package com.service;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.message.resp.Article;
import com.message.resp.NewsMessage;
import com.message.resp.TextMessage;
import com.tool.StringUtil;
import com.urils.MessageUtil;




/** 
* @author  LinShiqin: 
* @date 创建时间：2016年4月19日 上午9:31:58 
* @return  核心服务类
*/
public class CoreService {
	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {

		String respMessage = null;
		String openid = request.getParameter("openid");
		String openkey = request.getParameter("openkey");
		try {
			// 默认返回的文本消息内容
			String respContent = "请求处理异常，请稍候尝试！";

			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");

			// 回复文本消息
			TextMessage textMessage = new TextMessage();
			String msgContent = requestMap.get("Content");
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setFuncFlag(0);
			String weiXinID = "";
			if(StringUtil.strIsNotEmpty(fromUserName))
				weiXinID = fromUserName;
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);

			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
				respContent = "您发送的是图片消息,暂不处理该消息!";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
				respContent = "您发送的是地理位置消息,暂不处理该消息!";
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
				respContent = "您发送的是链接消息,暂不处理该消息!";
			}
			// 音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
				respContent = "您发送的是音频消息,暂不处理该消息!";
			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					respContent = "谢谢您的关注！ 输入任意字符则可以弹出帮助菜单!";
					textMessage.setContent(respContent);
					respMessage = MessageUtil.textMessageToXml(textMessage);
					return respMessage;
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					
					String eventKey = requestMap.get("EventKey");
					
					if(eventKey.equals("baoxiu")){
						// 创建图文消息
						NewsMessage newsMessage = getNewsMessage(fromUserName, toUserName);
						List<Article> articleList = new ArrayList<Article>();
						Article article = new Article();
						article.setTitle("在线报修");
						article.setUrl("http://" + request.getServerName() // 服务器地址
								+ request.getContextPath() + "/WEB-INF/jsp/repairEntre.jsp");
						article.setDescription("点击进入报修界面");
						// 单图文消息
						articleList.add(article);
						// 设置图文消息个数
						newsMessage.setArticleCount(articleList.size());
						// 设置图文消息包含的图文集合
						newsMessage.setArticles(articleList);
						// 将图文消息对象转换成xml字符串
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
						return respMessage;

					}
					
				}
			}

			textMessage.setContent(respContent);
			respMessage = MessageUtil.textMessageToXml(textMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return respMessage;
	}
	
	private static NewsMessage getNewsMessage(String fromUserName, String toUserName) {
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);
		newsMessage.setFromUserName(toUserName);
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		newsMessage.setFuncFlag(0);
		return newsMessage;

	}

}

