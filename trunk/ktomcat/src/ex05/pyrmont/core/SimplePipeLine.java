// ========================================================================
// Copyright (c) 2009-2009 Mort Bay Consulting Pty. Ltd.
// ------------------------------------------------------------------------
// All rights reserved. This program and the accompanying materials
// are made available under the terms of the Eclipse Public License v1.0
// and Apache License v2.0 which accompanies this distribution.
// The Eclipse Public License is available at 
// http://www.eclipse.org/legal/epl-v10.html
// The Apache License v2.0 is available at
// http://www.opensource.org/licenses/apache2.0.php
// You may elect to redistribute this code under either of these licenses. 
// ========================================================================


package ex05.pyrmont.core;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.catalina.Contained;
import org.apache.catalina.Container;
import org.apache.catalina.Pipeline;
import org.apache.catalina.Request;
import org.apache.catalina.Response;
import org.apache.catalina.Valve;
import org.apache.catalina.ValveContext;


/* ------------------------------------------------------------ */
/**
 */
public class SimplePipeLine implements Pipeline
{
    public SimplePipeLine(Container container) {
        setContainer(container);
      }

    
    // The basic Valve (if any) associated with this Pipeline.
    protected Valve basic;
   
    // The Container with which this Pipeline is associated.
    protected Container container = null;
    
 // the array of Valves
    protected Valve valves[] = new Valve[0];

    public void setContainer(Container container) {
        this.container = container;
      }
    
    public Valve getBasic() {
        return basic;
      }

      public void setBasic(Valve valve) {
        this.basic = valve;
        ((Contained) valve).setContainer(container);
      }

      public void addValve(Valve valve) {
        if (valve instanceof Contained)
          ((Contained) valve).setContainer(this.container);

        synchronized (valves) {
          Valve results[] = new Valve[valves.length +1];
          System.arraycopy(valves, 0, results, 0, valves.length);
          results[valves.length] = valve;
          valves = results;
        }
      }

      public Valve[] getValves() {
        return valves;
      }

      public void invoke(Request request, Response response)
        throws IOException, ServletException {
        // Invoke the first Valve in this pipeline for this request
        (new SimplePipelineValveContext()).invokeNext(request, response);
      }

      public void removeValve(Valve valve) {
      }

      // this class is copied from org.apache.catalina.core.StandardPipeline class's
      // StandardPipelineValveContext inner class.
      protected class SimplePipelineValveContext implements ValveContext {

        protected int stage = 0;

        public String getInfo() {
          return null;
        }

        public void invokeNext(Request request, Response response)
          throws IOException, ServletException {
          int subscript = stage;
          stage = stage + 1;
          // Invoke the requested Valve for the current request thread
          if (subscript < valves.length) {
            valves[subscript].invoke(request, response, this);
          }
          else if ((subscript == valves.length) && (basic != null)) {
            basic.invoke(request, response, this);
          }
          else {
            throw new ServletException("No valve");
          }
        }
      } // end of inner class

}
