package net.shopin.server.tutils;

public class Tomcat {

	private String progressId;

	private String path;

	public String getProgressId() {
		return progressId;
	}

	public void setProgressId(String progressId) {
		this.progressId = progressId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Tomcat [progressId=" + progressId + ", path=" + path + "]";
	}
	
	

}
