package com.utils;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.Session;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.type.Type;

import java.io.Serializable;
import java.util.Properties;

/**
 * 类名称：      GeneratePK
 * 类描述：     在hibernate的基础上自动生成自定义的主键
 * 创建人：     andy_lj
 * 创建时间：2012-08-10 上午11:40:50
 * 修改备注：
 */

public class IDGenerator implements Configurable, IdentifierGenerator {

    public String sign;// av00000001中的av
    public String classname; //实体类的类名
    public String pk;//主键名字
    public String idLength;//av00000001的长度(后面的数字序列的长度)

    /**
     * 取得 ***.hbm.xml中的自定义的值
     */
    @Override
    public void configure(Type arg0, Properties arg1, Dialect arg2)
            throws MappingException {
        this.classname = arg1.getProperty("classname");
        this.pk = arg1.getProperty("pk");
        this.sign = arg1.getProperty("sign");
        this.idLength = arg1.getProperty("idLength");
    }

    /**
     * 生成主键
     */
    @Override
    public Serializable generate(SessionImplementor arg0, Object arg1)
            throws HibernateException {

        //获得主键数字序列的长度
        int leng = Integer.valueOf(idLength);

        String random_pk = null;

        Session session = HibernateUtils.getCurrentSession();//打开session
        do {
            random_pk = CreateId.OneId(leng);

        } while (session.get(classname, random_pk) != null);

        return sign + random_pk;

    }

}
