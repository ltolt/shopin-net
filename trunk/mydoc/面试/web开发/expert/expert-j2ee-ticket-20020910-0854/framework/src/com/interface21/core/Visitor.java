
package com.interface21.core;

/**
*	Interface to be implemented by Objects implementing the Visitor
*	design pattern.
*	<br>Implementing objects will have to understand the structure of
*	objects they visit: e.g. to convert their structure into XML output.
*	@author Rod Johnson
*	@since 15.10.1999
*	@see Visitable
*/
public interface Visitor {
	
	/** Begin a visit to a composite element, with subnodes.
	 * Return false to just treat it as a terminal.
	 * <br/>Note that either this method or exitComposite(), depending 
	 * on implementation, must do the actual visit to the composite,
	 * as visit() will never be called on this node unless this
	 * method returns false.
	 * @param host Node accepting the Visitor
	 * @param depth current depth in traversal, starting at 0. 
	 * @return true to treat this as a composite, and traverse
	 * any children; false to treat it as a terminal, ignoring
	 * any children.
  	*/
	public boolean enterComposite(Visitable host, int depth);

	/** End a visit to a composite element, with subnodes
	 * @param host node visited
	 * @param depth 
 */
	public void exitComposite(Visitable host);

	/** Make an entire visit to a terminal node
	 * @param host node to be visited
	 * @param depth depth of traversal (starting at 0)
 */
	public void visitLeaf(Visitable host, int depth);
}


