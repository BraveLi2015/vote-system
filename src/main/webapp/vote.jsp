<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="vote" class="wrap">
    <h2>参与投票</h2>
    <ul class="list">
        <li>
            <h4>${subject.title}</h4>
            <p class="info">共有 ${subject.optionList.size()}个选项</p>
            <form method="post" id="voteForm" action="${pageContext.request.contextPath}/voteSubject/vote.do">
                <ol>
                    <input type="hidden" value="${subject.id}" name="subjectId"/>
                    <c:forEach items="${subject.optionList}" var="option" varStatus="i">

                        <li>
                            <c:if test="${subject.type == 0}"><input type="radio" name="optionIds"
                                                                     value="${option.optionId}"/></c:if>
                            <c:if test="${subject.type == 1}"><input type="checkbox" name="optionIds"
                                                                     value="${option.optionId}"/></c:if>
                                ${option.optionContent}
                        </li>

                    </c:forEach>
                </ol>
                <p class="voteView">
                    <input type="submit" value="投票" id="voteBtn"/>
                    <a href="javascript:void(0)">查看</a>
                </p>
            </form>
        </li>
    </ul>
</div>
</body>
</html>