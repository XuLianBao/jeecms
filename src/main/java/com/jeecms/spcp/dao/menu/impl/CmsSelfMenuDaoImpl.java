package com.jeecms.spcp.dao.menu.impl;

/**
 *
 * @类名：CmsSelfMenuDao
 * @描述：com.jeecms.cms.dao
 * @创建人 xlb
 * @创建时间 2019/1/2 14:00
 * @Version 1.0
 */

import com.jeecms.common.hibernate4.HibernateSimpleDao;
import com.jeecms.spcp.dao.menu.CmsSelfMenuDao;
import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;
import com.jeecms.spcp.entity.model.CmsSelfMenuEditModel;

import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

import javax.annotation.Resource;

@Repository(value = "cmsSelfMenuDao")
public class CmsSelfMenuDaoImpl extends HibernateSimpleDao implements CmsSelfMenuDao {

    public List<CmsSelfMenu> getMenuDates() {
     String sql="SELECT "
             + "  m.id as id, "
             +"   m.is_leaf as isLeaf,"
             +"   m.custom_param as customParam,"
             + "  m.redirect as redirect, "
             + "  m.parent_id AS parentId, "
             + "  m.menu_path AS menuUrl, "
             + "  m.index_js AS indexJs, "
             + "  m.is_custom_page AS isCustomPage, "
             + "  m.priority AS priority, "
             + "  m.is_display AS isDisplay, "
             + "  m.menu_name AS menuName , "
             + "  m.init_fun as initFun, "
             + "  m.menu_level as menuLevel, "
             + "  m.icon_cls as iconCls, "
             + "  m.is_parent as isParent "
             + "FROM "
             + "  menu_tree m  "
             + "WHERE "
             +"m.is_display = 1 "
//             + "  FIND_IN_SET( id, getChildLst ( 0 ) )"  //这个是根据父id 查询所有归属子元素，暂不开启，后期需要再用
             + "ORDER BY m.parent_id,m.priority ";
     List<CmsSelfMenu> list = null;
     try {
          list = this.sessionFactory.getCurrentSession().
                 createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(CmsSelfMenu.class)).
                 list();
     }catch (Exception ex){
         ex.printStackTrace();
     }
        return list;
    }

    @Override
    public List<CmsSelfMenuEditModel> getEditMenuDates() {
        String sql="SELECT "
                + "  m.id as id, "
                + "  m.parent_id AS parentId, "
                + "  m.priority AS priority, "
                + "  m.menu_name AS menuName , "
                + "  m.is_custom_page AS isCustomPage "
                + "FROM "
                + "  menu_tree m  "
                + "WHERE "
                +"m.is_display = 1 "
                //             + "  FIND_IN_SET( id, getChildLst ( 0 ) )"  //这个是根据父id 查询所有归属子元素，暂不开启，后期需要再用
                + "ORDER BY m.parent_id,m.priority ";
        List<CmsSelfMenuEditModel> list = null;
        try {
            list = this.sessionFactory.getCurrentSession().
                    createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(CmsSelfMenuEditModel.class)).
                    list();
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return list;
    }


}
