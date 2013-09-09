/**
 * @Probject Name: framework
 * @Path: ex.ex03.connector.httpHttpRequestLine.java
 * @Create By kimi
 * @Create In 2013年9月9日 上午12:38:20
 * TODO
 */
package ex.ex03.connector.http;

/**
 * Http request enum type
 * 
 * @Class Name HttpRequestLine
 * @Author kimi
 * @Create In 2013年9月9日
 */
final class HttpRequestLine {

	// --------------------------------constants
	public static final int INITIAL_METHOD_SIZE = 8;
	public static final int INITIAL_URI_SIZE = 64;
	public static final int INITIAL_PROTOCOL_SIZE = 8;
	public static final int MAX_METHOD_SIZE = 1024;
	public static final int MAX_URI_SIZE = 32768;
	public static final int MAX_PROTOCOL_SIZE = 1024;
	
	 // ----------------------------------------------------- Instance Variables
	public char[] method;
	public int methodEnd;
	public char[] uri;
	public int uriEnd;
	public char[] protocol;
	public int protocolEnd;
	//------------constructors
	
	
	public HttpRequestLine(char[] method,int methodEnd,
			                char[] uri,int uriEnd,char[] protocol,int protocolEnd ) {
		this.method = method;
		this.methodEnd = methodEnd;
		this.uri = uri;
		this.uriEnd = uriEnd;
		this.protocol = protocol;
		this.protocolEnd = protocolEnd;
	}


	public HttpRequestLine() {
		this(new char[INITIAL_METHOD_SIZE],0,new char[INITIAL_URI_SIZE],0,
				new char[INITIAL_PROTOCOL_SIZE],0);
	}
	 // --------------------------------------------------------- Public Methods
	/**
	 * release all objects ref and initialize instance var 
	 * @Methods Name recycle
	 * @Create In 2013年9月9日 By kimi void
	 */
	public void recycle(){
		methodEnd = 0;
		uriEnd = 0;
		protocolEnd  = 0;
	}
	
	public int indexOf(char[] buf,int end){
		char firstChar = buf[0];
		int pos = 0;
		while(pos < uriEnd){
			pos = indexOf(firstChar, pos);
			if (pos == -1)
                return -1;
            if ((uriEnd - pos) < end)
                return -1;
            for (int i = 0; i < end; i++) {
                if (uri[i + pos] != buf[i])
                    break;
                if (i == (end-1))
                    return pos;
            }
            pos++;
		}
		return -1;
	}
	public int indexOf(char[] buf){
		return indexOf(buf, buf.length);
	}
	

	
    /**
     * Returns the index of a character in the value.
     */
    public int indexOf(char c, int start) {
        for (int i=start; i<uriEnd; i++) {
            if (uri[i] == c)
                return i;
        }
        return -1;
    }
	
    
    
    /**
     * Test if the value of the header includes the given string.
     */
    public int indexOf(String str) {
        return indexOf(str.toCharArray(), str.length());
    }

    // --------------------------------------------------------- Object Methods


    public int hashCode() {
        // FIXME
        return 0;
    }


    public boolean equals(Object obj) {
        return false;
    }
}



