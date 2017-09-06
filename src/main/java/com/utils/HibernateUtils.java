/**
 *
 */
package com.utils;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * @author zc
 *         工具类
 */
public class HibernateUtils {

    private static SessionFactory sessionFactory;
    private static Session session;

    static {
        try {
            Configuration configiguration = new Configuration().configure();
            ServiceRegistryBuilder builder = new ServiceRegistryBuilder().applySettings(configiguration.getProperties());
            ServiceRegistry registry = builder.buildServiceRegistry();
            sessionFactory = configiguration.buildSessionFactory(registry);
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    private HibernateUtils() {

    }

//	public static SessionFactory getSessionFactory(){
//		return sessionFactory;
//	}

    /**
     * 获取session对象
     */
    public static Session getSession() {
        return sessionFactory.openSession();
    }


    /**
     * 获取当前线程中的session对象
     */
    public static Session getCurrentSession() {return sessionFactory.getCurrentSession();}


    /**
     * 关闭session对象
     */
    public static void closeSession() {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }


    public static void closeSession(Session session) {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }
}
