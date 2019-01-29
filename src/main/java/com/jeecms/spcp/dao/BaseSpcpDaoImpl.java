package com.jeecms.spcp.dao;

import com.jeecms.common.hibernate4.HibernateBaseDao;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resources;

/**
 * @类名：BaseSpcpDao
 * @描述：com.jeecms.spcp.dao
 * @创建人 xlb
 * @创建时间 2019/1/8 9:11
 * @Version 1.0
 */
@Component("baseSpcpDao")
public class BaseSpcpDaoImpl<T, ID extends Serializable> extends HibernateBaseDao<T, ID> implements BaseSpcpDao<T, ID> {

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Override
    protected Class<T> getEntityClass() {
        return (Class<T>) createModel().getClass();
    }

    @Override
    public T getInfo(ID id) {
        return get(id);
    }

    @Override
    public void update(T t) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        currentSession.setFlushMode(FlushMode.AUTO);//刷新模式为自动
        hibernateTemplate.update(t);
        hibernateTemplate.flush();//像数据库执行update操作
    }

    @Override
    public List<T> find(Criterion... criterion) {
        return this.findByCriteria(criterion);
    }



    @Override
    public void saveInfo(T t) {
        hibernateTemplate.save(t);
    }

    @Override
    public void delete(Integer id) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        currentSession.setFlushMode(FlushMode.AUTO);//刷新模式为自动
        hibernateTemplate.delete(this.getInfo((ID) id));
        hibernateTemplate.flush();//像数据库执行delete操作

    }

    @Override
    public void deleteAll(List<Integer> ids) {
        Session currentSession = this.sessionFactory.getCurrentSession();
        List<T> list = new ArrayList<>();
        for (Integer id : ids) {
            T ent = this.get((ID) id);
            list.add(ent);
        }
        currentSession.setFlushMode(FlushMode.AUTO);//刷新模式为自动
        hibernateTemplate.deleteAll(list);
        hibernateTemplate.flush();//像数据库执行delete操作
    }


    protected T model;

    private T createModel() {
        try {
            Type superClass = getClass().getGenericSuperclass();
            Type type = ((ParameterizedType) superClass).getActualTypeArguments()[0];
            Class<?> clazz = getRawType(type);
            return (T) clazz.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // type不能直接实例化对象，通过type获取class的类型，然后实例化对象
    public static Class<?> getRawType(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        } else if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Type rawType = parameterizedType.getRawType();
            return (Class) rawType;
        } else if (type instanceof GenericArrayType) {
            Type componentType = ((GenericArrayType) type).getGenericComponentType();
            return Array.newInstance(getRawType(componentType), 0).getClass();
        } else if (type instanceof TypeVariable) {
            return Object.class;
        } else if (type instanceof WildcardType) {
            return getRawType(((WildcardType) type).getUpperBounds()[0]);
        } else {
            String className = type == null ? "null" : type.getClass().getName();
            throw new IllegalArgumentException(
                    "Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type "
                            + className);
        }
    }


}
