package com.jeecms.spcp.dao;

import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;

import org.hibernate.criterion.Criterion;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


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
 * @类名：BaseSpcpDao
 * @描述：com.jeecms.spcp.dao
 * @创建人 xlb
 * @创建时间 2019/1/8 9:11
 * @Version 1.0
 */
public interface BaseSpcpDao<T, ID extends Serializable> {

    T getInfo(ID id);

    void update(T t);

    List<T> find(Criterion... criterion);

    void saveInfo(T t);

    void delete(Integer id);
    void deleteAll(List<Integer> ids);

}
