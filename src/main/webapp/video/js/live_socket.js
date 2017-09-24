/**
 * Created by zc on 2016/11/6.
 */

//websocket 方法组
function websocket_functions() {
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket(ws_string + "/websocket/danmusocket");
    } else {
        alert('Not support websocket');
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
        console.log("error");

    }
    //连接成功建立的回调方法
    websocket.onopen = function (event) {
        console.log("open");
        // video_play();//获取直播点并播放
       
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        var data = JSON.parse(event.data);
        message_handle(data);
    }
    //连接关闭的回调方法
}
    websocket.onclose = function () {
        console.log("close");
        // alert("socket closed")

    }
}


//消息处理方法
function message_handle(data) {

    if (data.onlinenum!=null) {//更新用户在线列表
        $("#online").text(data.onlinenum);//围观人数刷新
        if (data.onlinelist != null) {//更新列表
            // console.log(data.onlinelist)
            update_onlinelist_ui(data.onlinelist);

        }

//            if (data.onlinenum>parseInt($("#online").text())) {
//                alert("围观数+1")
//            }else {
//                alert("围观数-1")
//            }
    }
    else {//接受并解析弹幕
        analyze_live_barrage(data.barrage);
    }
}


function update_onlinelist_ui(onlinelist) {//更新在人线数列表
    $("#online_list").empty();//列表刷新
    for (var key in onlinelist) {
        var online_item = $("<tr style='text-align: center'><td class='td4'>" + onlinelist[key] + "</td></tr>");
        online_item.css({color: getReandomColor()})//颜色随机
        $("#online_list").append(online_item);
    }
}

/*----------------------------------------------下面是rtc_socket-----------------------------------------------------------*/

//web_rtc_socket 方法组
function websocket_rtc_functions() {
    //判断当前浏览器是否支持websocket
    if ('WebSocket' in window) {
        websocket_rtc = new WebSocket(ws_string + "/websocket/myrtc");
    } else {
        alert('Not support websocket');
    }
    //连接发生错误的回调方法
    websocket_rtc.onerror = function () {
        console.log("rtc_error");

    }
    //连接成功建立的回调方法
    websocket_rtc.onopen = function (event) {
        console.log("rtc_open");
        if (islived&&!ishost) {//播放了

            getUserMedia();

            // var stream_null = $("<canvas></canvas>")[0].captureStream(25);
            // localStream = stream_null;


            // UserMedia.call(navigator, {
            //     video: true,
            //     audio: true
            // }, function(stream) {
            //     var audioTrack = stream.getAudioTracks()[0];
            //     audioTrack.enabled=false;
            //     var videoTrack = stream.getVideoTracks()[0];
            //     videoTrack.enabled=false;
            //     localStream.addTrack(audioTrack);
            //     localStream.addTrack(videoTrack);
            //     requst_live_src();
            // }, function(e) {
            //     console.log('Reeeejected!', e);
            // });






        }
    };
    //接收到消息的回调方法
    websocket_rtc.onmessage = function (event) {
        var data = JSON.parse(event.data);
        processSignalingMessage(data);
    }
    //连接关闭的回调方法
    websocket_rtc.onclose = function () {
        console.log("rtc_close");
    }
}