<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注 册</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>
    <link href="${pageContext.request.contextPath}/themes1.3.5/icon.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/themes1.3.5/default/easyui.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(function () {
            // 用户名的验证框,必须4-10位
            $("#username").validatebox({
                required: true,
                validType: "length[4,10]",
                missingMessage: "用户名不能为空",
                invalidMessage: "用户名必须4-10位"
            })

            //自定义密码验证规则,必须是6位数字
            $.extend($.fn.validatebox.defaults.rules, {
                checkPassword: {
                    validator: function (value, param) {
                        passwordReg = /^\d{6}$/
                        return passwordReg.test(value)
                    },
                    message: '密码必须6位数字'
                }
            });

            //密码验证框,使用上面自定义的验证规则
            $("#password").validatebox({
                required: true,
                validType: "checkPassword",
                missingMessage: "密码不能为空",
            })

            //确认密码的验证规则,两次密码必须一致
            $.extend($.fn.validatebox.defaults.rules, {
                checkRePassword: {
                    validator: function (value, param) {
                        password = $(param[0]).val();
                        return password == value;
                    },
                    message: '两次密码不一致'
                }
            });

            // 确认密码的验证框,使用上面自定义验证规则
            $("#rePassword").validatebox({
                required: true,
                validType: "checkRePassword['#password']",
                missingMessage: "两次密码必须一致",
            })

            // 注册按钮的点击事件
            $("#registerBtn").click(function () {
                alert(1)
                $("#regForm").form("submit", {
                    url: "${pageContext.request.contextPath}/user/register.do",
                    onSubmit: function () {
                        return $(this).form("validate") && $("#usernameSpan").html() == "用户名可以使用";
                    },
                    success: function (data) {
                        //alert(data)
                        console.log(data)
                        data = JSON.parse(data);
                        if (data.isRegister) {
                            //alert("reg success")
                            location.href = "${pageContext.request.contextPath}/reg_success.jsp";
                        } else {
                            alert("注册失败");
                        }
                    }
                })
            })

            // 用户名失去焦点事件,判断用户名是否已经存在
            $("#username").blur(function () {
                username = $("#username").val()
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/checkUsername.do",
                    data: "name=" + username,
                    success: function (data) {
                        //alert(data);
                        if (data) {
                            $("#usernameSpan").html("用户名可以使用").css("color", "green");
                        } else {
                            $("#usernameSpan").html("用户名已经存在").css("color", "red");
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
<div id="navbar" class="wrap">
    <div class="search">

    </div>
</div>
<div id="register" class="box">
    <h2>新用户注册</h2>
    <div class="content">
        <form method="post" id="regForm">
            <dl>
                <dt>用户名：</dt>
                <dd><input type="text" class="input-text" name="username" id="username"/><span id="usernameSpan"></span>
                </dd>
                <dt>密码：</dt>
                <dd><input type="password" class="input-text" name="password" id="password"/></dd>
                <dt>确认密码：</dt>
                <dd><input type="password" class="input-text" name="confirmPassword" id="rePassword"/></dd>
                <dt></dt>
                <dd><input type="button" class="input-button" id="registerBtn"/></dd>
            </dl>
        </form>

    </div>
</div>
<div id="footer" class="wrap">
    百知 &copy; 版权所有
</div>
</body>
</html>
