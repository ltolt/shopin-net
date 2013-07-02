/**
 * @Probject Name: hibernate
 * @Path: com.oreilly.hhCriteriaTest.java
 * @Create By k
 * @Create In 2013-7-2 下午11:37:51
 * TODO
 */
package com.oreilly.hh;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.oreilly.hh.data.Track;

/**
 * @Class Name CriteriaTest
 * @Author k
 * @Create In 2013-7-2
 */
public class CriteriaTest {

	/**
	 * @Methods Name main
	 * @Create In 2013-7-2 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		   // Create a configuration based on the XML file we've put
        // in the standard place.
        Configuration config = new Configuration();
        config.configure();

        // Get the session factory we can use for persistence
        SessionFactory sessionFactory = config.buildSessionFactory();

        // Ask for a session using the JDBC information we've configured
        Session session = sessionFactory.openSession();

        
        //Print track titles that contain the letter "a"
        try {
			//System.out.println(queryTrack("a",session));
//			List list = queryTrackWithOther("a", session);
//			for(Object obj : list) {
//				Object[] array = (Object[]) obj;
//				System.out.println("Track:title : " + array[0] + "  playtime : "  + array[1] );
//			}
//			
			printMediaStatistics(session);
        	
        	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        
        
        
        
		
		

	}

	/**
	 * @sql selec title from track t where t.title like %a%
	 * @Methods Name queryTrack
	 * @Create In 2013-7-2 By k
	 * @param string
	 * @param session
	 * @return char[]
	 */
	public static List queryTrack(String text, Session session) {
		Criteria criteria = session.createCriteria(Track.class);
		//Restrictions 
		criteria.add(Restrictions.like("title",text,MatchMode.ANYWHERE).ignoreCase());
		//投影查询 select 特定字段
		criteria.setProjection(Projections.property("title"));
		
		return criteria.list();
	}
	
	/**
	 * @Sql  select title,playtime from track t where t.title like ....
	 * @Methods Name queryTrackWithOther
	 * @Create In 2013-7-3 By k
	 * @param text
	 * @param session
	 * @return List
	 */
	public static List queryTrackWithOther(String text, Session session) {
		Criteria criteria = session.createCriteria(Track.class);
		
		criteria.add(Restrictions.like("title",text,MatchMode.ANYWHERE).ignoreCase());
		//投影俩个字段
		criteria.setProjection(Projections.projectionList()
				   .add(Projections.property("title"))
				   .add(Projections.property("playTime")));
		return criteria.list();
	}
	
	/**
	 * @Desc
	 *        聚合查询 
	 * @Sql select sourcmedia as media,count(*), max(playtime) from tracks t order by media asc
	 * @Methods Name printMediaStatistics
	 * @Create In 2013-7-3 By k
	 * @param session void
	 */
	public static void printMediaStatistics(Session session){
		 Criteria criteria = session.createCriteria(Track.class);
		 //聚合查询 
		 criteria.setProjection(Projections.projectionList().
				 add(Projections.groupProperty("sourceMedia").as("media"))
				 .add(Projections.rowCount())
				 .add(Projections.max("playTime")));
		 criteria.addOrder(Order.asc("media").ignoreCase());
		for(Object obj : criteria.list()){
			Object[] array = (Object[]) obj;
			System.out.println(array[0] + " track count: " + array[1] +
                    "; max play time: " + array[2]);
		}
	}
	

}
