<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String requestURI = request.getRequestURI();
    String[] urls=requestURI.split("/");
    pageContext.setAttribute("prefix", urls[1]);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>i
<body style="background: url('video/img/bg_live.jpg');background-repeat: no-repeat ">
<%--请先登录！！！！！！！！--%>
<script>
    alert("请先登录！");
    var uri=window.location.pathname;
    var uris=uri.split("/");
    var prefix=uris[1];
        if(prefix==="live"){
            window.location="<%=request.getContextPath()%>/live";
        }else {
            window.location="<%=request.getContextPath()%>/homepage";
        }

</script>
</body>
</html>
