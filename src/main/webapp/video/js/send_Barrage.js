/**
 * Created by zc on 2016/11/8.
 */

/*//发弹幕
 barrageId        id（扩展功能）
 barrageContent   弹幕内容
 barrageSpade     发送速度 （int倍率）
 barrageColor     弹幕颜色  String
 barrageFontSize  字体大小  int
 */
function send_barrage(barrageId, barrageContent, barrageSpeed, barrageColor, barrageFontSize) {
    var barr_div = $("<div>" + barrageContent + "</div>");//装载弹幕到.show
    barr_div.addClass("new");
    $(".d_show").append(barr_div);

    var _top = 2;
    var _left = $(".barrage_video").width();
    var _height = $(".barrage_video").height();
    if (barr_div.prev().position() != null) {
        _top = barr_div.prev().position().top + barr_div.prev().height();
//                var range = 2 * _height / 3 - barr_div.height();
//               do{
//                   _top=  Math.random() * range
//               }while(Math.abs(_top-(barr_div.prev().position().top))<=barr_div.height()/2);
    }
    else {
        _top = 2;
    }

    if (_top >= 2 * _height / 3 - barr_div.height()) {
        _top = 2;
    }
    barr_div.css({"font-size": barrageFontSize + "px", left: _left, top: _top, color: barrageColor});
    var distance = $(".barrage_video").width() + barr_div.width();
    barr_div.removeClass("new");
    barr_div.animate({left: "-=" +distance+ "px"}, 1000 * (distance / barrageSpeed), "linear", function () {
        barr_div.remove();
    });

}


function myFunction() {//根据时间点发送弹幕
    for (key in barrage_array) {//遍历弹幕
        var barrage_object = barrage_array[key];
           // alert(parseInt(barrage_object.videoTimePrint)+"---"+this.currentTime)
        if (parseInt(this.currentTime) == parseInt(barrage_object.videoTimePrint)) {
            send_barrage(barrage_object.barrageId, barrage_object.barrageContent, barrage_object.barrageSpeed,
                barrage_object.barrageColor, barrage_object.barrageFontSize, barrage_object.videoTimePrint)
            barrage_array.splice(key, 1);
        }
    }
}


function demand_send_Barrage() {//点播发送弹幕
    if (!islogined) {
        alert("请先登录");
        return;
    }

    var barrageContent = $("#barr_text").val();
    var barrageSpeed = $("#speed_btns .clicked").val();
    var barrageFontSize = $("#size_btns .clicked").val();
    var barrageColor = $("#sendcolor").val();
    var videoTimePrint = $("#demand_video")[0].currentTime;//发送的视频时间节点
    var videoId_ = videoId;
    // var userId = userid_my;

    if(barrageContent!=null&&barrageContent.length>0){
        send_barrage(null, barrageContent, barrageSpeed, barrageColor, barrageFontSize);//上屏

        $.ajax({
            type: "POST",
            url: "../ajax/insert_Barr_barragesJsonAction",
            dataType: "json",
            cache:false,
            data: {
                barrageContent: barrageContent,
                barrageSpeed: barrageSpeed,
                barrageColor: barrageColor,
                barrageFontSize: barrageFontSize,
                videoTimePrint: videoTimePrint,
                'barrage_video.videoId': videoId_
                // ,'barr_user.userId': userId
            },
            success: function (data) {
                if (data.success) {
                    $("#barr_text").val("");
                    console.log("insert barrage success");
                }
                else {
                    console.log("insert barrage failure");
                }
            }
            ,
            error: function (jqXHR) {
                alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
            }
        });

    }
}

function live_send_Barrage(state) {//直播发送弹幕
//State 1 群发弹幕
//      2 用户下线
//      0 用户手动登陆
    if (!islogined) {
        alert("请先登录！");
        return;
    }
    if (!islived) {
        alert("直播还未开始哟");
        return;
    }



    var barrageContent = $("#barr_text").val().trim();
    var barrageSpade = $("#speed_btns .clicked").val();
    var barrageFontSize = $("#size_btns .clicked").val();
    var barrageColor = $("#sendcolor").val();

    // send_barrage(null, barrageContent, barrageSpade, barrageColor, barrageFontSize);//上屏

    if(barrageContent!=null&&barrageContent.length>0){

        websocket.send(JSON.stringify({
            "group":"danmu",
            "state": state,
            "barrage": {
                "barrageContent": barrageContent,
                "barrageSpeed": barrageSpade,
                "barrageColor": barrageColor,
                "barrageFontSize": barrageFontSize
            }
        }));

        $("#barr_text").val("");

    }
    
}

function analyze_live_barrage(barrage) {//解析直播发过来的弹幕并上屏
    // var barr = barrage.barrageContent + "---" + barrage.barrageColor + "---" + barrage.barrageSpade + "---" + barrage.barrageFontSize;
    // alert(barr);
    send_barrage(null,barrage.barrageContent,barrage.barrageSpeed,barrage.barrageColor,barrage.barrageFontSize)

}


//获取随机颜色
   function getReandomColor() {
       return '#' + (function (h) {
                   return new Array(7 - h.length).join("0") + h
               })((Math.random() * 0x1000000 << 0).toString(16))
   }