package com.jeecms.spcp.controller;

import com.google.common.base.Strings;

import com.jeecms.cms.api.ApiResponse;
import com.jeecms.cms.api.Constants;
import com.jeecms.cms.api.ResponseCode;
import com.jeecms.common.web.ResponseUtils;
import com.jeecms.spcp.controller.httpModel.HttpResponseBody;
import com.jeecms.spcp.entity.constants.OperateTypeConstants;
import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;
import com.jeecms.spcp.service.MenuSelfService;
import com.sun.org.glassfish.gmbal.ParameterNames;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.jboss.logging.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @类名：CmsMenuCtroller
 * @描述：com.jeecms.spcp
 * @创建人 xlb
 * @创建时间 2019/1/3 17:35
 * @Version 1.0
 */
@RestController
public class CmsMenuCtroller {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(CmsMenuCtroller.class);

    @Resource
    private MenuSelfService menuSelfService;

    @RequestMapping(value = "/cmsMenu/getEdit", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    Map getCmsMenu() {
        Map<String, Object> map = new HashMap<>();
        map.put("code", "200");
        map.put("userName", "xlb");
        return map;
    }


    @RequestMapping(value = "/cmsSelfEditMenu/list", method = {RequestMethod.POST, RequestMethod.GET})
    public void getEditMenu(HttpServletRequest request, HttpServletResponse response) {
        String select = menuSelfService.getMenuEditDatesJson();
        System.out.println(select);
        String message = Constants.API_MESSAGE_SUCCESS;
        String code = ResponseCode.API_CODE_CALL_SUCCESS;
        ApiResponse apiResponse = new ApiResponse(request, select, message, code);
        ResponseUtils.renderApiJson(response, request, apiResponse);
    }

    @RequestMapping(value = "/cmsSelfEditMenu/find/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    public HttpResponseBody getEditMenu(@PathVariable("id") Integer id) {
        CmsSelfMenu cmsSelfMenu = menuSelfService.get(id);
        HttpResponseBody httpResponseBody = new HttpResponseBody(cmsSelfMenu);
        return httpResponseBody;
    }
    @RequestMapping(value = "/cmsSelfEditMenu/getRecommend/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    public HttpResponseBody getRecommend(@PathVariable("id") Integer id) {
        List<CmsSelfMenu> cmsSelfMenuList = menuSelfService.getRecommendById(id);
        HttpResponseBody httpResponseBody = new HttpResponseBody(cmsSelfMenuList);
        return httpResponseBody;
    }


    @RequestMapping(value = "/cmsSelfEditMenu/delete/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    public HttpResponseBody delEditMenu(@PathVariable("id") String id) {
        HttpResponseBody httpResponseBody = new HttpResponseBody();
        httpResponseBody.setOperateType(OperateTypeConstants.OPERATE_TYPE_DELETE);
        if(Strings.isNullOrEmpty(id)){
            httpResponseBody.setMessage("删除失败");
        }else{
            if(id.contains(",")){
                List<Integer> ids = new ArrayList<>();
                String[] idsStr = id.split(",");
                if(idsStr !=null && idsStr.length>0){
                    for(String tempId:idsStr){
                        ids.add(Integer.valueOf(tempId));
                    }
                }
                menuSelfService.deleteAll(ids);
            }else{
                menuSelfService.delete(Integer.valueOf(id));
            }
            httpResponseBody.setMessage("删除成功");
        }
        httpResponseBody.setOperateType(OperateTypeConstants.OPERATE_TYPE_DELETE);
        return httpResponseBody;
    }

    @PostMapping(value = "/cmsSelfEditMenu/update", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpResponseBody updateEditMenu(CmsSelfMenu cmsSelfMenu) {
        menuSelfService.update(cmsSelfMenu);
        HttpResponseBody httpResponseBody = new HttpResponseBody();
        String menuUrl =cmsSelfMenu.getMenuUrl();
        if(StringUtils.isNotEmpty(menuUrl)) {
            SimpleExpression value = Restrictions.eq("menuUrl", menuUrl);
            List<CmsSelfMenu> cmsSelfMenuList = menuSelfService.getByFilter(value);
            if (cmsSelfMenuList.size() > 0) {
              if(cmsSelfMenuList.size() >1 || (cmsSelfMenuList.get(0).getId() != cmsSelfMenu.getId())){
                  httpResponseBody.setMessage("本菜单栏地址和【"+cmsSelfMenuList.get(0).getMenuName()+"】地址重复");
                  httpResponseBody.setErrorMsg("error");
                  return  httpResponseBody;
              }
            }
        }
        httpResponseBody.setMessage("更新成功");
        if(cmsSelfMenu.getId() ==null){
            httpResponseBody.setOperateType(OperateTypeConstants.OPERATE_TYPE_UPDATE);
        }else{
            httpResponseBody.setOperateType(OperateTypeConstants.OPERATE_TYPE_SAVE);
        }
        return httpResponseBody;
    }


}
