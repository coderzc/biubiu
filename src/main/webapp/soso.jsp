<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>搜索</title>
    <%@include file="inclued_page/base_js_css.jsp" %>
    <script src="js/page_.js" type="text/javascript"></script>
    <script src="js/soso.js" type="text/javascript"></script>
    <link href="css/res_soso.css" rel="stylesheet">
</head>
<body>
<%@include file="inclued_page/nav.jsp" %>
<div id="input-group input-group-lg" style="position: relative;top: 15px;">
    <%--<div id="top_contain"></div>--%>

    <div id="logo_input">
        <div id="logo">
        </div>
        <div class="input-group input-group-lg" id="search" style="margin-left: 45px;">

            <input type="text" class="form-control" placeholder="输入关键字">
        </div>
        <div id="serarch_button">
            <a id="search_soso" class="button button-glow button-rounded button-raised button-primary">搜索</a>
        </div>
    </div>
    <div id="nav_sub">
        <ul class="wrap">
            <li class="sub_active">综合</li>
            <li class="sub">
                视频
                <span>99+</span>
            </li>
            <li class="sub">
                番剧
                <span>0</span>
            </li>
            <li class="sub">
                影视
                <span>0</span>
            </li>
            <li class="sub">
                直播
                <span>0</span>
            </li>
            <li class="sub">
                专题
                <span>0</span>
            </li>
            <li class="sub">
                话题
                <span>0</span>
            </li>
            <li class="sub">
                UP主
                <span>0</span>
            </li>
            <li class="sub">
                画友
                <span>99+</span>
            </li>
        </ul>

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
    var param = getQueryString("keyword");//参数

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

    page_ajax(1);//加载第一页

    login_update(userid_my);//更新用户登录区界面

    $(".search_nav.navbar-form").hide();

    $(document).ready(function () {
        $('#search input').keydown(function (event) {
            if (event.which == 13) {
                soso($('#search input').val());
            }
        });

        $("#search_soso").click(function () {
            soso($('#search input').val());
        });
    });

</script>


</body>
</html>
