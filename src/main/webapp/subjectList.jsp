<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>
    <link href="${pageContext.request.contextPath}/themes1.3.5/icon.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/themes1.3.5/default/easyui.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script type="text/javascript">
        $(function () {

            // 投票系统展示数据的datagrid控件
            $("#voteView").datagrid({
                title: "网上投票系统",
                url: "${pageContext.request.contextPath}/voteSubject/getVoteSubjectByPage.do",
                pagination: true,
                rownumbers: true,
                striped: true,
                toolbar: "#tb",
                pageList: [5, 10, 20],
                columns: [[
                    {checkbox: true},
                    {title: "投票标题", field: "subjectTitle", width: "200"},
                    {title: "选项数", field: "optionCount", width: "200"},
                    {title: "投票人数", field: "votePersonCount", width: "200"},
                    {
                        title: "操作", field: "subjectId", width: "200", formatter: function (value, rowDate, index) {
                            return "<a href='${pageContext.request.contextPath}/voteSubject/getOptionsBySubjectId.do?subjectId=" + value + "'>参加投票</a>"
                        }
                    }
                ]]
            });
            // 投票系统展示数据的datagrid控件----------------end----------------

            $("#addVoteDiv").dialog({
                width: 800,
                height: 400,
                closed: true
            })

            //点击dialog面板中添加新投票按钮触发事件
            $("#addVoteBtn").click(function () {
                //alert(1)
                $("#addVoteForm").form("submit", {
                    url: "${pageContext.request.contextPath}/voteSubject/addSubject.do",
                    success: function (data) {
                        //alert(data);
                        if (data == "true") {
                            $("#addVoteDiv").dialog("close");
                            $("#voteView").datagrid("reload");
                        } else {
                            $.messager.alert("添加提示", "添加失败!", "warning");
                        }
                    }
                })
            })

            //点击添加选项触发事件
            optionCount = 2;
            $("#addOptionBtn").click(function () {
                $("#voteoptions").append("<p><input type=\"text\" class=\"text\" name=\"optionList[" + optionCount + "].optionContent\"/></p>")
                optionCount++;
            })

            //点击datagrid上的添加,打开添加投票的dialog
            $("#addVoteDatagridBtn").click(function () {
                $("#addVoteDiv").dialog("open");
            })

            // 点击datagrid上的删除按钮触发事件
            $("#multiDeleteDatagridBtn").click(function () {
                selectedRows = $("#voteView").datagrid("getSelections");
                if (selectedRows.length == 0) {
                    $.messager.alert("删除提示", "请选择要删除的数据!", "warning");
                } else {
                    $.messager.confirm("删除提示", "确定要删除吗?", function (result) {
                        if (result) {
                            selectedIds = new Array();
                            for (var i = 0; i < selectedRows.length; i++) {
                                selectedIds[i] = selectedRows[i].subjectId;
                            }
                            $.ajax({
                                url: "${pageContext.request.contextPath}/voteSubject/multiDelete.do",
                                data: {"ids": selectedIds},
                                traditional: true,
                                success: function (data) {
                                    if (data) {
                                        //alert("success");
                                        $("#voteView").datagrid("reload");
                                    } else {
                                        $.messager.alert("删除提示", "删除失败!", "warning");
                                    }
                                }
                            })
                        }
                    })
                }
            })


        })

        //点击查询按钮触发事件
        function doSearch() {
            title = $("#subjectTitle").val();
            $("#voteView").datagrid("load", {"subjectTitle": title})
        }
    </script>
</head>
<body>
投票标题:<input type="text" id="subjectTitle"/><input type="button" value="查询" onclick="doSearch()">
<table id="voteView"></table>

<div id="tb">
    <a href="javascript:void(0)" id="addVoteDatagridBtn" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'">添加</a>
    <a href="javascript:void(0)" id="multiDeleteDatagridBtn" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'">删除</a>
    <a href="${pageContext.request.contextPath}/manage.jsp" id="maintainDatagridBtn" class="easyui-linkbutton"
       data-options="iconCls:'icon-tip'">维护</a>
</div>

<div id="addVoteDiv">
    <h2>发布新投票</h2>
    <div class="vote-content">
        <form method="post" id="addVoteForm">
            <dl>
                <dt>投票内容：</dt>
                <dd>
                    <input id="voteTitle" type="text" class="input-text" name="title" title="填入投票内容"/>
                </dd>
                <dt>投票类型：</dt>
                <dd>
                    <input type="radio" name="type" value="0" checked=checked/>单选
                    <input type="radio" name="type" value="1"/>多选
                </dd>
                <dt>投票选项：</dt>
                <dd id="voteoptions">
                    <p><input type="text" class="text" name="optionList[0].optionContent"/></p>
                    <p><input type="text" class="text" name="optionList[1].optionContent"/></p>
                </dd>
                <dt></dt>
                <dd class="button">
                    <img src="images/button_submit.gif" id="addVoteBtn"/>
                    <a id="addOptionBtn" href="javascript:void(0);">增加选项</a>
                    <a href="subject!list.action">取消操作</a>
                </dd>
            </dl>
        </form>
    </div>
</div>
</body>
</html>
