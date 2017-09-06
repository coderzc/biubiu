<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--请先登录！！！！！！！！--%>
<script>
    alert("请先登录！");
    window.location="<%=request.getContextPath()%>/homepage.jsp";
</script>
</body>
</html>
