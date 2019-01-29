package com.jeecms.spcp.entity.persistence.menu;

import com.jeecms.spcp.entity.constants.MenuConstants;
import com.jeecms.spcp.entity.constants.SchemaConstants;

import org.apache.commons.lang.StringUtils;

import java.util.List;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
@Entity
@Table(name = "menu_tree",schema = SchemaConstants.SCHEMA_SPCP)
@Access(value= AccessType.FIELD)
public class CmsSelfMenu  implements Comparable<CmsSelfMenu>{
    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 父Id
     */
    @Column(name = "parent_id")
    private Integer parentId;
    /**
     * 优先级
     */
    @Column(name = "priority")
    private Integer priority;
    /**
     * 是否展示
     */

    @Column(name = "is_display")
    private Integer isDisplay;
    /**
     * 菜单名称
     */
    @Column(name = "menu_name")
    private String menuName;

    /**
     * 菜单url逻辑地址
     */
    @Column(name = "menu_path")
    private String menuUrl;

    @Column(name = "index_js")
    private Integer indexJs;

    /**
     * 菜单子列表
     */
    @Transient
    private List<CmsSelfMenu> cmsChildMenuList;

    /**
     * 指令地址(实际地址)
     */
    @Column(name = "redirect")
    private String redirect;

    /**
     *
     */
    @Column(name = "init_fun")
    private String initFun = "customMenuEdit";

    /**
     * 菜单级别
     */
    @Column(name = "menu_level")
    private Integer menuLevel;

    /**
     * 菜单图标
     */
    @Column(name = "icon_cls")
    private String iconCls;

    /**
     * 是否父级（js 逻辑菜单）
     */
    @Column(name = "is_parent")
    private Integer isParent;

    /**
     * 是否无直接子节点
     */
    @Column(name = "is_leaf")
    private Integer isLeaf = 0;

    /**
     * 自定义页面初始化参数
     */
    @Column(name = "custom_param")
    private String customParam;

    @Column(name="is_custom_page")
    private Integer isCustomPage;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(Integer isDisplay) {
        this.isDisplay = isDisplay;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }


    public String getInitFun() {
        return initFun;
    }

    public void setInitFun(String initFun) {
        this.initFun = initFun;
    }


    public Integer getMenuLevel() {
        return menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    public List<CmsSelfMenu> getCmsChildMenuList() {
        return cmsChildMenuList;
    }

    public void setCmsChildMenuList(List<CmsSelfMenu> cmsChildMenuList) {
        this.cmsChildMenuList = cmsChildMenuList;
    }

    public Integer getIndexJs() {
        return indexJs;
    }

    public void setIndexJs(Integer indexJs) {
        this.indexJs = indexJs;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }


    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public Integer getIsParent() {
        return isParent;
    }

    public void setIsParent(Integer isParent) {
        this.isParent = isParent;
    }

    public Integer getIsLeaf() {
        return isLeaf;
    }

    public void setIsLeaf(Integer isLeaf) {
        this.isLeaf = isLeaf;
    }


    public String getCustomParam() {
        return customParam;
    }

    public void setCustomParam(String customParam) {
        this.customParam = customParam;
    }

    public Integer getIsCustomPage() {
        return isCustomPage;
    }

    public void setIsCustomPage(Integer isCustomPage) {
        this.isCustomPage = isCustomPage;
    }

    @Override
    public String toString() {
        String redirectStr = "";
        if (StringUtils.isNotEmpty(this.getRedirect())) {
            redirectStr = "redirect:'" + this.getRedirect() + "',";
        }

        String isParent = "";
        if (this.getIsParent() != null) {
            if (this.isParent.intValue() == 1) {
                isParent = "isParent:true,";
            }
        }

        String isLeaf = "";
        if (this.getIsLeaf() != null) {
            if (this.getIsLeaf().intValue() == 1) {
                isLeaf = "leaf:true,";
            }
        }
        String iconCls = "";
        if (StringUtils.isNotEmpty(this.getIconCls())) {
            iconCls = "iconCls:'" + this.iconCls + "',";
        }
        String tempStr = cmsChildMenuList == null ? "" : "children:" + cmsChildMenuList.toString() + ",";
        String component = "indexThreeAndUserInfoExports";
        if (this.getMenuLevel() !=null && this.getIndexJs() != null && MenuConstants.MENU_LAST_LEVEL == this.getMenuLevel().intValue() ) {//自定义内容页菜单
            component = "function(e) {" +
                    "doComponent(e,this,[" + this.indexJs + "],'" + this.getInitFun() + "','" + customParam + "')"
                    + "}";
            return "{" +
                    "name:'" + this.menuName + "'," +
                    redirectStr +
                    iconCls +
                    isParent +
                    isLeaf +
                    "path:'" + this.menuUrl + "'," +
                    "component:" + component +
                    '}';
        } else if (this.getMenuLevel() !=null &&  MenuConstants.MENU_MIDDLE_LEVEL == this.getMenuLevel().intValue()) {//中间层菜单
            return "{" +
                    " name:'" + this.menuName + "'" +
                    ", path:'" + this.menuUrl + "'," +
                    redirectStr +
                    iconCls +
                    isParent +
                    isLeaf +
                    tempStr +
                    "component:Le.a" +
                    '}';
        }
        return "{" +
                redirectStr +
                isParent +
                isLeaf +
                iconCls +
                " name:'" + this.menuName + "'" +
                ", path:'" + this.menuUrl + "'," +
                tempStr +
                "component:" + component +
                '}';
    }

    @Override
    public int compareTo(CmsSelfMenu o) {
        return this.priority - o.getPriority();
    }
}
