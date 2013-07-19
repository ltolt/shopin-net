/**
 * ≤‚ ‘¿‡
 * @Probject Name: framework
 * @Path: base.framework.beans.Demo.java
 * @Create By kongm
 * @Create In 2013-7-15 œ¬ŒÁ3:15:02
 * TODO
 */
package base.framework.beans;

/**
 * @Class Name Demo
 * @Author kongm
 * @Create In 2013-7-15
 */
public class Demo {
	private String id;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Demo [id=" + id + ", name=" + name + "]";
	}
	
	
	

}
