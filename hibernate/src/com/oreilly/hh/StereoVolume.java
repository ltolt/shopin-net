package com.oreilly.hh;

import java.io.Serializable;

/**
 * A simple structure encapsulating a stereo volume level.
 */
public class StereoVolume implements Serializable {
    
    /**
     * Required by the Serializable Interface
     */
    private static final long serialVersionUID = -2401009009408708615L;
    
    /**
     * The minimum legal volume level.
     */
    public static final short MINIMUM = 0;

    /**
     * The maximum legal volume level.
     */
    public static final short MAXIMUM = 100;

    /**
     * Stores the volume of the left channel.
     */
    private short left;

    /**
     * Stores the volume of the right channel.
     */
    private short right;

    /**
     * Default constructor sets full volume in both channels.
     */
    public StereoVolume() {
        this(MAXIMUM, MAXIMUM);
    }

    /**
     * Constructor that establishes specific volume levels.
     *
     * @param left the volume of the left channel.
     * @param right the volume of the right channel.
     * @throws IllegalArgumentException if a volume is out of range.
     */
    public StereoVolume(short left, short right) {
        setLeft(left);
        setRight(right);
    }

    /**
     * Helper method to make sure a volume value is legal.
     * @param volume the level that is being set.
     * @throws IllegalArgumentException if it is out of range.
     */
    private void checkVolume(short volume) {
        if (volume < MINIMUM) {
            throw new IllegalArgumentException("volume cannot be less than " +
                                               MINIMUM);
        }
        if (volume > MAXIMUM) {
            throw new IllegalArgumentException("volume cannot be more than " +
                                               MAXIMUM);
        }
    }

    /**
     * Set the volume of the left channel.
     * @param volume level to which the left channel is being set.
     * @throws IllegalArgumentException if it is out of range.
     */
    public void setLeft(short volume) {
        checkVolume(volume);
        left = volume;
    }

    /**
     * Set the volume of the right channel.
     *
     * @param volume level to which the right channel is being set.
     * @throws IllegalArgumentException if it is out of range.
     */
    public void setRight(short volume) {
        checkVolume(volume);
        right = volume;
    }

    /**
     * Get the volume of the left channel
     *
     * @return the current volume level of the channel.
     */
    public short getLeft() {
        return left;
    }

    /**
     * Get the volume of the right channel.
     *
     * @return the current volume level of the channel.
     */
    public short getRight() {
        return right;
    }

    /**
     * Format a readable version of the volume levels, for debugging.
     */
    public String toString() {
        return "Volume[left=" + left + ", right=" + right + ']';
    }

    /**
     * Compare whether another object is equal to this one, following the
     * contract established by {@link Object}.
     *
     * @param obj the object to be compared.
     * @return true if obj is also a StereoVolume instance, and represents
     *         the same volume levels.
     */
    public boolean equals(Object obj) {
        if (obj instanceof StereoVolume) {
            StereoVolume other = (StereoVolume)obj;
            return other.getLeft() == getLeft() &&
                other.getRight() == getRight();
        }
        return false;  // It wasn't a StereoVolume
    }

    /**
     * Returns a hash code value for the StereoVolume. This method must be
     * consistent with the {@link #equals} method.
     */
    public int hashCode() {
        return (int)getLeft() * MAXIMUM * 10 + getRight();
    }
}
       
