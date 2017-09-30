import com.action.LiveAction;
import com.entity.Barrages;
import com.entity.Users;
import com.entity.Videos;
import com.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.HashMap;

public class HibnerateTest {
    public static void main(String[] args) {
//        Session session = HibernateUtils.getCurrentSession();
//        Transaction tx = session.beginTransaction();
//        try {
//
//            Barrages barrages = new Barrages();
//            barrages.setBarr_user((Users) HibernateUtils.getCurrentSession().get(Users.class, "13061282767"));
//            barrages.setBarrage_video((Videos) HibernateUtils.getCurrentSession().get(Videos.class, "av62813213"));
//            barrages.setBarrageColor("#ffffff");
//            barrages.setBarrageFontSize(22);
//            barrages.setBarrageSpeed(190);
//            barrages.setBarrageContent("lalallalallalalalal");
//            barrages.setVideoTimePrint((float) 134.970927);
//            session.save(barrages);
//            tx.commit();
//        } catch (Exception ce) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            ce.printStackTrace();
//        }


    }

}