package com.jeecms.spcp.entity.model;

import java.util.List;

import javax.persistence.Column;

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
 * @类名：CmdMenu
 * @描述：com.jeecms.cms.entity.menu
 * @创建人 xlb
 * @创建时间 2019/1/2 14:03
 * @Version 1.0
 */
public class CmsSelfMenuEditModel implements Comparable<CmsSelfMenuEditModel>{

    /**
     * id
     */
    private Integer id;

    /**
     * 父Id
     */
    private Integer parentId;

    /**
     * 菜单名称
     */
    private String menuName;

    private Integer priority;


    private Integer isCustomPage;

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    private List<CmsSelfMenuEditModel> cmsSelfMenuEditModelList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public List<CmsSelfMenuEditModel> getCmsSelfMenuEditModelList() {
        return cmsSelfMenuEditModelList;
    }

    public void setCmsSelfMenuEditModelList(List<CmsSelfMenuEditModel> cmsSelfMenuEditModelList) {
        this.cmsSelfMenuEditModelList = cmsSelfMenuEditModelList;
    }

    public Integer getIsCustomPage() {
        return isCustomPage;
    }

    public void setIsCustomPage(Integer isCustomPage) {
        this.isCustomPage = isCustomPage;
    }

    @Override
    public String toString() {
        String tempStr = this.cmsSelfMenuEditModelList == null ? "" :
                "children:" + this.cmsSelfMenuEditModelList.toString() + ",";
        return "{" +
                "id:" + "'" + this.id + "'" +
                ", parentId:'" + this.parentId + "'," +
                tempStr +
                "label:'" + this.menuName + '\'' +
                '}';
    }

    @Override
    public int compareTo(CmsSelfMenuEditModel o) {
        return  this.priority - o.getPriority();
    }
}
