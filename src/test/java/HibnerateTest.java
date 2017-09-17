import com.utils.HibernateUtils;
import org.hibernate.Session;

public class HibnerateTest {
    public static void main(String[] args) {
        Session session = HibernateUtils.getCurrentSession();
        session.close();
    }
}
