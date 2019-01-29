package com.jeecms.spcp.controller.httpModel;

/**
 * @类名：HttpResponseBody
 * @描述：com.jeecms.spcp.controller.httpModel
 * @创建人 xlb
 * @创建时间 2019/1/8 13:56
 * @Version 1.0
 */
public class HttpResponseBody {

    private String code ="200";

    private Object data;

     private String message="操作成功";

     private String operateType="update";//默认类型是更新

    private  String errorMsg;

    public HttpResponseBody() {
    }

    public HttpResponseBody(Object data) {
        this.data = data;
    }

    public HttpResponseBody(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
