package com.dao.impl;

import com.dao.BaseDao;
import com.entity.modelBeans.PageModel;
import com.utils.HibernateUtils;
import org.hibernate.Query;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;


/**
 * @author zc
 * 通用DAO接口的实现类
 */

@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

    private Class<T> clazz;

    public BaseDaoImpl() {
        //通过反射机制获取子类传递过来的实体类的类型信息
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        this.clazz = (Class<T>) type.getActualTypeArguments()[0];

    }

    @Override
    public void save(T entity) {
        HibernateUtils.getCurrentSession().save(entity);
    }

    @Override
    public void delete(T entity) {
        HibernateUtils.getCurrentSession().delete(entity);
    }

    @Override
    public void update(T entity) {
        HibernateUtils.getCurrentSession().update(entity);
    }

    @Override
    public T get(Serializable id) {
        return (T) HibernateUtils.getCurrentSession().get(clazz, id);
    }

    @Override
    public T load(Serializable id) {
        return (T) HibernateUtils.getCurrentSession().load(clazz, id);
    }

    @Override
    public List<T> findAll() {
        String hql = "select t from " + clazz.getSimpleName() + " t";
        return (List<T>) HibernateUtils.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public <T> List<T> findList(String hql, Object... params) {
        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        return (List<T>) query.list();
    }

    @Override
    public <T> List<T> findList(String hql, Map<String, Object> params) {
        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        query.setProperties(params);
        return (List<T>) query.list();
    }

    @Override
    public <T> List<T> findList(String hql, Object param) {
        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        query.setParameter(0, param);
        return (List<T>) query.list();
    }

    @Override
    public int totalCount() {
        int count = 0;
        String hql = "select count(t) from " + clazz.getSimpleName() + " t";
        Long temp = (Long) HibernateUtils.getCurrentSession().createQuery(hql).uniqueResult();
        if (temp != null) {
            count = temp.intValue();
        }
        return count;
    }

    @Override
    public int totalCount(String hql, Object... params) {
        int count = 0;
        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        Long temp = (Long) query.uniqueResult();
        if (temp != null) {
            count = temp.intValue();
        }
        return count;
    }


    @Override
    public PageModel<T> findByPager(int pageNo, int pageSize) {
        String hql = "select t from " + clazz.getSimpleName() + " t";
        List<T> list = (List<T>) HibernateUtils.getCurrentSession().createQuery(hql).setFirstResult((pageNo - 1)*pageSize).setMaxResults(pageSize).list();
        PageModel<T> pm = new PageModel<T>(pageNo, pageSize, totalCount(), list);
        return pm;
    }

    @Override
    public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object param) {

        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        query.setParameter(0, param);
        int totalCount = query.list().size();
        List<T> list = (List<T>) query.setFirstResult((pageNo - 1)*pageSize).setMaxResults(pageSize).list();
        PageModel<T> pm = new PageModel<T>(pageNo, pageSize,totalCount, list);
        return pm;
    }

    @Override
    public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object... params) {
        Query query = HibernateUtils.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        int totalCount = query.list().size();

        List<T> list = (List<T>) query.setFirstResult((pageNo - 1)*pageSize).setMaxResults(pageSize).list();
        PageModel<T> pm = new PageModel<T>(pageNo, pageSize, totalCount, list);
        return pm;
    }
}
