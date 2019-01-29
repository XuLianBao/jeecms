package com.jeecms.common.hibernate4;


import com.jeecms.common.util.MyBeanUtils;

import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.List;

/**
 * hibernate DAO基类
 * 
 * 提供hql分页查询，拷贝更新等一些常用功能。
 * @param <T>
 *            entity class
 * @param <ID>
 *            entity id
 */
public interface  HibernateBaseDaoInterFace<T, ID extends Serializable> {
	/**
	 * @see 
	 * @param id
	 * @return 持久化对象
	 */
	public T get(ID id);

	/**
	 * @param id
	 *            对象ID
	 * @param lock
	 *            是否锁定，使用LockMode.UPGRADE
	 * @return 持久化对象
	 */
	@SuppressWarnings("unchecked")
	public T get(ID id, boolean lock);

}
