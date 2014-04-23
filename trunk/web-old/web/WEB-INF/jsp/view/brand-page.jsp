<%--
  Description:Brand Page(品牌最终页)
  User: Peter Wei
  Date: 2010-1-19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>Brand Page</title>
    <link rel="stylesheet" href="${css}/lay.css"/>
    <style type="text/css">

            /* Some css style
            ----------------------------------*/


    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

        });
    </script>
</head>

<body>
<div class="tonglan"><img src="${images}/del/d-1.jpg" alt="上品折扣"/></div>
<!--[if !ie]>品牌广告内容开始<![endif]-->
<div class="layout grid-m">
    <div class="wrapper">
        <div class="sharp color1"><b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>

            <div class="content">
                <ul>
                    <li><img src="${images}/1-6.gif" alt=""/></li>
                    <li><img src="${images}/1-7.gif" alt=""/></li>
                    <li>品牌折扣店李宁品折扣店李宁品牌折扣<br>
                        品牌折扣店李宁品牌品牌折扣店李宁品牌折扣<br>
                        品牌折扣店李宁品牌<br>
                        折扣店李宁折扣店李宁折扣店李宁折扣店李宁折扣店李宁折扣店李宁折扣店李宁
                    </li>
                </ul>
            </div>
            <b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b></div>
    </div>
</div>
<!--[if !ie]>品牌广告内容结束<![endif]-->
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">

            <div class="main-wrap">
                <!--[if !ie]>右侧分类开始<![endif]-->
                <div id="content-right">
                    <div id="banner2">
                        <ul>
                            <li><img src="${images}/1-9.gif" alt="" width="748"/></li>
                        </ul>
                    </div>
                    <div class="content-right2">
                        <div class="mingxing">
                            <div class="mingxing_left">明星产品</div>
                            <div class="mingxing_right"><a href="#">更多>></a></div>
                        </div>
                        <div class="Contentbox1">
                            <ul>
                                <c:forEach var="p" begin="0" end="4" varStatus="status">
                                <c:if test="${status.index%5==0&&status.index>4}">
                            </ul>
                        </div>
                        <div class="Contentbox1">
                            <ul>
                                </c:if>
                                <li><a href="${ctx}/view/product.html"><img src="${images}/l-23.gif" alt="sku"/>

                                    <p>鹿王专柜正品时尚女款羊绒衫... </p>
                                </a> <span class="color666666"><em>109.0</em>￥222.0</span></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="content-right2">
                        <div class="shoucang-top">
                            <div class="left">折扣精品</div>
                            <div class="right"><a href="#" target="_blank">查看详细尺码表</a></div>
                        </div>
                        <div class="pailie">
                            <div class="pailie1">排列：</div>
                            <ul class="pailie2">
                                <li><a href="#cur"><img src="${images}/l-1.gif" alt=""/></a></li>
                                <li><a href="#cur"><img src="${images}/l-2.gif" alt=""/></a></li>
                                <li><a href="#cur"><img src="${images}/l-2.gif" alt=""/></a></li>
                                <li><a href="#cur"><img src="${images}/l-2.gif" alt=""/></a></li>
                                <li><a href="#cur"><img src="${images}/l-2.gif" alt=""/></a></li>
                            </ul>
                            <div class="text0"><span class="text1">1/27</span> <span class="text2"><</span> <span
                                    class="text3">下一页</span></div>
                        </div>
                        <div class="Contentbox1">
                            <ul>
                                <c:forEach var="p" begin="0" end="16" varStatus="status">
                                <c:if test="${status.index%5==0&&status.index>4}">
                            </ul>
                        </div>
                        <div class="Contentbox1">
                            <ul>
                                </c:if>
                                <li><a href="${ctx}/view/product.html"><img src="${images}/l-23.gif" alt="sku"/>

                                    <p>鹿王专柜正品时尚女款羊绒衫... </p>
                                </a> <span class="color666666"><em>109.0</em>￥222.0</span></li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                    <!--[if !ie]>右侧分类结束<![endif]-->
                </div>
            </div>
            <div class="main-wrap">
                <div class="test-box">一些商品之类的内容</div>
            </div>
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <!--[if !ie]>左侧分类开始<![endif]-->
            <div id="content-left">
                <ul>
                    <li class="brand"><img src="${images}/i-12.gif" alt=""/></li>
                    <li class="brand2"> <span class="brand1"><img src="${images}/del/d-1.gif" alt=""/>
							<p><a href="#">Lee(28)</a></p>
							</span> <span class="brand3"><img src="${images}/del/d-1.gif" alt=""/>
							<p><a href="#">森林木(28)</a></p>
							</span></li>
                    <li>运动休闲</li>
                    <li>运动服(28) | 运动包(1254) | 运动服(28) | 运动包(1254) | 运动服(28) | 运动包(1254) | 运动服(28) | 运动包(1254)</li>
                </ul>
            </div>
            <!--[if !ie]>左侧分类结束<![endif]-->
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
</body>
</html>