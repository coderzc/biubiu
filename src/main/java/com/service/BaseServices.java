package com.service;


import com.dao.*;
import com.entity.modelBeans.PageModel;
import com.utils.DaoFactory;
import com.utils.HibernateUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by zc on 2016/12/20.
 */

@SuppressWarnings("unchecked")
public class BaseServices<T> {

    protected UserDao userDao = DaoFactory.getInstance("userDao", UserDao.class);
    protected VideoDao videoDao = DaoFactory.getInstance("videoDao", VideoDao.class);
    protected BarrageDao barrageDao = DaoFactory.getInstance("barrageDao", BarrageDao.class);
    protected VideoLikeDao videolikeDao = DaoFactory.getInstance("videolikeDao", VideoLikeDao.class);
    protected VideoFavDao videofavDao = DaoFactory.getInstance("videofavDao", VideoFavDao.class);


    private Class<T> clazz;

    public BaseServices() {
        //通过反射机制获取子类传递过来的实体类的类型信息
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        this.clazz = (Class<T>) type.getActualTypeArguments()[0];
    }


    public boolean save(T entity) {
        Transaction tx = null;
        try {
            Session session = HibernateUtils.getCurrentSession();
            tx = session.beginTransaction();
            HibernateUtils.getCurrentSession().save(entity);
            tx.commit();
            return true;
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return false;
    }


    public boolean delete(T entity) {
        Transaction tx = null;
        try {
            Session session = HibernateUtils.getCurrentSession();
            tx = session.beginTransaction();
            HibernateUtils.getCurrentSession().delete(entity);
            tx.commit();
            return true;
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();

        }
        return false;
    }


    public boolean update(T entity) {
        Transaction tx = null;
        try {
            Session session = HibernateUtils.getCurrentSession();
            tx = session.beginTransaction();
            HibernateUtils.getCurrentSession().update(entity);
            tx.commit();
            return true;
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return false;
    }


    public T get(Serializable id) {
        T t = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            t = (T) HibernateUtils.getCurrentSession().get(clazz, id);
            tx.commit();
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return t;
    }


    public T load(Serializable id) {
        T t = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            t = (T) HibernateUtils.getCurrentSession().load(clazz, id);
            tx.commit();
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return t;
    }


    public List<T> findAll() {
        List<T> t_list = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            String hql = "select t from " + clazz.getSimpleName() + " t";
            t_list = (List<T>) HibernateUtils.getCurrentSession().createQuery(hql).list();
            tx.commit();
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return t_list;

    }


    public int totalCount() {
        int count = 0;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            String hql = "select count(t) from " + clazz.getSimpleName() + " t";
            Long temp = (Long) HibernateUtils.getCurrentSession().createQuery(hql).uniqueResult();
            if (temp != null) {
                count = temp.intValue();
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
        }
        return count;
    }


//    public int totalCount(String hql) {
//        int count = 0;
//        Transaction tx = null;
//        try {
//            tx = HibernateUtils.getCurrentSession().beginTransaction();
//            hql = "select count(*) " + hql;
//            Long temp = (Long) HibernateUtils.getCurrentSession().createQuery(hql).uniqueResult();
//            if (temp != null) {
//                count = temp.intValue();
//            }
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//            if (tx != null) {
//                tx.rollback();
//            }
//        }
//        return count;
//    }


    public PageModel<T> findByPager(int pageNo, int pageSize) {
        PageModel<T> pm = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            String hql = "select t from " + clazz.getSimpleName() + " t";
            List<T> list = (List<T>) HibernateUtils.getCurrentSession().createQuery(hql)
                    .setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
            tx.commit();
            pm = new PageModel<T>(pageNo, pageSize, totalCount(), list);
        } catch (HibernateException e) {
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
        }
        return pm;
    }


    public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object param) {
        PageModel<T> pm = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            Query query = HibernateUtils.getCurrentSession().createQuery(hql);
            query.setParameter(0, param);

            int totalCount = query.list().size();

            List<T> list = (List<T>) query
                    .setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();

//            for(T l:list){
//                String videoId = ((Videos) l).getVideoId();
//                System.out.println(videoId);
//            }

            tx.commit();

            pm = new PageModel<T>(pageNo, pageSize, totalCount, list);
        } catch (HibernateException e) {
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
        }
        return pm;
    }

    public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object... params) {
        PageModel<T> pm = null;
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            Query query = HibernateUtils.getCurrentSession().createQuery(hql);
            for (int i = 0; i < params.length; ++i) {
                query.setParameter(i, params[i]);
            }

            int totalCount = query.list().size();

            List<T> list = (List<T>) query
                    .setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
            tx.commit();
            pm = new PageModel<T>(pageNo, pageSize, totalCount, list);
        } catch (HibernateException e) {
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
        }
        return pm;
    }


}
