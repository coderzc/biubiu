<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <%@include file="inclued_page/base_js_css.jsp" %>
    <link href="./css/home.css" rel="stylesheet">
</head>
<script>


</script>
<body>

<%@include file="inclued_page/nav.jsp" %>
<div id="header_img_header">
</div>
<div id="content">

    <div class="body_middle" id="douga_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -908px">
                </span>
                <span class="body_head_text">
                    <h2>动画</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=douga" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="douga_ul">
                <c:forEach items="${douga}" var="douga_">
                <li>


                    <div class="view_radio">
                        <a href="${path}/video/demand?video_id=${douga_.videoId}" class="cover-preview" target="_blank" title="动画图片">
                            <div class="img_display">
                                <img src="${path}${douga_.videoCoverPath}">
                            </div>
                        </a>

                        <a title="${douga_.videoTitle}" href="" target="_blank">
                            <div class="topic_title">
                                ${douga_.videoTitle}
                            </div>
                        </a>
                        <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                ${douga_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="fanju_div">
    <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -140px">
                </span>
                <span class="body_head_text">
                    <h2>番剧</h2>
                </span>
        <div class="body_link_more">
            <a href="${path}/classify?videoType=fanju" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
            </a>
        </div>
    </div>

    <div class="body_body">
        <ul class="video_box_list" id="fanju_ul">
            <c:forEach items="${fanju}" var="fanju_">
                <li>



                    <div class="view_radio">
                        <a href="${path}/video/demand?video_id=${fanju_.videoId}" class="cover-preview" target="_blank" title="番剧图片">
                            <div class="img_display">
                                <img src="${path}${fanju_.videoCoverPath}">
                            </div>
                        </a>

                        <a title="${fanju_.videoTitle}" href="" target="_blank">
                            <div class="topic_title">
                                    ${fanju_.videoTitle}
                            </div>
                        </a>
                        <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${fanju_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

    <div class="body_middle" id="music_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -140px -266px">
                </span>
                <span class="body_head_text">
                    <h2>音乐</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=music" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="music_ul">
                <c:forEach items="${music}" var="music_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${music_.videoId}" class="cover-preview" target="_blank" title="音乐图片">
                                <div class="img_display">
                                    <img src="${path}${music_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${music_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${music_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${music_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="dance_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -461px">
                </span>
                <span class="body_head_text">
                    <h2>舞蹈</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=dance" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="dance_ul">
                <c:forEach items="${dance}" var="dance_">
                    <li>
                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${dance_.videoId}" class="cover-preview" target="_blank" title="舞蹈图片">
                                <div class="img_display">
                                    <img src="${path}${dance_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${dance_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${dance_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${dance_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="game_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -203px">
                </span>
                <span class="body_head_text">
                    <h2>游戏</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=game" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="game_ul">
                <c:forEach items="${game}" var="game_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${game_.videoId}" class="cover-preview" target="_blank" title="游戏图片">
                                <div class="img_display">
                                    <img src="${path}${game_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${game_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${game_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${game_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="technology_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -525px">
                </span>
                <span class="body_head_text">
                    <h2>科技</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=technology" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="technology_ul">
                <c:forEach items="${technology}" var="technology_">
                    <li>

                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${technology_.videoId}" class="cover-preview" target="_blank" title="科技图片">
                                <div class="img_display">
                                    <img src="${path}${technology_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${technology_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${technology_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${technology_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="life_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -137px -970px">
                </span>
                <span class="body_head_text">
                    <h2>生活</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=life" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="life_div_ul">
                <c:forEach items="${life}" var="life_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${life_.videoId}" class="cover-preview" target="_blank" title="生活图片">
                                <div class="img_display">
                                    <img src="${path}${life_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${life_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${life_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${life_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="kichiku_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -332px">
                </span>
                <span class="body_head_text">
                    <h2>鬼畜</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=kichiku" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="kichiku_ul">
                <c:forEach items="${kichiku}" var="kichiku_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${kichiku_.videoId}" class="cover-preview" target="_blank" title="鬼畜图片">
                                <div class="img_display">
                                    <img src="${path}${kichiku_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${kichiku_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${kichiku_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${kichiku_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="fashion_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -718px">
                </span>
                <span class="body_head_text">
                    <h2>时尚</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=fashion" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="fashion_ul">
                <c:forEach items="${fashion}" var="fashion_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${fashion_.videoId}" class="cover-preview" target="_blank" title="时尚图片">
                                <div class="img_display">
                                    <img src="${path}${fashion_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${fashion_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${fashion_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${fashion_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="ad_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -140px -1228px">
                </span>
                <span class="body_head_text">
                    <h2>广告</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=ad" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="ad_ul">
                <c:forEach items="${ad}" var="ad_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${ad_.videoId}" class="cover-preview" target="_blank" title="广告图片">
                                <div class="img_display">
                                    <img src="${path}${ad_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${ad_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${ad_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${ad_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="ent_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -1032px">
                </span>
                <span class="body_head_text">
                    <h2>娱乐</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=ent" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="ent_ul">
                <c:forEach items="${ent}" var="ent_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${ent_.videoId}" class="cover-preview" target="_blank" title="娱乐图片">
                                <div class="img_display">
                                    <img src="${path}${ent_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${ent_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${ent_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${ent_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="body_middle" id="film_div">
        <div class="body_head">
                <span class="body_head_img" style="background-position: -141px -396px">
                </span>
                <span class="body_head_text">
                    <h2>影视</h2>
                </span>
            <div class="body_link_more">
                <a href="${path}/classify?videoType=film" class="button button-border button-rounded button-primary button-tiny">更多><i class="b_icon"></i>
                </a>
            </div>
        </div>

        <div class="body_body">
            <ul class="video_box_list" id="film_ul">
                <c:forEach items="${film}" var="film_">
                    <li>



                        <div class="view_radio">
                            <a href="${path}/video/demand?video_id=${film_.videoId}" class="cover-preview" target="_blank" title="影视图片">
                                <div class="img_display">
                                    <img src="${path}${film_.videoCoverPath}">
                                </div>
                            </a>

                            <a title="${film_.videoTitle}" href="" target="_blank">
                                <div class="topic_title">
                                        ${film_.videoTitle}
                                </div>
                            </a>
                            <div class="view_radio_botton">
                            <span class="video_play">
                                <i class="b-icon b-icon-v-play"></i>
                                    ${film_.videoWatchCount}</span>
                            <span class="video_danmu">
                                <i class="b-icon b-icon-v-dm"></i>
                                30</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
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
