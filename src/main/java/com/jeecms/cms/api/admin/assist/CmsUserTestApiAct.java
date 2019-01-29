package com.jeecms.cms.api.admin.assist;

import com.google.common.base.Strings;

import com.jeecms.cms.api.ApiResponse;
import com.jeecms.cms.api.Constants;
import com.jeecms.cms.api.ResponseCode;
import com.jeecms.cms.entity.UserTest;
import com.jeecms.cms.service.WeixinTokenCache;
import com.jeecms.common.web.ResponseUtils;

import net.sf.ehcache.Ehcache;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CmsUserTestApiAct {
	private static final Logger log = LoggerFactory
			.getLogger(CmsUserTestApiAct.class);

	@Autowired
	private com.jeecms.cms.service.WeiXinSvc weiXinSvc;

    @Autowired
    private WeixinTokenCache weixinTokenCache;

	@RequestMapping("/userTestLink/list")
	public void list(HttpServletRequest request,HttpServletResponse response){
//		CmsSite site = CmsUtils.getSite(request);
        Map<String, String> msg=weixinTokenCache.getToken();
        String token=msg.get("token");
		if(token== null){
			log.info("token 是孔的");
		}
//		Set<String> sets = weiXinSvc.getUsers(token);
//		log.info("开始发送纯文本内容信息测试");
//		weiXinSvc.sendText(token,"你是hyl");
//        weiXinSvc.sendContent(token,"hyl","这是一个文本内容测试","http://www.baidu.com","http://xulianbao.top/menhu/u/cms/www/201812/03015422w9wm.jpg");
//		if (sets!=null&&sets.size()>0) {
//			log.info("用户微信接口信息获取");
//			Iterator<String> iterator = sets.iterator();
//			while(iterator.hasNext()){
//				String temp = iterator.next();
//			    log.info(temp);
//			}
//		}else{
//			log.info("啥都没有吗");
//		}
        String querySex = request.getParameter("querySex");
		List<UserTest> list = new ArrayList<>();
        UserTest user = new UserTest();
        if(Strings.isNullOrEmpty(querySex) || !"0".equals(querySex)){
            user.setId("111");
            user.setSex(1);
            user.setUserName("xlb");
            list.add(user);
        }
        user = new UserTest();
        user.setId("112");
        user.setSex(0);
        user.setUserName("gch");
        list.add(user);
		JSONArray jsonArray = new JSONArray();
		if (list!=null&&list.size()>0) {
			for(int i = 0; i<list.size(); i++){
				jsonArray.put(i,list.get(i).convertToJson());
			}
		}
		String body = jsonArray.toString();
		String message = Constants.API_MESSAGE_SUCCESS;
		String code = ResponseCode.API_CODE_CALL_SUCCESS;
		ApiResponse apiResponse = new ApiResponse(request, body, message, code);
		ResponseUtils.renderApiJson(response, request, apiResponse);
	}


}
