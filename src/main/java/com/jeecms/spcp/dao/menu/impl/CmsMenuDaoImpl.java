package com.jeecms.spcp.dao.menu.impl;

import com.jeecms.spcp.dao.BaseSpcpDaoImpl;
import com.jeecms.spcp.dao.menu.CmsMenuDao;
import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;

import org.springframework.stereotype.Repository;

/**
 *
 * @类名：CmsMenuDaoImpl
 * @描述：com.jeecms.spcp.dao.menu.impl
 * @创建人 xlb
 * @创建时间 2019/1/7 16:02
 * @Version 1.0
 */
@Repository(value = "cmsMenuDao")
public class CmsMenuDaoImpl extends BaseSpcpDaoImpl<CmsSelfMenu,Integer> implements CmsMenuDao {

}
