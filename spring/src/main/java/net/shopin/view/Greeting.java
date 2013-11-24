/**
 * @Probject Name: spring
 * @Path: net.shopin.view.Greeting.java
 * @Create By kongm
 * @Create In 2013-11-22 下午5:49:55
 * TODO
 */
package net.shopin.view;

/**
 * @Class Name Greeting
 * @Author kongm
 * @Create In 2013-11-22
 */
public class Greeting {
	
    
	private final long id;
	private final String content;
	
	public Greeting(long id, String content) {
		this.id = id;
		this.content = content;
	}

	public long getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

    @Override
    public String toString()
    {
        return "Greeting [id=" + id + ", content=" + content + "]";
    }
	
	

}
