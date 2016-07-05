package com.create_menu;


import com.urils.AccessToken;
import com.urils.WeixinUtil;

/**
 * 菜单管理器类
 * 
 */
public class MenuManager {

	
	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = "wx0ac0ad72c6d67a2f";
		// 第三方用户唯一凭证密钥
		String appSecret = "d4624c36b6795d1d99dcf0547af5443d";

		// 调用接口获取access_token
		AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

		if (null != at) {
			// 调用接口创建菜单
			int result = WeixinUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result)
	//			log.info("菜单创建成功！");
				System.out.println("菜单创建成功" + at.getToken());
			else
			//	log.info("菜单创建失败，错误码：" + result);
				System.out.println("菜单创建失败，错误码：" + result + at.getToken());
		}
		
		
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	 private static Menu getMenu() {  
		    

	        CommonButton baoxiu = new CommonButton();  
	        baoxiu.setName("在线报修");  
	        baoxiu.setType("click");  
	        baoxiu.setKey("baoxiu");
	        

	  
	        ComplexButton mainBtn = new ComplexButton();  
	        mainBtn.setName("报修界面");  
	        mainBtn.setSub_button(new CommonButton[] {baoxiu});  
	  
	        /** 
	         * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br> 
	         *  
	         * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br> 
	         * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br> 
	         * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 }); 
	         */  
	        Menu menu = new Menu();  
	        menu.setButton(new Button[] { mainBtn });  
	  
	        return menu;  
	    }  
}