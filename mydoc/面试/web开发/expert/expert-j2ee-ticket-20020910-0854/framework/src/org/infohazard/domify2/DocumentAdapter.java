/*
 * DocumentAdapter.java
 *
 * Created on May 8, 2001, 2:55 PM
 */

package org.infohazard.domify2;

import org.apache.log4j.Category;
import org.w3c.dom.*;

/**
 * @author  Scott Hernandez
 */
public class DocumentAdapter extends NodeAdapter implements Document
{
	/** Logging category for log4j. */
	protected static Category log = Category.getInstance(DocumentAdapter.class.getName());

	/**
	 */
	Element root;

	protected DocumentAdapter(Object rootObj, String name, DOMAdapter domAdp )
	{
		super(null, 0);

		log.debug("Creating DocumentAdapter");

		this.root = new ElementAdapter(rootObj, name, this, 0, domAdp);
	}

	public short getNodeType()
	{
		log.debug("getNodeType()");

		return DOCUMENT_NODE;
	}

	/**
	 */
	public org.w3c.dom.Element getDocumentElement()
	{
		log.debug("getDocumentElement()");
		return this.root;
	}
	/**
	 */
	public org.w3c.dom.Node getFirstChild()
	{
		log.debug("getFirstChild()");
		return this.root;
	}

	/**
	 * hmmm....
	 */
	public String getLocalName()
	{
		if (log.isDebugEnabled())
			log.debug("getLocalName() returning " + root.getLocalName());

		return root.getLocalName();
	}

	/**
	 * Returns whether this node has any children.
	 * @return  <code>true</code> if this node has any children,
	 *   <code>false</code> otherwise.
	 *
	 * Document nodes always have children.
	 */
	public boolean hasChildNodes()
	{
		if (log.isDebugEnabled())
			log.debug("hasChildNodes() is true");
		return true;
	}

	public org.w3c.dom.NodeList getElementsByTagNameNS(java.lang.String str, java.lang.String str1)
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.ProcessingInstruction createProcessingInstruction(java.lang.String str, java.lang.String str1) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Element createElement(java.lang.String str) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.NodeList getElementsByTagName(java.lang.String str)
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Attr createAttribute(java.lang.String str) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Element createElementNS(java.lang.String str, java.lang.String str1) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Element getElementById(java.lang.String str)
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Text createTextNode(java.lang.String str)
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.CDATASection createCDATASection(java.lang.String str) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.EntityReference createEntityReference(java.lang.String str) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Attr createAttributeNS(java.lang.String str, java.lang.String str1) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.DocumentType getDoctype()
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.DOMImplementation getImplementation()
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Node importNode(org.w3c.dom.Node node, boolean param) throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.DocumentFragment createDocumentFragment()
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public org.w3c.dom.Comment createComment(java.lang.String str)
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}

	public String getNodeValue() throws org.w3c.dom.DOMException
	{
		System.out.println("UnsupportedOperationException Thrown");throw new UnsupportedOperationException();
	}




	/**
	 * @see Node#supports(String, String)
	 */
	public boolean supports(String arg0, String arg1) {
		throw new UnsupportedOperationException("supports");
	}

}
