/*
 * JTsumego Project - SourceMedi.java
 * Created by Jim Elliott on Jun 24, 2007 9:47:30 PM
 *
 * Copyright © 2004 James Jay Elliott. All rights reserved.
 */
package com.oreilly.hh;

/**
 * This is a typesafe enumeration that identifies the media on which an
 * item in our music database was obtained.
 * 
 * @author Jim Elliott
 */
public enum SourceMedia {
    /**
     * Music obtained from magnetic cassette tape.
     */
    CASSETTE("Audio Cassette Tape"),
    
    /**
     * Music obtained from a vinyl record.
     */
    VINYL("Vinyl Record"),
    
    /**
     * Music obtained from VHS tapes.
     */
    VHS("VHS Videocassette tape"),
    
    /**
     * Music obtained from a broadcast.
     */
    BROADCAST("Analog Broadcast"),
    
    /**
     * Music obtained from a digital compact disc.
     */
    CD("Compact Disc"),
    
    /**
     * Music obtained as an Internet download.
     */
    DOWNLOAD("Internet Download"),
    
    /**
     * Music obtained from a digital audio stream.
     */
    STREAM("Digital Audio Stream");
    
    /**
     * Stores the human-readable description of this instance, by which it is
     * identified in the user interface.
     */
    private final String description;
    
    /**
     * Enum constructors are always private since they can only be accessed
     * through the enumeration mechanism.
     * 
     * @param description human readable description of the source for the
     *        audio, by which it is presented in the user interface.
     */
    private SourceMedia(String description) {
        this.description = description;
    }
    
    /**
     * Return the description associated with this enumeration instance.
     * 
     * @return the human-readable description by which this value is
     *         identified in the user interface.
     **/
    public String getDescription() {
        return description;
    }
    
}
