package com.jeecms.plug.weixin.action.front;

import com.jeecms.cms.api.ApiResponse;
import com.jeecms.cms.api.Constants;
import com.jeecms.cms.api.ResponseCode;
import com.jeecms.cms.entity.main.Content;
import com.jeecms.cms.manager.main.ContentMng;
import com.jeecms.common.page.Pagination;
import com.jeecms.common.web.ResponseUtils;
import com.jeecms.core.entity.CmsSite;
import com.jeecms.core.entity.CmsUser;
import com.jeecms.core.web.util.CmsUtils;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MessageSloveAct {
    private static final Logger log = LoggerFactory
            .getLogger(MessageSloveAct.class);

    @Autowired
    private com.jeecms.cms.service.WeiXinSvc weiXinSvc;

    @Autowired
    private ContentMng contentMng;

    /**
     * 微信开发发送信息测试
     *
     * @param request
     * @param response
     * @param model
     *
     * @throws IOException
     */
    @RequestMapping(value = "/sendContent")
    public void weixin(
            String id,
            HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model) throws IOException {
        Content[] beans = new Content[1];
        beans[0] = contentMng.findById(Integer.valueOf(id));
        weiXinSvc.sendTextToAllUser(beans);
    }

    /**
     * 微信开发发送信息测试
     *
     * @param request
     * @param response
     * @param model
     *
     * @throws IOException
     */
    @RequestMapping(value = "/getUser.jspx")
    public @ResponseBody
    Set<String> weixin(
            HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        String token = weiXinSvc.getToken().get("token");
        return weiXinSvc.getUsers(token);
    }



    @SuppressWarnings("unchecked")
    @RequestMapping("/wxUser/list")
    public void list( HttpServletRequest request,HttpServletResponse response){
        JSONArray jsonArray = new JSONArray();
        String token = weiXinSvc.getToken().get("token");
        Set<String> sets = weiXinSvc.getUsers(token);
        if (sets!=null&&sets.size()>0) {
            Iterator<String> iterator = sets.iterator();
            int i=0;
            while(iterator.hasNext()){
                i++;
                String temp = iterator.next();
                jsonArray.put(i,temp);
            }
        }
        String message = Constants.API_MESSAGE_SUCCESS;
        String code = ResponseCode.API_CODE_CALL_SUCCESS;
        String body = jsonArray.toString();
        ApiResponse apiResponse = new ApiResponse(request, body, message, code);
        ResponseUtils.renderApiJson(response, request, apiResponse);
    }
}
