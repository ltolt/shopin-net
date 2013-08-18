/**
 * 说明:
 *     策略模式中的策略
 *     加密解密文件
 * @Probject Name: design-pattern
 * @Path: strategyEncryptStrategy.java
 * @Create By k
 * @Create In 2013-8-18 下午6:16:40
 * TODO
 */
package strategy;

import java.io.File;

/**
 * @Class Name EncryptStrategy
 * @Author k
 * @Create In 2013-8-18
 */
public interface EncryptStrategy {
	
	void encryptFile(File file);
	
	String decryptFile(File file);
	
	

}
