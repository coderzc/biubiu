<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<html>
<head>
    <title>直播广场-biubiu直播</title>
    <%@include file="inclued_page/base_js_css.jsp" %>
    <style>
        .so-wrap {
            width: 980px;
            margin: 0 auto;
            overflow: hidden;
            padding-bottom: 10px;
        }

        .live-user .headline {
            width: 980px;
            line-height: 16px;
        }

        .live-user .headline h3 {
            float: left;
            font-size: 16px;
            font-weight: normal;
            color: #646c7a;
            margin-bottom: 0
        }

        .live-user .headline .user-more {
            float: right;
            font-size: 14px;
            color: #646c7a;
        }

        .live-user .headline h3 .num-txt {
            display: inline-block;
            margin-left: 10px;
            color: #aaa;
        }

        .live-user {
            margin-top: 39px;
            padding-bottom: 5px;
        }

        .live-user .live-user-wrapper {
            padding: 0 3px;
            clear: both;
        }

        .live-user .user-item {
            float: left;
            width: 312px;
            padding: 15px;
            margin-top: 20px;
            margin-right: 19px;
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.3) 0 0 3px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        .live-user .user-item .item-left {
            float: left;
            width: 80px;
            height: 80px;
            border-radius: 40px;
            overflow: hidden;
        }

        .default-img-user {
            background-size: 50px 50px;
        }

        .live-user .user-item .item-left img {
            display: block;
            width: 100%;
            height: 100%;
        }

        .live-user .user-item .item-right {
            float: left;
            width: 177px;
            margin-left: 25px;
        }

        .live-user .user-item .item-right .liveuname {
            margin-top: -2px;
            margin-bottom: 4px;
            line-height: 16px;
            color: #666;
        }

        .live-user .user-item .item-right .status.carousel {
            background-color: #f6313e;
        }

        .live-user .user-item .item-right .status {
            display: inline-block;
            margin-bottom: 6px;
            padding: 0 3px;
            line-height: 18px;
            border-radius: 4px;
            color: #fff;
        }

        .user-item .item-right .info .star {
            float: left;
            width: 88px;
            color: #666;
            line-height: 12px;
        }

        .live-user .user-item .item-right .info {
            margin-bottom: 6px;
        }

        .live-user .user-item .item-right .tags {
            margin-right: -10px;
            height: 18px;
            overflow: hidden;
        }

        .none-live {
            padding: 30px 0px;
            clear: both;
            font-size: 20px;
        }

    </style>
</head>
<body>
<%@include file="inclued_page/nav.jsp" %>
<div id="content">
    <div class="so-wrap">
        <div class="live-user">
            <div class="headline">
                <h3 class="">LIVE
                    <div class="num-txt">(<span class="num">${fn:length(roomList)}</span>个)</div>
                </h3>
            </div>
            <c:choose>
            <c:when test="${fn:length(roomList)>0}">
                <ul class="live-user-wrapper">
                    <c:forEach items="${roomList}" var="room">
                        <li class="user-item">
                            <a href="/live?roomId=${room.roomId}"
                               target="_blank" class="item-wrapper">
                                <div class="item-left default-img-user ">
                                    <img data-loaded="true" alt=""
                                         src="${room.liverAvatar}">
                                </div>
                                <div class="item-right">
                                    <p class="liveuname">${room.liverName}</p>
                                    <div class="status carousel">直播中</div>
                                    <div class="info">
                                        <div class="type">
                                            房间号:${room.roomId}
                                        </div>
                                        <div class="star">
                                                <%--在线人数--%>
                                            <i class="glyphicon glyphicon-eye-open"></i>
                                                ${room.onlineCount}
                                        </div>
                                    </div>
                                    <div class="tags">
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
            <div class="none-live">
                <span>暂无直播,请开始你的表演☞</span>
                <a href="/live?roomId=0" style="margin-left: 25px" class="button button-caution button-rounded ">Go</a>
            <div/>
                </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
    <%@include file="inclued_page/model_login.jsp" %>
</body>
<script>
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
</script>
</html>
