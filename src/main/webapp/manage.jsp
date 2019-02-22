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
                            return "<a href='javascript:void(0)' onclick='maintain(" + value + ")'>维护</a>"
                        }
                    }
                ]]
            });
            // 投票系统展示数据的datagrid控件----------------end----------------

            $("#maintainDiv").dialog({
                title: "Update Subject",
                width: 800,
                height: 400,
                closed: true
            });

            var newOptionCount = 0;
            //添加选项
            $("#addOption").click(function () {
                voteOptionsObj = $("#voteOptions");
                voteOptionsObj.append("<p>选项" + (optionCount++ + 1) + ";<input type='text' name='optionList[" + newOptionCount++ + "].optionContent'/></p><br/>");
            })
        })

        //点击查询按钮触发事件
        function doSearch() {
            title = $("#subjectTitle").val();
            $("#voteView").datagrid("load", {"subjectTitle": title})
        }

        var optionCount;

        function maintain(subjectId) {
            alert(1)
            $.ajax({
                url: "${pageContext.request.contextPath}/voteSubject/getMaintainSubjectBySubjectId.do",
                data: {"subjectId": subjectId},
                success: function (data) {
                    //alert(2);
                    console.log(data);
                    $("[type=radio]").eq(data.type).prop("checked", true)
                    $("#title").val(data.title);
                    $("[name=subjectId]").val(data.id);
                    $("#maintainDiv").dialog("open");

                    options = data.optionList;
                    optionCount = options.length;
                    voteOptionsObj = $("#voteOptions")
                    voteOptionsObj.html("");
                    for (var i = 0; i < options.length; i++) {
                        //console.log(options[i].optionContent)
                        voteOptionsObj.append("<p>选项" + (i + 1) + ";<input disabled type='text' value='" + options[i].optionContent + "'/>&nbsp;&nbsp;<input type='checkbox' name='deletedOptionIds' value='" + options[i].optionId + "'/></p><br/>");
                    }
                }
            })
        }

        function doSubmit() {
            $("#maintainForm").form("submit", {
                url: "${pageContext.request.contextPath}/voteSubject/maintain.do",
                success: function (data) {
                    if (data == "true") {
                        $.messager.alert("修改提示", "修改成功!", "info");
                        $("#maintainDiv").dialog("close");
                    } else {
                        $.messager.alert("修改提示", "修改失败!", "warning");
                    }
                }
            })
        }
    </script>
</head>
<body>
投票标题:<input type="text" id="subjectTitle"/><input type="button" value="查询" onclick="doSearch()">
<table id="voteView"></table>

<div id="tb">
    <a href="${pageContext.request.contextPath}/subjectList.jsp" id="maintainDatagridBtn" class="easyui-linkbutton"
       data-options="iconCls:'icon-tip'">返回列表</a>
</div>

<div id="maintainDiv">
    <form method="post" id="maintainForm">
        <dl>
            <dt>投票内容：</dt>
            <dd>
                <input id="title" disabled/>
                <input type="hidden" name="subjectId"/>
            </dd>
            <dt>投票类型：</dt>
            <dd>
                <input type="radio" name="subjectType" value="0" id="singleSelect"/>单选
                <input type="radio" name="subjectType" value="1" id="multiSelect"/>多选
            </dd>
            <dt>投票选项：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;选中删除</dt>
            <dd id="voteOptions">
            </dd>
            <dt></dt>
            <dd class="button">
                <img src="images/button_submit.gif" onclick="doSubmit()"/>
                <a id="addOption" href="javascript:void(0)">增加选项</a>
                <a href="subject!list.action">取消操作</a>
            </dd>
        </dl>
    </form>
</div>
</body>
</html>
