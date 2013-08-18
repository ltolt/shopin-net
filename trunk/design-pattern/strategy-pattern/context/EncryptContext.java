/**
 * 说明:
 *     加密策略上下文
 * @Probject Name: design-pattern
 * @Path: contextEncryptContext.java
 * @Create By k
 * @Create In 2013-8-18 下午6:34:55
 * TODO
 */
package context;

import java.io.File;

import strategy.EncryptStrategy;

/**
 * @Class Name EncryptContext
 * @Author k
 * @Create In 2013-8-18
 */
public class EncryptContext {

	EncryptStrategy  strategy;

	public void setStrategy(EncryptStrategy strategy) {
		this.strategy = strategy;
	}
	
	public void encryptFile(File file){
		strategy.encryptFile(file);
	}
	
	public String decryptFile(File file){
		return strategy.decryptFile(file);
	}
	
	
}
