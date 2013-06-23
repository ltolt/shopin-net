/**
 * @Probject Name: ch01
 * @Path: com.oreilly.hhQueryTest.java
 * @Create By k
 * @Create In 2013-6-23 下午5:53:45
 * TODO
 */
package com.oreilly.hh;

import java.sql.Time;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.oreilly.hh.data.Artist;
import com.oreilly.hh.data.Track;

/**
 * 说明: 检索数据对象
 * @Class Name QueryTest
 * @Author k
 * @Create In 2013-6-23
 */
public class QueryTest {
	
	
	public static void main(String[] args) {
		// Create a configuration based on the properties file we've put
        // in the standard place.
        Configuration config = new Configuration();
        config.configure();

        // Get the session factory we can use for persistence
        SessionFactory sessionFactory = config.buildSessionFactory();

        // Ask for a session using the JDBC information we've configured
        Session session = sessionFactory.openSession();
        try {
        	 // Print the tracks that will fit in five minutes
        	List tracks = tracksNoLongerThan(Time.valueOf("00:10:00"),session); 
        	for(ListIterator iter = tracks.listIterator();iter.hasNext();){
        		Track aTrack = (Track) iter.next();
        		System.out.println("Track:" + aTrack.getTitle() + "," + listArtistNames(aTrack.getArtists()) + "," + aTrack.getPlayTime() );
        	}
        	
        	
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
            // No matter what, close the session
            session.close();
        }
     // Clean up after ourselves
        sessionFactory.close();
        

	}
	 /**
     * Build a parenthetical, comma-separated list of artist names.
     * @param artists the artists whose names are to be displayed.
     * @return the formatted list, or an empty string if the set was empty.
     */
	private static String listArtistNames(Set<Artist> artists) {
		StringBuilder result = new StringBuilder();
		for(Artist  artist : artists){
			result.append((result.length()==0)?"(":", ");
			result.append(artist.getName());
		}
		if(result.length()>0){
			result.append(") "); 
		}
		
		return result.toString();
	}
	/**
     * Retrieve any tracks that fit in the specified amount of time.
     *
     * @param length the maximum playing time for tracks to be returned.
     * @param session the Hibernate session that can retrieve data.
     * @return a list of {@link Track}s meeting the length restriction.
     */
	private static List tracksNoLongerThan(Time length, Session session) {
//		Query query = session.createQuery("from Track t where t.playTime <= ?");
//		query.setParameter(0, length, Hibernate.TIME);
		Query query = session.getNamedQuery("com.oreilly.hh.tracksNoLongerThan");
		query.setTime("length", length);
		return query.list();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
