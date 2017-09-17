<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        div.center {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -25% 0 0 -320px;
            width: 640px;
            min-height: 427px;
            padding: 0px;
        }
    </style>
</head>
<body style="direction: ltr;">
<div class="center">
    <img id="img_error" src="<%=request.getContextPath()%>/img/404.png" height="427" width="640"><br>
    <div class="errmsg">
        <b>前端服务器: </b>cn-tj-dx-w-02&nbsp;&nbsp; <b>处理服务器:</b>biubiu<br>
        <b>请求地址:</b> <%=request.getRequestURL()%>&nbsp;&nbsp; <b>错误号:</b>404&nbsp;&nbsp;
        <br><b>用户IP:</b><%=request.getRemoteHost()%><br>

    </div>
</div>


</body>
</html>
