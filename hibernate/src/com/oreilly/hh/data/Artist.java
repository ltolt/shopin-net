package com.oreilly.hh.data;
// Generated 2013-6-24 0:19:45 by Hibernate Tools 3.2.0.b9


import java.util.HashSet;
import java.util.Set;

/**
 *       Represents an artist who is associated with a track or album.
 *       @author Jim Elliott (with help from Hibernate)
 *     
 */
public class Artist  implements java.io.Serializable {


     private int id;
     private String name;
     /**
      * Tracks by this artist
     */
     private Set<Track> tracks = new HashSet<Track>(0);

    public Artist() {
    }

	
    public Artist(String name) {
        this.name = name;
    }
    public Artist(String name, Set<Track> tracks) {
       this.name = name;
       this.tracks = tracks;
    }
   
    public int getId() {
        return this.id;
    }
    
    protected void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    /**       
     *      * Tracks by this artist
     */
    public Set<Track> getTracks() {
        return this.tracks;
    }
    
    public void setTracks(Set<Track> tracks) {
        this.tracks = tracks;
    }

    /**
     * toString
     * @return String
     */
     public String toString() {
	  StringBuffer buffer = new StringBuffer();

      buffer.append(getClass().getName()).append("@").append(Integer.toHexString(hashCode())).append(" [");
      buffer.append("name").append("='").append(getName()).append("' ");			
      buffer.append("]");
      
      return buffer.toString();
     }



}


