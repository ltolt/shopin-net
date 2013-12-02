//// ========================================================================
//// Copyright (c) 2009-2009 Mort Bay Consulting Pty. Ltd.
//// ------------------------------------------------------------------------
//// All rights reserved. This program and the accompanying materials
//// are made available under the terms of the Eclipse Public License v1.0
//// and Apache License v2.0 which accompanies this distribution.
//// The Eclipse Public License is available at 
//// http://www.eclipse.org/legal/epl-v10.html
//// The Apache License v2.0 is available at
//// http://www.opensource.org/licenses/apache2.0.php
//// You may elect to redistribute this code under either of these licenses. 
//// ========================================================================
//
//
//package net.shopin.web;
//
//import javax.validation.Valid;
//
//import net.shopin.view.Person;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//
///* ------------------------------------------------------------ */
///**
// */
//@Controller
//public class WebController
//{
//    @RequestMapping(value = "/person",method = RequestMethod.GET)
//    public String showForm(Person person){
//        return "form";
//    }
//    
//    @RequestMapping(value = "/person",method = RequestMethod.POST)
//    public String enterAge(@Valid Person person,BindingResult bindingResult,
//            RedirectAttributes redirectAttributes){
//        if(bindingResult.hasErrors()){
//            redirectAttributes.addFlashAttribute("error",bindingResult.getFieldError().getDefaultMessage());
//            return "redirect:/person";
//        }
//        return "results";
//    }
//    
//
//}
