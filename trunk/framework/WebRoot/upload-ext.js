    Ext.require([  
        'Ext.form.*'  
    ]);  
    var img_reg = /\.([jJ][pP][gG]){1}$|\.([jJ][pP][eE][gG]){1}$|\.([gG][iI][fF]){1}$|\.([pP][nN][gG]){1}$|\.([bB][mM][pP]){1}$/;  
    var currentpath ='';  
    Ext.define('IMS.view.db.casesuspectCreate', {  
        extend: 'Ext.window.Window',  
        alias : 'widget.casesuspectCreate',  
        height : 400,  
        minHeight: 400,  
        width : 660,  
        minWidth: 660,  
        resizable:false,  
        modal : true,  
        constrain:true,  
        //constrainTo:Ext.get("#tabs"),  
        layout: 'fit',  
        autoShow: false,  
        bAddForm: false,  
        initComponent: function() {  
            this.items = [  
            {  
                xtype: 'form',  
                layout:'absolute',  
                id:'formPanel',  
                fileUpload : true,  
                enctype: 'multipart/form-data',    
                waitMsgTarget: true,  
                url:'ims/casesuspect/edtByParam',  
                method:'post',  
                items: [  
                    {  
                        xtype: 'numberfield',  
                        labelAlign:'right',  
                        //maxValue: 100,  
                        //minValue: 0,  
                        allowNegative : false,  
                        value: 1,  
                        allowBlank:false,  
                        selectOnFocus : true,  
                        //padding:'10 0 0 0',  
                        fieldLabel: '',  
                        name : 'id',  
                        x:0,  
                        y:10,  
                        width:300,  
                        hidden: true  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         emptyText:'请输入姓名',  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         allowBlank:false,  
                         padding:'8 0 0 0',  
                         fieldLabel: '姓名',  
                         name : 'szname',  
                         //anchor: '-5',  
                         labelWidth :60,  
                         x:0,  
                         y:2,  
                         width:300,  
                         hidden: false  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '曾用名',  
                         name : 'szformername',  
                         labelWidth :60,  
                         x:0,  
                         y:38,  
                         width:300,  
                         hidden: false  
                    },  
                    {  
                         xtype: 'datefield',  
                         labelAlign:'right',  
                         format : 'Y-m-d',  
                         value: new Date(),  
                         //padding:'2 0 0 0',  
                         fieldLabel: '出生日期',  
                         name : 'nbirthday',  
                         labelWidth :60,  
                         x:0,  
                         y:66,  
                         width:300,  
                         hidden: false  
                     },  
                     {  
                        xtype: 'combobox',  
                        fieldLabel: '性别',  
                        labelAlign:'right',  
                        forceSelection: true,  
                        typeAhead: true,  
                        displayField: 'name',  
                        valueField:'name',  
                        editable:false,  
                        mode:'local',  
                        //id:'cmbgrpriglist',  
                        name: 'szgender',  
                        value:'男',  
                        //emptyText: '请输入证件类型',  
                        allowBlank:false,  
                        loadMask : false,  
                        store: Ext.create('Ext.data.SimpleStore', {  
                            fields: ['type', 'name'],  
                            data:[[' 0','男'],['1','女']]  
                        }),  
                        labelWidth :60,  
                         x:0,  
                         y:95,  
                         width:300  
                    },  
                    {  
                        xtype: 'combobox',  
                        fieldLabel: '证件名称',  
                        labelAlign:'right',  
                        forceSelection: true,  
                        typeAhead: true,  
                        displayField: 'name',  
                        valueField:'name',  
                        editable:true,  
                        mode:'local',  
                        //id:'cmbgrpriglist',  
                        name: 'szpapersname',  
                        //value:'身份证',  
                        //emptyText: '请输入证件类型',  
                        //allowBlank:false,  
                        store: Ext.create('Ext.data.SimpleStore', {  
                            fields: ['type', 'name'],  
                            data:[[' 0','身份证'],['1','工作证'],['2','驾驶证']]  
                        }),  
                        labelWidth :60,  
                         x:0,  
                         y:125,  
                         width:300  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '证件号',  
                         name : 'szpapersno',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:155,  
                         width:300  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '民族',  
                         name : 'sznation',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:185,  
                         width:300  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '文化程度',  
                         name : 'szeducation',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:215,  
                         width:300  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '籍贯',  
                         name : 'sznativeplace',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:245,  
                         width:300  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '户籍地',  
                         name : 'szplacedomicile',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:275,  
                         width:300  
                     },  
                    
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '政治面貌',  
                         name : 'szpoliticsstatus',  
                         hidden: false,  
                         labelWidth :60,  
                         x:0,  
                         y:305,  
                         width:300  
                     },  


    //创建box  
                     {      
                         xtype : 'box',         
                         id : 'logoPic',      
                         width : 310,      
                         height : 120,    
                         x:320,  
                         y:30,  
                         autoEl : {    
                             id:'show',  
                             tag : 'img',      
                             src : Ext.BLANK_IMAGE_URL,      
                             //src : '1.png',     
                             style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);',  
                               
                              
                             
                         }      
                      },  

    //创建上传按钮  
                       
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         id:'logoFile',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         inputType : 'file',  
                         //selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         buttonText:'浏览...',  
                         fieldLabel: '照片',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:10,  


    //添加监听  
                         width:310,  
                         listeners : {    
                                'render':function(){    
                                     var logoFileCmp = Ext.getCmp('logoFile');   
                                   // alert(logoFileCmp);  
                                    logoFileCmp.on('change',function(field,newValue,oldValue){   
                                        //alert("enter in method change");  
                                              
                                             var picPath = logoFileCmp.getValue();    
    //                                      alert(picPath);  
                                               
                                               
                                             var url =  Ext.getCmp('logoFile').value;    
                                        
                                               
                                               
                                                   
                                              //项目关系，只处理IE  
                                                 Ext.get('logoPic').dom.src=url;  
                                              
                                        },this);    
                                     }    
                            }    
                          
                    },  
                      
                      
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '联系电话',  
                         name : 'szphone',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:155,  
                         width:310  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '现居住地址',  
                         name : 'szliveaddress',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:185,  
                         width:310  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '单位/职业',  
                         name : 'szjog',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:215,  
                         width:310  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '常联系人',  
                         name : 'szlinkman',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:245,  
                         width:310  
                     },  
                    {  
                         xtype: 'textfield',  
                         labelAlign:'right',  
                         //emptyText:,  
                         //invalidText:'',  
                         //vtype: 'alphanum',  
                         selectOnFocus : true,  
                         //allowBlank:false,  
                         //padding:'2 0 0 0',  
                         fieldLabel: '联系人关系',  
                         name : 'szlinkrelation',  
                         hidden: false,  
                         labelWidth :70,  
                         x:320,  
                         y:275,  
                         width:310  
                     }  
                ]  
                  
            }];  
              
            this.buttons = [  
            {  
                text: '提交',  
                action: 'save'  
            },  
            {  
                text: '取消',  
                scope: this,  
                handler: function(button)  
                {  
                    button.up('window').close();  
                }  
            }];  
              
            this.callParent(arguments);  
        }  
    });  