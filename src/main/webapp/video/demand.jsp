<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <%--禁止缓存--%>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${video_info.videoTitle}-biubiu</title>
    <%@include file="../inclued_page/base_js_css.jsp" %>

    <script type="text/javascript" src="js/jquery.colorpicker.js"></script>
    <%--<link href="../css/buttons.css" rel="stylesheet">--%>
    <script type="text/javascript" src="js/demand_Barrage.js"></script>
    <script type="text/javascript" src="js/send_Barrage.js"></script>
    <script type="text/javascript" src="js/ui.js"></script>
    <link href="css/mycss.css" rel="stylesheet">
    <script type="text/javascript" src="js/format_date.js"></script>
    <script type="text/javascript" src="js/full_screen.js"></script>

</head>

<body>
<%@include file="../inclued_page/nav.jsp" %>
<div class="content">
    <div id="video_father">
        <div id="video_info" style="background-color: #f6f9fa">
            <div class="videoinfo"><span>视频名称：<span id="video_name_">${video_info.videoTitle}</span>&nbsp;&nbsp;</span>
            </div>
            <div class="videoinfo"><span>已点赞<span id="video_like_">${fn:length(video_info.video_likeSet)}</span>次</span>
            </div>
        </div>
        <div class="left_cope" style="background-color: #f6f9fa"></div>
        <div class="center_content">
            <div class="dm" style="top: -1px;left: 0px">
                <div class="d_mask">
                    <video id="demand_video" class="barrage_video" controls width="100%" height="100%" preload="auto">
                        <source id="mp4_src"
                                src="${requestScope.video_info.videoPath}"/>
                    </video>
                </div>
                <div class="d_show"></div>
            </div>
            <div id="sendnav">
                <button class="fontbutton_config btn" style="border-radius:0;" id="sendfont_speed" type="button"><i
                        class="glyphicon glyphicon-plane"
                        style="color: #f92231;font-size: 13px;top: 3px;left: -2px"></i>字体速度
                </button>
                <button class="fontbutton_config btn" style="border-radius:0;" id="sendfont_size" type="button"><i
                        class="glyphicon glyphicon-text-width"
                        style="color: #4cb0f9;font-size: 13px;top: 3px;left: -2px"></i>字体大小
                </button>
                <button class="fontbutton_config btn" style="border-radius:0;" id="sendcolor" type="button"
                        value="#ffffff">
                    <img src="img/colorpicker.png" width="14" height="14">
                    字体颜色
                </button>
                <input id="barr_text" type="text" class="form-control" maxlength="50" style="width: 60%"/>
                <button class="fontbutton_config btn" style="border-radius:0;width: 10%" id="sendbtn" type="button">发送
                </button>
                <div id="send_cope">
                    <div id="send_cope_content"><a href="#"
                                                   onclick=" $('#myModal').modal('show');$('#xian').css({left:'2px'});login_model_show();">登录</a>
                        或者<a href="#"
                             onclick="$('#myModal').modal('show'); $('#xian').animate({left:'51px'});resign_model_show()">注册</a>后就能发弹幕啦(●'◡'●)~
                    </div>
                </div>
            </div>
        </div>
        <div id="right_content">
            <div id="right_top">
                <div>
                    <br>
                    <span class="video_wacthtimes">已播放<span id="play_num_"
                                                            style="font-size: x-large">${video_info.videoWatchCount}</span>次</span>
                    <span class="video_wacthtimes"><span id="barrage_number_"
                                                         style="font-size: larger">n</span>条弹幕</span>
                </div>
            </div>
            <div id="right_bottom">
                <div id="barrage_panle">
                    <div id="barrage_panle_header" style="text-align: center">
                        <div style="color: #1B9AF7;margin:10px 0px;">弹幕列表</div>
                        <table style="color: darkgrey;font-size: 13px;">
                            <tr>
                                <td class="td1">时间</td>
                                <td class="td2">弹幕内容</td>
                                <td class="td3">发送日期</td>
                            </tr>
                        </table>
                    </div>
                    <div id="barrage_list_panle">
                        <table id="barrage_table">
                            <tr>
                                <td class="td1">15:34</td>
                                <td class="td2">你啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</td>
                                <td class="td3">11-9 13:12</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="right_cope" style="background-color: #f6f9fa"></div>

        <div id="sendfontchoose_panle">
            <div id="speed_btns">
                <button id="speed" class="speed_btn btn btn-sm btn-info" value="290">快</button>
                <button class="speed_btn btn btn-sm btn-info clicked" value="190">一般</button>
                <button class="speed_btn btn btn-sm btn-info" value="100">慢</button>
            </div>
            <div id="size_btns">
                <button class="size_btn btn btn-sm btn-info" value="16">小</button>
                <button class="size_btn btn btn-sm btn-info clicked" value="22">中</button>
                <button class="size_btn btn btn-sm btn-info" value="29">大</button>
            </div>

        </div>
    </div>
</div>
<%@include file="../inclued_page/model_login.jsp" %>
</body>

<script>

    var server_path = "${pageScope.path}";
    var videopage_type = "demand";//区分直播还是点播
    var barrage_array;//全局变量弹幕组
    var barrage_array2;//全局变量弹幕组(缓存)
    var up_userid = "${video_info.up_user.userId}";//视频up主
    var videoId = "${video_info.videoId}";//视频id

    var islogined = false;
    var username_my = "${sessionScope.user.userName}";//我的用户名
    var userPicPath = "${sessionScope.user.userPicPath}";//用户头像信息
    var userid_my = "${sessionScope.user.userId}";//获取我的username

    if (userid_my != null && userid_my.length > 0) {
        islogined = true;
    } else {
        islogined = false;
    }


    barrage_array2 = ${requestScope.barrage_jsonArray};//获取弹幕到全局变量(缓存)


    load_barrages();//装载弹幕

    login_update(userid_my);//更新用户登录区界面

    $(document).ready(function () {
        $(".left_cope").width((($("#video_father").width() - 1174) / 2))
        $(".right_cope").width((($("#video_father").width() - 1174) / 2))
        window.onresize = function () {
            $(".left_cope").width((($("#video_father").width() - 1174) / 2))
            $(".right_cope").width((($("#video_father").width() - 1174) / 2))
        }
    })
</script>
</html>
