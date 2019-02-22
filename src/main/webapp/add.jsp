<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>
    <link href="${pageContext.request.contextPath}/themes1.3.5/icon.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/themes1.3.5/default/easyui.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(function () {
            $("#addVoteBtn").click(function () {
                alert(1)
                $("#addVoteForm").form("submit", {
                    url: "${pageContext.request.contextPath}/voteSubject/addSubject.do",
                    onSubmit: function () {
                        return true;
                    },
                    success: function (data) {
                        alert(data);
                    }
                })
            })

            optionCount = 2;
            $("#addOptionBtn").click(function () {
                $("#voteoptions").append("<p><input type=\"text\" class=\"text\" name=\"optionList[" + optionCount + "].optionContent\"/></p>")
                optionCount++;
            })
        })
    </script>
</head>
<body>
<div class="addVote">
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
