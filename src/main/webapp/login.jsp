<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title></title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>
    <link href="${pageContext.request.contextPath}/themes1.3.5/icon.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/themes1.3.5/default/easyui.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(function () {
            //用户名验证框,长度为4-6位
            $("#username").validatebox({
                required: true,
                validType: "length[4,10]",
                missingMessage: "用户名不能为空",
                invalidMessage: "用户名必须4-10位"
            })

            //密码输入框的验证规则,必须6位数字
            $.extend($.fn.validatebox.defaults.rules, {
                checkPassword: {
                    validator: function (value, param) {
                        passwordReg = /^\d{6}$/
                        return passwordReg.test(value)
                    },
                    message: '密码必须6位数字'
                }
            });

            //密码验证框,使用上面自定义验证规则
            $("#password").validatebox({
                required: true,
                validType: "checkPassword",
                missingMessage: "密码不能为空",
            })

            //登录按钮的点击事件
            $("#loginBtn").click(function () {
                //alert(1)
                //将登录的表单提交
                $("#loginForm").form("submit", {
                    url: "${pageContext.request.contextPath}/user/login.do",
                    //提交前验证输入框格式是否正确
                    onSubmit: function () {
                        return $(this).form("validate") && $("#errorSpan").html() != "用户名不存在";
                    },
                    success: function (data) {
                        data = JSON.parse(data)
                        //alert(data)
                        alert(data.isLogin)
                        if (data.isLogin) {
                            location.href = "${pageContext.request.contextPath}/subjectList.jsp"
                        } else {
                            $("#errorSpan").html("密码错误").css("color", "red");
                        }
                    }
                })
            })

            // 用户名失去焦点事件,判断用户名是否存在
            $("#username").blur(function () {
                username = $("#username").val()
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/checkUsername.do",
                    data: "name=" + username,
                    success: function (data) {
                        //alert(data);
                        if (data) {
                            $("#errorSpan").html("用户名不存在").css("color", "red");
                        } else {
                            $("#errorSpan").html("");
                        }
                    }
                })
            })
        })

    </script>
</head>
<body>
<div id="header" class="wrap">
    <img src="images/logo.gif"/>
</div>
<div id="login" class="wrap">
    <div class="main">
        <div class="corner"></div>
        <div class="introduce">
            <h2>百知</h2>
            <p>网上调查系统...</p>
        </div>
        <div class="login">
            <h2>用户登录</h2>
            <form method="post" id="loginForm">
                <dl id="loginBox">
                    <dt>用户名：</dt>
                    <dd><input type="text" class="input-text" name="username" id="username"/></dd>
                    <dt>密　码：</dt>
                    <dd><input type="password" class="input-text" name="password" id="password"/></dd>
                    <dt></dt>
                    <dd><input type="button" class="input-button" value="登录" id="loginBtn"/> <a href="register.action">新用户注册</a>
                    </dd>
                </dl>
            </form>
            <div class="error"><span id="errorSpan"></span></div>
        </div>
    </div>
</div>
<div class="wrap">
</div>
<div id="footer" class="wrap">
    百知 &copy; 版权所有
</div>
</body>
</html>
