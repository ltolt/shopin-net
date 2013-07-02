/*
 * File: app/view/MyPanel3.js
 *
 * This file was generated by Sencha Architect version 2.2.2.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 4.1.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 4.1.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('ex.view.form1', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.form1',
    height: 688,
    itemId: 'test1',
    width: 1011,
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
                    region: 'center',
                    bodyPadding: 10,
                    title: '基本信息',
                    items: [
                        {
                            xtype: 'fieldset',
                            height: 340,
                            width: 987,
                            title: '基本信息列表',
                            items: [
                                {
                                    xtype: 'textfield',
                                    anchor: '50%',
                                    width: 965,
                                    fieldLabel: '频道名称'
                                }
                            ]
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});