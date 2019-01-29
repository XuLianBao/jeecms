package com.jeecms.cms.entity;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;

import java.io.Serializable;

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
 * @类名：UserTest
 * @描述：com.jeecms.cms.entity
 * @创建人 xlb
 * @创建时间 2018/11/29 13:39
 * @Version 1.0
 */
public class UserTest implements Serializable {
    private String id;
    private String userName;
    private Integer sex;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public JSONObject convertToJson(){
        JSONObject json = new JSONObject();
        if (getId()!=null) {
            json.put("id", getId());
        }else{
            json.put("id", "");
        }
        if (StringUtils.isNotBlank(getUserName())) {
            json.put("userName", getUserName());
        }else{
            json.put("userName", "");
        }
        if (getSex() !=null) {
            json.put("sex", getSex());
        }else{
            json.put("sex", "");
        }
        return json;
    }
}
