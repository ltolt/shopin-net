package com.oreilly.hh;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

import com.oreilly.hh.data.*;

import java.sql.Time;
import java.util.*;

/**
 * Create sample data, letting Hibernate persist it for us.
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
      found = new Artist(name, new HashSet<Track>(), null);
      session.save(found);
    }
    if (found != null && found.getActualArtist() != null) {
      return found.getActualArtist();
    }
    return found;
  }

  /**
   * Utility method to associate an artist with a track
   */
  private static void addTrackArtist(Track track, Artist artist) {
    track.getArtists().add(artist);
  }

  public static void main(String args[]) throws Exception {
      // Create a configuration based on the XML file we've put
      // in the standard place.
      Configuration config = new Configuration();
      config.configure();

    // Get the session factory we can use for persistence
    SessionFactory sessionFactory = config.buildSessionFactory();

    // Ask for a session using the JDBC information we've configured
    Session session = sessionFactory.openSession();
    Transaction tx = null;
    try {
      // Create some data and persist it
      tx = session.beginTransaction();

      Track track = new Track("Russian Trance",
                              "vol2/album610/track02.mp3",
                              Time.valueOf("00:03:30"),
                              new HashSet<Artist>(),
                              new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("PPK", true, session));
      session.save(track);

      track = new Track("Video Killed the Radio Star",
                        "vol2/album611/track12.mp3",
                        Time.valueOf("00:03:49"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("The Buggles", true, session));
      session.save(track);
            
      track = new Track("Gravity's Angel",
                        "vol2/album175/track03.mp3",
                        Time.valueOf("00:06:06"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("Laurie Anderson", true, session));
      session.save(track);

      track = new Track("Adagio for Strings (Ferry Corsten Remix)",
                        "vol2/album972/track01.mp3",
                        Time.valueOf("00:06:35"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("William Orbit", true, session));
      addTrackArtist(track, getArtist("Ferry Corsten", true, session));
      addTrackArtist(track, getArtist("Samuel Barber", true, session));
      session.save(track);

      track = new Track("Adagio for Strings (ATB Remix)",
                        "vol2/album972/track02.mp3",
                        Time.valueOf("00:07:39"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("William Orbit", true, session));
      addTrackArtist(track, getArtist("ATB", true, session));
      addTrackArtist(track, getArtist("Samuel Barber", true, session));
      session.save(track);

      track = new Track("The World '99",
                        "vol2/singles/pvw99.mp3",
                        Time.valueOf("00:07:05"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      addTrackArtist(track, getArtist("Pulp Victim", true, session));
      addTrackArtist(track, getArtist("Ferry Corsten", true, session));
      session.save(track);

      track = new Track("Test Tone 1",
                        "vol2/singles/test01.mp3",
                        Time.valueOf("00:00:10"), new HashSet<Artist>(),
                        new Date(), (short)0, new HashSet<String>());
      track.getComments().add("Pink noise to test equalization");
      session.save(track);

      // We're done; make our changes permanent
      tx.commit();

    } catch (Exception e) {
      if (tx != null) {
        // Something went wrong; discard all partial changes
        tx.rollback();
      }
      throw new Exception("Transaction failed", e);
    } finally {
      // No matter what, close the session
     session.close();
    }

    // Clean up after ourselves
    sessionFactory.close();
  }
}
