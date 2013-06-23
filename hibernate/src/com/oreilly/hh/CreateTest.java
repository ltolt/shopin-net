/**
 * @Probject Name: ch01
 * @Path: com.oreilly.hhCreateTest.java
 * @Create By k
 * @Create In 2013-6-23 下午4:51:33
 * TODO
 */
package com.oreilly.hh;

import java.sql.Time;
import java.util.Date;
import java.util.HashSet;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.oreilly.hh.data.Artist;
import com.oreilly.hh.data.Track;

/**
 * 说明:hibernate持久化示例
 * @Class Name CreateTest
 * @Author k
 * @Create In 2013-6-23
 */
public class CreateTest {
	
	/**
	   * Look up an artist record given a name.
	   * @param name the name of the artist desired.
	   * @param create controls whether a new record should be created if
	   *        the specified artist is not yet in the database.
	   * @param session the Hibernate session that can retrieve data
	   * @return the artist with the specified name, or <code>null</code> if no
	   *         such artist exists and <code>create</code> is <code>false</code>.
	   */
	  public static Artist getArtist(String name, boolean create, Session session)
	  {
	    Query query = session.getNamedQuery("com.oreilly.hh.artistByName");
	    query.setString("name", name);
	    Artist found = (Artist)query.uniqueResult();
	    if (found == null && create) {
	      found = new Artist(name, new HashSet<Track>());
	      session.save(found);
	    }
	    return found;
	  }
	
	public static void main(String[] args) throws Exception {
		//create a configuration based on the xml file 
		//we have put in the standard place
		Configuration  config = new Configuration();
		config.configure();
		//get the sessionfactory we can use for persistence
		SessionFactory sessionFactory = config.buildSessionFactory();
		
		//ask for a session using the jdbc information 
		//we have config
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try {
			
			 // Create some data and persist it
		      tx = session.beginTransaction();
		      
		       Track track = new Track("Russian Trance", "vol2/album610/track02.mp3", Time.valueOf("00:03:30"), new Date(), (short)0, new HashSet(),new HashSet());
		       addTrackArtist(track, getArtist("PPK", true, session));
		       addTrackArtist(track, getArtist("Laurie Anderson", true, session));
		       track.getComments().add("green day ");
		       session.save(track);
		       
		       track = new Track("Video Killed the Radio Star", "vol2/album611/track12.mp3", Time.valueOf("00:03:30"), new Date(), (short)0, new HashSet(),new HashSet());
		       
		       addTrackArtist(track, getArtist("Laurie Anderson", true, session));
		       addTrackArtist(track, getArtist("Ferry Corsten", true, session));
		       addTrackArtist(track, getArtist("Samuel Barber", true, session));
		       
		       session.save(track);
		       
		       track = new Track("super star", "vol2/album611/track01.mp3", Time.valueOf("00:05:30"), new Date(), (short)0, new HashSet(),new HashSet()); 
		       addTrackArtist(track, getArtist("Laurie Anderson", true, session));
		       session.save(track);
			
			 	tx.commit();
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			if(tx!=null){
				//// Something went wrong; discard all partial changes
				tx.rollback();
			}
			throw new Exception("transaction failed",e);
		}finally{
			// No matter what, close the session
            session.close();
		}
		
		  // Clean up after ourselves
        sessionFactory.close();
		
		
	}
	
	
	
	
	
	

	  /**
	   * Utility method to associate an artist with a track
	   */
	  private static void addTrackArtist(Track track, Artist artist) {
	    track.getArtists().add(artist);
	  }
	
	
	
	
	
	
	

}
