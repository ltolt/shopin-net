///*
// * File: app.js
// *
// * This file was generated by Sencha Architect version 2.0.0.
// * http://www.sencha.com/products/architect/
// *
// * This file requires use of the Ext JS 4.0.x library, under independent license.
// * License of Sencha Architect does not include license for Ext JS 4.0.x. For more
// * details see http://www.sencha.com/license or contact license@sencha.com.
// *
// * This file will be auto-generated each and everytime you save your project.
// *
// * Do NOT hand edit this file.
// */
//
//Ext.Loader.setConfig({
//    enabled: true,   
//    paths: {
//        'Extention': 'js'
//    }
//});
//
//Ext.application({
//    requires: [
//        'Extention.RandomGen'
//    ],
//
//    views: [
//        'MyViewport'
//    ],
//    autoCreateViewport: true,
//    name: 'MyApp',
//    controllers: [
//        'AppLaunchCtrl'
//    ],
//
//    findTab: function(tabPanel,  record) {
//        var ret,
//        activeTab = tabPanel.getActiveTab();
//        if (activeTab && activeTab.record === record) {
//            return activeTab;
//        }
//        tabPanel.items.each(function(t, idx) {
//            if (t && t.record === record) {
//                ret = t;
//                return false;
//            }
//        });
//        return ret;
//    },
//
//    activateTab: function(tabPanel, targetTab) {
//        if (targetTab) {
//            tabPanel.setActiveTab(targetTab);
//            return true;
//        }
//        return false;
//    },
//
//    widget: function(tabPanel, controllerName, widgetName, record, cfg) {
//        var findRes = this.findTab(tabPanel, record);
//        if (findRes) {
//            this.activateTab(tabPanel, findRes);   
//        } else {
//            var ctrl = this.getController(controllerName),
//            tab = Ext.widget(widgetName, {record: record, closable: true});
//            if (cfg) {
//                Ext.apply(tab, cfg);
//            }
//            tabPanel.setActiveTab(tabPanel.add(tab));
//            ctrl.init();
//        }
//    }
//
//});