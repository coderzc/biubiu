package com.service;

import com.entity.Barrages;
import com.utils.HibernateUtils;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

/**
 * Created by zc on 2016/12/20.
 */
public class BarrageService extends BaseServices<Barrages> {

    @Override
    public boolean save(Barrages entity) {
        return super.save(entity);
    }

    @Override
    public boolean delete(Barrages entity) {
        return super.delete(entity);
    }

    @Override
    public boolean update(Barrages entity) {
        return super.update(entity);
    }

    @Override
    public Barrages get(Serializable id) {
        return super.get(id);
    }



    //获得弹幕列表(按时间排序)
    public List<Barrages> queryByVideo(String video_id) {
        Transaction tx=null;
        try{
            tx= HibernateUtils.getCurrentSession().beginTransaction();
            String hql = "from Barrages b where b.barrage_video.videoId=? order by b.barrageCreateTime asc";

            List<Barrages> list = barrageDao.findList(hql, video_id);

            tx.commit();

            return list;

        }catch(Exception ce){
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return null;
    }


    //获得弹幕数
    public int queryCountByVideo(String video_id) {
        Transaction tx = null;
        try {
            tx = HibernateUtils.getCurrentSession().beginTransaction();
            String hql = "select count(*) from Barrages b where b.barrage_video.videoId=? order by b.barrageCreateTime asc";

            int count = barrageDao.totalCount(hql, video_id);

            tx.commit();

            return count;

        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return -1;
    }
}
