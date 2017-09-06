/**
 * 
 */
package com.Interceptor;

import com.utils.HibernateUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import java.io.IOException;



/**
 * @author slw
 * 通过过滤器实现OSIV模式
 */
public class OSIVFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Session session=null;
		Transaction tx=null;
		
		try{
			session= HibernateUtils.getCurrentSession();
			
			tx=session.beginTransaction();
			
			arg2.doFilter(arg0, arg1);
			
			tx.commit();
			
		}catch(HibernateException ce){
				tx.rollback();
				throw ce;
		}
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
