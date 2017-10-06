<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String host_path = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    String path = request.getContextPath();
    session.setAttribute("host_path", host_path);
    session.setAttribute("host_name", request.getServerName() + ":" + request.getServerPort());
    pageContext.setAttribute("path", path);
    session.setAttribute("port", request.getServerPort());


%>
<!DOCTYPE html>
<html>
<head>
    <%--禁止缓存--%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>***${liveRoom.liverName}的直播间***</title>

    <%@include file="inclued_page/base_js_css.jsp" %>
    <script type="text/javascript" src="video/js/jquery.colorpicker.js"></script>
    <link href="video/css/mycss.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/webrtc-adapter/5.0.4/adapter.min.js"></script>
    <script type="text/javascript" src="video/js/live_socket.js"></script>
    <script type="text/javascript" src="video/js/web_RTC.js"></script>
    <script type="text/javascript" src="video/js/send_Barrage.js"></script>
    <script type="text/javascript" src="video/js/ui.js"></script>
    <script type="text/javascript" src="video/js/format_date.js"></script>
    <script type="text/javascript" src="video/js/full_screen.js"></script>

</head>

<body>

<%@include file="inclued_page/nav.jsp" %>
<div class="content">
    <div id="video_father" style="background: url('video/img/bg_live.jpg');background-repeat: no-repeat ">
        <div id="video_info">
            <div class="videoinfo">
                    <span style="text-align: center;top: 8px;left:13px;color: rgb(33, 156, 247)">
                    <i style="background: url(img/icons.png) -535px -854px no-repeat;"></i>
                        房间主播:<span style="color: tomato;font-weight: bolder">${liveRoom.liverName}</span>&nbsp;<span
                            style="font-weight: bold;
                                    color: #ff1022;
                                    margin-left: 30px;">房间号：${liveRoom.roomId}</span></span>
            </div>
            <%--<div class="videoinfo"><span>已点赞<span id="video_like_">n</span>次</span></div>--%>
        </div>
        <div class="left_cope" style=" background: url('video/img/bg_live.jpg') 0px -35px; "></div>
        <div class="center_content">
            <div class="dm">
                <div class="d_mask">
                    <video id="live_video" class="barrage_video" autoplay width="100%" height="100%" preload="auto"
                           loop controls poster="video/img/zhibo.jpg">
                    </video>


                    <video id='view_video' autoplay hidden style="position: fixed;top: 0;left: 0;z-index: 1000"></video>
                    <%--隐藏的观众视频流--%>
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
                    <img src="video/img/colorpicker.png" width="14" height="14">
                    字体颜色
                </button>
                <input id="barr_text" type="text" class="form-control" maxlength="50"/>
                <button class="fontbutton_config btn" style="border-radius:0;" id="sendbtn" type="button">发送
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
                    <span class="video_wacthtimes">围观人数：<span id="online" style="font-size: x-large">😜</span>人</span>
                </div>
            </div>
            <div id="right_bottom">
                <div id="barrage_panle">
                    <div id="barrage_panle_header" style="text-align: center;height:10%">
                        <div style="color: #1B9AF7;margin:10px 0px;">在线观看会员</div>
                    </div>
                    <div id="barrage_list_panle" style="height:90%">
                        <table id="online_list">
                            <%--<tr style="text-align: center" >--%>
                            <%--<td class="tb2">dgfdsgfgdsfgdsfgu</td>--%>
                            <%--</tr>--%>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="right_cope" style=" background: url('video/img/bg_live.jpg') -1242px -35px;"></div>
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

<%@include file="inclued_page/model_login.jsp" %>

</body>


<script type="text/javascript">
    var videopage_type = "live";//区分直播还是点播
    var islogined = false;
    var websocket = null;
    var server_path = "${pageScope.path}";
    var ws_string;
    if (window.location.protocol == "https:") {
        ws_string = "wss://" + "${sessionScope.host_name}";
    }
    else {
        ws_string = "ws://" + "${sessionScope.host_name}";
    }

    var islived = ${liveRoom.is_lived};//正在直播吗

    var pc;//rtc连接对象
    //PeerConnection兼容版本
    var PeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
    //getUserMedia兼容版本
    var UserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
    var localVideoUrl;//本地视频源
    var remoteVideoUrl;//远程视频源
    var localStream;//本地视频流
    var remoteStream;//远程视频流

    var isprovider = false;//真正的视频主播页面

    var roomId = "${liveRoom.roomId}";
    var liverId = "${liveRoom.liverId}";//主播ID
    var liverName = "${liveRoom.liverName}";//主播name
    //var websocket_rtc = null;
    var session_id;
    var pc_opened_array = [];

    var username_my = "${sessionScope.user.userName}";//我的用户名
    var userPicPath = "${sessionScope.user.userPicPath}";//用户头像信息
    var userid_my = "${sessionScope.user.userId}";//获取我的userid

    if (userid_my != null && userid_my.length > 0) {
        islogined = true;
    } else {
        islogined = false;
    }

    login_update();//更新用户登录区界面

    websocket_functions();//socket启动


    $(document).ready(function () {


        $("#sendbtn").click(function () {//弹幕发送按钮
            live_send_Barrage(1);
        });

        $("#open_btn").click(function () {//启动直播
            if (!islived) {
                isprovider = true;//标记为视频提供者
                getUserMedia();
            } else {
                close_live();
            }
        });


        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function (event) {
            close_live();
        };


        $(".left_cope").width((($("#video_father").width()-1174)/2))
        $(".right_cope").width((($("#video_father").width()-1174)/2))
        window.onresize = function () {
            $(".left_cope").width((($("#video_father").width()-1174)/2))
            $(".right_cope").width((($("#video_father").width()-1174)/2))
        }

    });


</script>

</html>