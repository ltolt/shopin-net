/**
 * 
 */
package net.shopin.zookeeper;

import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.KeeperException.Code;

/**
 * @author kongming
 *
 */
public class ZkException extends RuntimeException {
	
	protected Code code;
	
    private static final long serialVersionUID = 1L;

    public ZkException() {
        super();
    }

    public ZkException(String message, Throwable cause) {
        super(message, cause);
    }

    public ZkException(String message) {
        super(message);
    }

    public ZkException(Throwable cause) {
        super(cause);
    }
    
    public ZkException(KeeperException e){
    	code = e.code();
    }

	public Code getCode() {
		return code;
	}

	public void setCode(Code code) {
		this.code = code;
	}
   


}
