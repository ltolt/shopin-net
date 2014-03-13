
package com.interface21.context.support;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.interface21.beans.BeansException;
import com.interface21.beans.factory.BeanFactory;
import com.interface21.beans.factory.ListableBeanFactory;
import com.interface21.beans.factory.NoSuchBeanDefinitionException;
import com.interface21.beans.factory.support.*;
import com.interface21.beans.factory.support.XmlBeanFactory;
import com.interface21.context.ApplicationContext;
import com.interface21.context.ApplicationContextException;
import java14.java.util.logging.Level;
 
/**
 * Convenient abstract superclass for ApplicationContext implementations
 * drawing their configuration from XML documents containing bean definitions
 * understood by an XMLBeanFactory
 * @see com.interface21.beans.factory.xml.XMLBeanFactory
 * @author  Rod Johnson
 * @version $Revision: 1.1.1.1 $
 */
public abstract class AbstractXmlApplicationContext extends AbstractApplicationContext  {

	//---------------------------------------------------------------------
	// Instance data
	//---------------------------------------------------------------------
	/** Default BeanFactory for this context */
	private ListableBeanFactory listableBeanFactory; 


	//---------------------------------------------------------------------
	// Constructors
	//---------------------------------------------------------------------
	public AbstractXmlApplicationContext() {
	}
	
	public AbstractXmlApplicationContext(ApplicationContext parent) {
		super(parent);
	}
	
	//---------------------------------------------------------------------
	// Implementation of WebApplicationConfig
	//---------------------------------------------------------------------
	protected void refreshBeanFactory() throws ApplicationContextException {
		String identifier = "application context with display name [" + getDisplayName() + "'";
		InputStream is = null;
		try {
			// Supports remote as well as local URLs
			is = getInputStreamForBeanFactory();
			DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc = db.parse(is);
			parseDocument(doc);
		}
		catch (ParserConfigurationException ex) {
			throw new ApplicationContextException("ParserConfiguration exception for " + identifier, ex);
		}
		catch (SAXException ex) {
			throw new ApplicationContextException("XML document is invalid for " + identifier, ex);
		}
		catch (IOException ex) {
			throw new ApplicationContextException("IOException parsing XML document for " + identifier, ex);
		} 
		finally {
			try {
				if (is != null)
					is.close();
			}
			catch (IOException ex) {
				throw new ApplicationContextException("IOException closing stream for XML document for " + identifier, ex);
			}
		}
	}   // refresh
	


	/** Build URL mappings etc. from Document
	 **/
	private void parseDocument(Document doc) throws ApplicationContextException {
		Element root = doc.getDocumentElement();
		//log4jCategory.debug("Parsed XML configuration from well-formed '" + getURL() + "': processing document...");

		try {
			listableBeanFactory = new XmlBeanFactory(doc);
			logger.config("**** BeanFactory for application config is [" + listableBeanFactory + "]");
		}
		catch (NoSuchBeanDefinitionException ex) {
			String mesg = "Cannot load configuration from: missing bean definition [" + ex.getBeanName() + "]";
			logger.logp(Level.SEVERE, getClass().getName(), "parseDocument", mesg, ex);
			throw new ApplicationContextException(mesg, ex);
		}
		catch (BeansException ex) {
			String mesg = "Cannot load configuration: problem instantiating or initializing beans (" + ex + ")";
			logger.logp(Level.SEVERE, getClass().getName(), "parseDocument", mesg, ex);
			throw new ApplicationContextException(mesg, ex);
		}
	}   // parseDocument
 

	/** Return the default BeanFactory for this context
	 * @return the default BeanFactory for this context
	 */
	public final ListableBeanFactory getBeanFactory() {
		return listableBeanFactory;
	}

	/**
	 * Open and return the input stream for the bean factory for this namespace. 
	 * If namespace is null, return the input stream for the default bean factory.
	 * @throw IOException if the required XML document isn't found
	 */
	protected abstract InputStream getInputStreamForBeanFactory() throws IOException;
		
	
	
}	// class AbstractXMLApplicationContext
 