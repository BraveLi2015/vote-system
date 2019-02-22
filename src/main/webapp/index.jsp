<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>投票列表</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>
    <link href="${pageContext.request.contextPath}/themes1.3.5/icon.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/themes1.3.5/default/easyui.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(function () {

        });
    </script>
</head>
<body>
<jsp:include page="top.jsp"/>
<div id="index" class="content wrap">
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">返回列表</a></li>
            <li><a href="#tabs-2">发布新投票</a></li>
            <li><a href="manage.jsp">维护</a></li>
            <li style="float:right;margin:5px 10px 0 0">您好，</li>
        </ul>
        <div id="tabs-1">
            <div class="info">
                <div class="search">
                    <input id="keywords" class="autoComplete" type="text" name="keywords" value=""/>
                    <input id="gridSearch" class="gridSearch" type="button" name="search" value="搜索"/>
                </div>
            </div>
            <table id="mygrid"></table>
        </div>
        <div id="tabs-2">
            <jsp:include page="add.jsp"/>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>