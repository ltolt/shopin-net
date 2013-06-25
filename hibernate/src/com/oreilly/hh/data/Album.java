package com.oreilly.hh.data;
// Generated 2013-6-26 0:15:42 by Hibernate Tools 3.2.0.b9


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *       Represents an album in the music database, an organized list of tracks.
 *       @author Jim Elliott (with help from Hibernate)
 *     
 */
public class Album  implements java.io.Serializable {


     /**
	 * @Field long serialVersionUID 
	 */
	private static final long serialVersionUID = 8095902033248261086L;
	
	
	private int id;
     private String title;
     private Integer numDiscs;
     private Set<Artist> artists = new HashSet<Artist>(0);
     private Set<String> comments = new HashSet<String>(0);
     private List<AlbumTrack> tracks = new ArrayList<AlbumTrack>(0);
     /**
      * 	When the album was created
 *       
     */
     private Date added;

    public Album() {
    }

	
    public Album(String title) {
        this.title = title;
    }
    public Album(String title, Integer numDiscs, Set<Artist> artists, Set<String> comments, List<AlbumTrack> tracks, Date added) {
       this.title = title;
       this.numDiscs = numDiscs;
       this.artists = artists;
       this.comments = comments;
       this.tracks = tracks;
       this.added = added;
    }
   
    public int getId() {
        return this.id;
    }
    
    protected void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public Integer getNumDiscs() {
        return this.numDiscs;
    }
    
    public void setNumDiscs(Integer numDiscs) {
        this.numDiscs = numDiscs;
    }
    public Set<Artist> getArtists() {
        return this.artists;
    }
    
    public void setArtists(Set<Artist> artists) {
        this.artists = artists;
    }
    public Set<String> getComments() {
        return this.comments;
    }
    
    public void setComments(Set<String> comments) {
        this.comments = comments;
    }
    public List<AlbumTrack> getTracks() {
        return this.tracks;
    }
    
    public void setTracks(List<AlbumTrack> tracks) {
        this.tracks = tracks;
    }
    /**       
     *      * 	When the album was created
     *       
     */
    public Date getAdded() {
        return this.added;
    }
    
    public void setAdded(Date added) {
        this.added = added;
    }

    /**
     * toString
     * @return String
     */
     public String toString() {
	  StringBuffer buffer = new StringBuffer();

      buffer.append(getClass().getName()).append("@").append(Integer.toHexString(hashCode())).append(" [");
      buffer.append("title").append("='").append(getTitle()).append("' ");			
      buffer.append("tracks").append("='").append(getTracks()).append("' ");			
      buffer.append("]");
      
      return buffer.toString();
     }



}


