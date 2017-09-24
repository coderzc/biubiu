<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>分区</title>
    <%@include file="inclued_page/base_js_css.jsp" %>
    <script src="js/page_.js" type="text/javascript"></script>
    <script src="js/classify.js" type="text/javascript"></script>
    <link href="css/res_soso.css" rel="stylesheet">
    <style>

        body {
            font-family: "Microsoft YaHei", Arial, Helvetica, sans-serif;
        }

        .body_head_img {
            /*background-color: aqua;*/
            width: 40px;
            height: 39px;
            display: inline-block;
            position: relative;
            float: left;
            background-image: url('img/icons.png');

        }

        #classify_info h1 {
            display: block;
            margin: 0;
            padding: 0;
            list-style-type: none;
            font-size: 24px !important;
            line-height: 24px;
            font-weight: normal;
            position: relative;
            float: left;
            top: 9px;
            margin-left: 5px;
        }

        #classify_info {
            top: 5px;
            position: relative;
            width: 80%;
            height: 40px;
            white-space: nowrap;
            margin: 0 auto;
        }

    </style>
</head>
<body>


<%@include file="inclued_page/nav.jsp" %>
<div id="header_img_header">
</div>
<div id="content">
    <div id="classify_info">
        <span class="body_head_img" style="background-position: -80px -1615px">
        </span>
        <span class="body_head_text">
        <h1></h1>
        </span>
    </div>

    <hr width="80%" color=#987cb9 size=20/>


    <div id="page_result" class="so_wrap" style="position: relative">
        <%--<div class="so_info">--%>
        <%--<p class="so_info_total">共564条数据</p>--%>
        <%--</div>--%>
        <%--<ul class="ajax_render">--%>
        <%--<li class="vedio_matrix">--%>
        <%--</li>--%>
        <%--</ul>--%>
    </div>

    <div class="bottom" style="text-align: center">
        <ul class="pagination" id="page_plugin" style="cursor: pointer">
            <%--<li><a id="prev_passage">&laquo;</a></li>--%>
            <%--<li class="normal active pageNo_li"><a id="passage1">1</a></li>--%>
            <%--<li><a id="next_passage">&raquo;</a></li>--%>
        </ul>
    </div>
</div>


<%@include file="inclued_page/model_login.jsp" %>

<script>
    var pageNo = 1;//从后台获取当前页号
    var pageCount;//分页总数
    var param = getQueryString("videoType");//参数

    var server_path = "${pageScope.path}";
    var islogined = false;
    var username_my = "${sessionScope.user.userName}";//我的用户名
    var userPicPath = "${sessionScope.user.userPicPath}";//用户头像信息
    var userid_my = "${sessionScope.user.userId}";//获取我的username

    if (userid_my != null && userid_my.length > 0) {
        islogined = true;
    } else {
        islogined = false;
    }

    login_update(userid_my);//更新用户登录区界面

    page_ajax(1);//加载第一页

    //    $(".search_nav.navbar-form").hide();

    if (param != null && param.length > 0) {
        //加载参数中英文转换json
        $.getJSON("param.json", function (data) {


            $("#classify_info h1").text(data['' + param + ''][0]);

            $(".body_head_img").css({"background-position": data['' + param + ''][1] + "px " + data['' + param + ''][2] + "px"});

        });
    }


</script>

</body>
</html>
