package com.jeecms.spcp.service;

import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;
import com.jeecms.spcp.entity.model.CmsSelfMenuEditModel;

import org.hibernate.criterion.Criterion;

import java.util.List;

/**
 * 　　 　┏┓　　　┏┓
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
 * @类名：MenuSelfService
 * @描述：com.jeecms.cms.service
 * @创建人 xlb
 * @创建时间 2019/1/2 14:48
 * @Version 1.0
 */
public interface MenuSelfService {

    List<CmsSelfMenu> getMenuDates();

    String getMenuDatesJson();

    List<CmsSelfMenuEditModel> getEditMenuDates();

    String getMenuEditDatesJson();

    CmsSelfMenu get(Integer id);

    void update(CmsSelfMenu cmsSelfMenu);

    void delete(Integer id);

    void deleteAll(List<Integer> ids);

    List<CmsSelfMenu> getAll();

    List<CmsSelfMenu> getRecommendById(Integer id);

    List<CmsSelfMenu> getByFilter(Criterion... criterion);
}
