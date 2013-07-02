/*
 * File: app/view/MyForm.js
 *
 * This file was generated by Sencha Architect version 2.0.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 4.0.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 4.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('MyApp.view.MyForm', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.MyForm',

    itemId: 'sampleTest',
    layout: {
        type: 'border'
    },
    title: '表单',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    bodyPadding: 10,
                    region: 'center',
                    items: [
                        {
                            xtype: 'fieldset',
                            height: 163,
                            title: '样品基本信息',
                            items: [
                                {
                                    xtype: 'textfield',
                                    fieldLabel: '样品来源',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'triggerfield',
                                    fieldLabel: '样品类别',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'numberfield',
                                    fieldLabel: '样品质量（克）',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'datefield',
                                    fieldLabel: '检查日期',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'timefield',
                                    fieldLabel: '检查时间',
                                    anchor: '100%'
                                }
                            ]
                        },
                        {
                            xtype: 'fieldset',
                            height: 83,
                            title: '测量指标',
                            items: [
                                {
                                    xtype: 'numberfield',
                                    fieldLabel: '测量室温(摄氏度)',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'numberfield',
                                    fieldLabel: '含水率',
                                    anchor: '100%'
                                }
                            ]
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '检查结果',
                            anchor: '100%'
                        },
                        {
                            xtype: 'button',
                            itemId: 'btnSave',
                            width: 91,
                            text: '保存结果'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});