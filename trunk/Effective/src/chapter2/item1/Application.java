/**
 * @Probject Name: Effective
 * @Path: chapter2.item1.Application.java
 * @Create By kongm
 * @Create In 2013-8-5 ÏÂÎç3:02:35
 * TODO
 */
package chapter2.item1;

import java.util.HashMap;

/**
 * @Class Name Application
 * @Author kongm
 * @Create In 2013-8-5
 */
public class Application {
	
	private static Provider ARMED_PROVIDER = new Provider() {
		@Override
		public Service newService() {
			return new Service() {
				@Override
				public String toString() {
					return "Armed service";
				};
			};
		}
	};
	
	
	private static Provider COMP_PROVIDER = new Provider() {
		
		@Override
		public Service newService() {
			return new Service() {
				@Override
				public String toString() {
					return "Complementary service";
				};
			};
		}
	};
	
	
	private static Provider DEFAULT_PROVIDER = new Provider() {
		@Override
		public Service newService() {
			return new Service() {
				@Override
				public String toString() {
					return "Default service";
				};
			};
		}
	};
	

	/**
	 * @Methods Name main
	 * @Create In 2013-8-5 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//providers would execute these lines
		Services.registerDefaultProvider(DEFAULT_PROVIDER);
		Services.registerProvider("comp", COMP_PROVIDER);
		Services.registerProvider("armed",ARMED_PROVIDER);
		//clients Would execute these lines
		Service s1 = Services.newInstance();
		Service s2 = Services.newInstance("comp");
		Service s3 = Services.newInstance("armed");
		System.out.printf("%s,%s,%s%n",s1,s2,s3);
		
		
		
		
		
		
		
		
		
		

	}

}
