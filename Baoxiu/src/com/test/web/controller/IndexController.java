package com.test.web.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/* controller控制器 , @RequestMapping检索变化值*/
import java.util.Date;
/*import java.util.HashMap;*/
import java.util.List;
/*import java.util.Map;*/
import java.util.UUID;

/*import org.apache.catalina.connector.Request;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.test.dao.BaoxiuMapper;
import com.test.web.entity.Baoxiu;
import com.test.web.entity.BaoxiuExample;
import com.test.web.entity.Tongzhi;
import com.test.web.info.Login;
import com.test.web.info.News;

@Controller
@RequestMapping(value = "/")
public class IndexController {  //控制部分:数据处理和网页跳转
	@Autowired
	BaoxiuMapper baoxiuMapper;
	
	@RequestMapping(value = "index")    //设置快捷跳转到主页
	public String index(Model model, Baoxiu baoxiu) {
		Baoxiu baoxiu2 = baoxiuMapper.selectByPrimaryKey(baoxiu.getId());
		model.addAttribute("baoxiu", baoxiu2);
		return "/index";
	}
	
	@RequestMapping(value = "baoxiu")  //设置快捷跳转到报修页面
	public String index(Model model) {
		return "/repairEntre";
	}
	
	@RequestMapping(value = "login")	//设置快捷跳转到登录页面
	public String login(Model model) {
		List<Baoxiu> list = baoxiuMapper.selectByExample(new BaoxiuExample());
		model.addAttribute("list", list);
		return "/login";
	}
	
	@RequestMapping(value = "help")		//设置快捷跳转到帮助页面
	public String help(Model model) {
		return "/Help";
	}
	
	@RequestMapping(value = "tongzhi")	//设置快捷跳转到物业通知页面
	public String tongzhi(Model model) {
		List tit = News.selectTitle();
		model.addAttribute("list", tit);
		return "/tongzhi";
	}
	
	@RequestMapping(value = "news")		//设置快捷跳转到物业通知详情页面
	public String news(Model model,@RequestParam("tztit") String title) { 
		System.out.println("title="+title);
		List<Tongzhi> tongzhiList = News.selectByTitle(title);
		model.addAttribute("list", tongzhiList);
		return "/News";
	}
		
	@RequestMapping(value = "insert")	 //设置快捷跳转到插入页面(但是是链接到报修页面),以及进行往数据库插入数据操作.
	public String insert(Model model, Baoxiu baoxiu , @RequestParam("exceptedTime1") String time) { //取出页面的值（期望时间）
		UUID uuid = UUID.randomUUID();	//生成一个随机不重复的id(流水号)
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  //定义日期格式
		try {
			baoxiu.setExceptedTime(sdf.parse(time));  //数据库插入期望时间
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		baoxiu.setId(uuid.toString());  //数据库插入id值
		baoxiu.setUrl("/url?id="+uuid.toString());  //数据库插入一个规定好格式的链接
		baoxiu.setState("0");	//设置报修状态为初始值,0-未维修
		baoxiu.setDelFlag("0");  //设置初始报修单状态,0-未取消
		baoxiu.setTime(new Date()); //数据库插入系统时间=报修时间.
		baoxiuMapper.insert(baoxiu);  //通过方法将所有的值都一起插入到数据库表中
		return "/repairEntre";		//然后返回到在线报修页面
	}
	
	@RequestMapping(value = "list")		//设置快捷跳转到管理页面
	public String list(Model model) {
		List<Baoxiu> list = baoxiuMapper.selectByExample(new BaoxiuExample());
		model.addAttribute("list", list);	
		return "/repairResult";
	}
	
	@RequestMapping(value = "tzgl")		//设置快捷跳转到物业通知管理页面
	public String tzgl(Model model) {
		return "/tzguanli";
	}
	
	@RequestMapping(value = "addTz")  //新增通知
	public String addTz(Model model,@RequestParam("tztitle") String tztit,@RequestParam("tzbody") String tzbody) {
		News.addTongzhi(tztit, tzbody);
		return "/tzguanli";
	}
	
	@RequestMapping(value = "deleteTz")  //删除通知
	public String deleTongzhi(Model model,@RequestParam("tzTitle") String title) {
		News.deleTongzhi(title);
		return "/tzguanli";
	}
		
	@RequestMapping(value = "admin")	//设置快捷跳转到管理员管理页面
	public String admin(Model model) {
		return "/adminguanli";
	}	
		
	@RequestMapping(value = "addAdmin")  //新增管理员
	public String addAdmin(Model model,@RequestParam("newadmin") String name,@RequestParam("newadmin1") String psd) {
		Login.addAdmin(name,psd);
		return "/adminguanli.jsp?name="+name;
	}
	
	@RequestMapping(value = "deleAdmin")  //删除管理员
	public String deleAdmin(Model model,@RequestParam("adPname") String name) {
		if(Login.deleAdmin(name)){
			model.addAttribute("result", "1");
			return "/adminguanli.jsp?name="+name+"&dsa=dasd"; //能确保正确的传值
		}else{
			model.addAttribute("result", "0");
			return "/adminguanli.jsp?name="+name+"&dsa=dasd";
		}
	}
	
	@RequestMapping(value = "changePwd")	//设置快捷跳转到管理员更改密码页面
	public String changePwd(Model model,@RequestParam("name") String name) {
		return "/changePwd.jsp?name="+name+"&dasdasd=dsadas";
	}
	
	@RequestMapping(value = "updatePsd")  //更改密码页面
	public String updatePsd(Model model,@RequestParam("name") String name,@RequestParam("oldPwd") String oldPsd,@RequestParam("newPwd") String newPsd) {
		System.out.println("name="+name+"oldpsd="+oldPsd+"newpsd="+newPsd);
		if(Login.updatePsd(name, oldPsd, newPsd)){
			return "/changePwd.jsp?name="+name+"&result=chenggong&dasdasd=dsadas"; //？是一个条件，&是另一个条件
		}else
			return "/changePwd.jsp?name="+name+"&result=shibai&dasdasd=dsadas";
	}
	
	@RequestMapping(value = "cancel")    //管理员取消维修记录操作
	//@ResponseBody
	public String del(Model model, Baoxiu baoxiu,@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("psd") String psd) throws JsonProcessingException {
		baoxiu.setDelFlag("1");
		baoxiu.setId(id);
		baoxiuMapper.updateByPrimaryKeySelective(baoxiu);
		model.addAttribute("Login", "Login");  //addAttribute添加属性
		model.addAttribute("__EVENTTARGET", "___+++++______+++");
		List<Baoxiu> list = baoxiuMapper.selectByExample(new BaoxiuExample());
		model.addAttribute("list", list);
		return "/repairResult.jsp?Login=Login&__EVENTTARGET=_______________&name="+name+"&psd="+psd+"&dasd=sdasd";//只有从登陆界面跳转才行
	}
	
	@RequestMapping(value = "mlist")	//设置快捷跳转到手机管理页面(该功能未能实现)
	public String mlist(Model model) {
		List<Baoxiu> mlist = baoxiuMapper.selectByExample(new BaoxiuExample());
		model.addAttribute("mlist", mlist);	
		return "/bxResult";
	}
	
	@RequestMapping(value = "url")   //设置快捷url跳转到维修人员页面
	public String url(Model model, Baoxiu baoxiu) {
		Baoxiu baoxiu2 = baoxiuMapper.selectByPrimaryKey(baoxiu.getId());
		model.addAttribute("baoxiu", baoxiu2);
		return "/repairCustoms";	
	}
	
	@RequestMapping(value = "urlAccepet")  //维修人员接受后会跳转回原网页
	public String url2(Model model, Baoxiu baoxiu,@RequestParam("keyId") String keyId) {
		Baoxiu baoxiu2 = baoxiuMapper.selectByPrimaryKey(keyId);
		baoxiu2 = updateAccept(baoxiu2);
		model.addAttribute("baoxiu", baoxiu2);
		return "/repairCustoms";	
	}
	
	@RequestMapping(value = "urlFinish")	//维修人员完成后会跳转回原网页
	public String url3(Model model, Baoxiu baoxiu,@RequestParam("keyId") String keyId) {
		Baoxiu baoxiu2 = baoxiuMapper.selectByPrimaryKey(keyId);
		baoxiu2 = updateFinish(baoxiu2);
		model.addAttribute("baoxiu", baoxiu2);
		return "/repairCustoms";
		
	}
	
	@RequestMapping(value = "backLogin")  //返回登录页面
	public String backLogin(Model model,@RequestParam("name") String name,@RequestParam("psd") String psd) {
		Login.back(name, psd);
		return "/login";	
	}

	public Baoxiu updateAccept(Baoxiu baoxiu) {    //维修人员接受就将状态置为1
		baoxiu.setState("1");
		baoxiuMapper.updateByPrimaryKeySelective(baoxiu);
		return baoxiu;
	}
	
	public Baoxiu updateFinish( Baoxiu baoxiu) {  //维修人员完成就将状态置为2
		baoxiu.setState("2");
		BaoxiuExample be = new BaoxiuExample();
		baoxiuMapper.updateByPrimaryKeySelective(baoxiu);
		return baoxiu;
	}
}
