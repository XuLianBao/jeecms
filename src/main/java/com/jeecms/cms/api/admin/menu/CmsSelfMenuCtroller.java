package com.jeecms.cms.api.admin.menu;

import com.jeecms.cms.api.ApiResponse;
import com.jeecms.cms.api.Constants;
import com.jeecms.cms.api.ResponseCode;
import com.jeecms.spcp.service.MenuSelfService;
import com.jeecms.common.web.ResponseUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　┻　　　┃
 * 　　┗━┓　　　┏━┛
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　永无BUG 　┣┓
 * 　　　　┃　　万物天佑　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┗┻┛　┗┻┛
 *
 * @类名：CmsSelfMenuCtl 自定义菜单
 * @描述：com.jeecms.cms.api.admin.menu
 * @创建人 xlb
 * @创建时间 2019/1/2 9:32
 * @Version 1.0
 */
@Controller
public class CmsSelfMenuCtroller {
    private static final Logger LOGGER = LoggerFactory
            .getLogger(CmsSelfMenuCtroller.class);

    @Resource
    private MenuSelfService menuSelfService;

    @RequestMapping("/cmsSelfMenu/list")
    public void getMenu(HttpServletRequest request, HttpServletResponse response){
        String select = menuSelfService.getMenuDatesJson();
        System.out.println(select);
//        String body =" {\n"
//                + "    path: '/channel',\n"
//                + "    name: '栏目',\n"
//                + "    component: indexThreeAndUserInfoExports,\n"
//                + "    iconCls: '1002 icon-appstoreo',\n"
//                + "    redirect: '/channel/list',\n"
//                + "    isParent: true,\n"
//                + "    leaf: true,\n"
//                + "    children: [{\n"
//                + "        path: '/channel/list',\n"
//                + "        name: '栏目列表',\n"
//                + "        component: function(e) {\n"
//                + "        Promise.all([a.e(0), a.e(139)]).then(function() {\n"
//                + "        var t = [a('9R/o')];\n"
//                + "        e.apply(null, t)\n"
//                + "        }\n"
//                + "        .bind(this)).catch(a.oe)\n"
//                + "        },\n"
//                + "        hidden: true\n"
//                + "        }, {\n"
//                + "            path: '/channel/save',\n"
//                + "            name: '栏目添加',\n"
//                + "            component: function(e) {\n"
//                + "            Promise.all([a.e(0), a.e(60)]).then(function() {\n"
//                + "            var t = [a('Vi+y')];\n"
//                + "        e.apply(null, t)\n"
//                + "        }\n"
//                + "        .bind(this)).catch(a.oe)\n"
//                + "        },\n"
//                + "        hidden: true\n"
//                + "        }, {\n"
//                + "            path: '/channel/update',\n"
//                + "            name: '栏目修改',\n"
//                + "            component: function(e) {\n"
//                + "            Promise.all([a.e(0), a.e(66)]).then(function() {\n"
//                + "            var t = [a('59X9')];\n"
//                + "        e.apply(null, t)\n"
//                + "        }\n"
//                + "        .bind(this)).catch(a.oe)\n"
//                + "        },\n"
//                + "        hidden: true\n"
//                + "        }, {\n"
//                + "            path: '/channel/copy',\n"
//                + "            name: '栏目复制',\n"
//                + "            component: function(e) {\n"
//                + "            Promise.all([a.e(0), a.e(29)]).then(function() {\n"
//                + "            var t = [a('snBf')];\n"
//                + "        e.apply(null, t)\n"
//                + "        }\n"
//                + "        .bind(this)).catch(a.oe)\n"
//                + "        },\n"
//                + "        hidden: true\n"
//                + "        }]\n"
//                + "}";
        String message = Constants.API_MESSAGE_SUCCESS;
        String code = ResponseCode.API_CODE_CALL_SUCCESS;
        ApiResponse apiResponse = new ApiResponse(request, select, message, code);
        ResponseUtils.renderApiJson(response, request, apiResponse);
    }



}
