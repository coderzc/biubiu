package com.service;

import com.entity.VideoLike;
import com.entity.Videos;
import com.entity.modelBeans.PageModel;
import com.utils.HibernateUtils;
import com.utils.PropertiesUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by zc on 2016/12/20.
 */
public class VideoService extends BaseServices<Videos> {

    @Override//添加视频
    public boolean save(Videos entity) {
        return super.save(entity);
    }

    @Override//删除视频
    public boolean delete(Videos entity) {
        return super.delete(entity);
    }

    @Override//更新视频
    public boolean update(Videos entity) {
        return super.update(entity);
    }

    @Override//获取视频
    public Videos get(Serializable id) {
        return super.get(id);
    }

    @Override//所有视频列表
    public List<Videos> findAll() {
        return super.findAll();
    }


    //增加视频观看次数
    public boolean addWatchCount(Videos video) {
        Transaction tx = null;
        try {
            Session session = HibernateUtils.getCurrentSession();
            tx = session.beginTransaction();
            if (video != null) {
                video.setVideoWatchCount((Integer) video.getVideoWatchCount() + 1);
                videoDao.update(video);
                tx.commit();
                return true;
            }
        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return false;

    }


    //获取视频信息(加载视频up主信息)
    public Videos getVideo_info(String video_id) {
        Transaction tx = null;
        try {
            Session session = HibernateUtils.getCurrentSession();
            tx = session.beginTransaction();
            Videos video = videoDao.get(video_id);

            if (video != null) {
                String up_user = video.getUp_user().getUserName();//通过访问属性加载用户对象
                Set<VideoLike> video_likeSet = video.getVideo_likeSet();
                video_likeSet.size();
            }

            tx.commit();

            video.setVideoPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoPath());
            video.setVideoCoverPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoCoverPath());
            return video;

        } catch (Exception ce) {
            if (tx != null) {
                tx.rollback();
            }
            ce.printStackTrace();
        }
        return null;
    }

    //根据页码获取视频分页模型
    public PageModel<Videos> videosPageModel(int pageNo, int pageSize) {
        PageModel<Videos> byPager = super.findByPager(pageNo, pageSize);
        Iterator<Videos> iterator = byPager.getDatas().iterator();
        while (iterator.hasNext()) {
            Videos video = iterator.next();
            video.setVideoPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoPath());
            video.setVideoCoverPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoCoverPath());
        }
        return byPager;
    }


    //根据类型,页码获取视频分页模型
    public PageModel<Videos> classify(PageModel<Videos> pageModel, String videoType) {

        String hql = "from Videos v where v.videoType=? order by v.videoWatchCount DESC,v.videoId ASC";
        PageModel<Videos> byPager = super.findByPager
                (pageModel.getPageNo(), pageModel.getPageSize(), hql, videoType);

        Iterator<Videos> iterator = byPager.getDatas().iterator();
        while (iterator.hasNext()) {
            Videos video = iterator.next();
            video.setVideoPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoPath());
            video.setVideoCoverPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoCoverPath());
        }

        return byPager;

    }

    //根据类型,页码获取视频分页模型
    public PageModel<Videos> soso(PageModel<Videos> pageModel, String keyword) {

        keyword = keyword.replace("%", "\\%").replace("_", "\\_");

        String hql = "from Videos v where v.videoTitle like ? order by v.videoWatchCount DESC,v.videoId ASC";

        PageModel<Videos> byPager = super.findByPager
                (pageModel.getPageNo(), pageModel.getPageSize(), hql, "%" + keyword + "%");
        Iterator<Videos> iterator = byPager.getDatas().iterator();
        while (iterator.hasNext()) {
            Videos video = iterator.next();
            video.setVideoPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoPath());
            video.setVideoCoverPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video.getVideoCoverPath());
        }

        return byPager;


    }

}
