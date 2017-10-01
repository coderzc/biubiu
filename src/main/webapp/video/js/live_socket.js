/**
 * Created by zc on 2016/11/6.
 */

//websocket 方法组
function websocket_functions() {
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket(ws_string + "/websocket/live/"+roomId);

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
        if (!isliver) {//不是主播
            requst_live_src()
        }else {
            console.log("你是主播")
            requst_live_src()
        }
}

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        var data = JSON.parse(event.data);
        if(data.group=="rtc"){
            processSignalingMessage(data);
        }else {
            message_handle(data);
        }
    }
    //连接关闭的回调方法
    websocket.onclose = function () {
        console.log("close");
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