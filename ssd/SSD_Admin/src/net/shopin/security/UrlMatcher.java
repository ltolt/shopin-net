package net.shopin.security;

/**
 * Strategy for deciding whether configured path matches a submitted candidate URL.
 *
 * @author Luke Taylor
 * @version $Id: UrlMatcher.java 2673 2008-02-28 19:29:33Z luke_t $
 * @since 2.0
 */
public interface UrlMatcher {

    Object compile(String urlPattern);

    boolean pathMatchesUrl(Object compiledUrlPattern, String url);

    /** Returns the path which matches every URL */
    String getUniversalMatchPattern();

    /**
     * Returns true if the matcher expects the URL to be converted to lower case before
     * calling {@link #pathMatchesUrl(Object, String)}.
     */
    boolean requiresLowerCaseUrl();
}
