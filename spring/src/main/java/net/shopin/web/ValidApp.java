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
//import org.springframework.boot.SpringApplication;
//import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.thymeleaf.spring3.SpringTemplateEngine;
//import org.thymeleaf.spring3.view.ThymeleafViewResolver;
//import org.thymeleaf.templateresolver.ServletContextTemplateResolver;
//
//
///* ------------------------------------------------------------ */
///**
// */
//@Configuration
//@ComponentScan
//@EnableAutoConfiguration
//public class ValidApp
//{
//    @Bean
//    ServletContextTemplateResolver templateResolver(){
//        ServletContextTemplateResolver resolver = new ServletContextTemplateResolver();
//        resolver.setSuffix(".html");
//        resolver.setTemplateMode("HTML5");
//        return resolver;
//    }
//    
//    @Bean
//    SpringTemplateEngine engine(){
//        SpringTemplateEngine engine = new SpringTemplateEngine();
//        engine.setTemplateResolver(templateResolver());
//        return engine;
//    }
//    
//    @Bean
//    ThymeleafViewResolver viewResolver(){
//        ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
//        viewResolver.setTemplateEngine(engine());
//        return viewResolver;
//    }
//    
//    
//    
//    /* ------------------------------------------------------------ */
//    /**
//     * @param args
//     */
//    public static void main(String[] args)
//    {
//        SpringApplication.run(ValidApp.class,args);
//
//    }
//
//}
