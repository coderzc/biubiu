/**
 * Created by zc on 2016/11/8.
 */

$(document).ready(function () {

    check_video();//检查视频是否可用

    document.getElementById("demand_video").addEventListener("timeupdate", myFunction);//监听播放时间轴改变时间
    document.getElementById("demand_video").addEventListener("play", function () {
        barrage_array = barrage_array2.concat();
        // $(".d_show").empty();

    });//监听播放事件重新充满数组

    $("#sendbtn").click(function () {//弹幕发送按钮
        demand_send_Barrage();
    });
});


function load_barrages() {//根据url获取视频信息及弹幕信息

    if (barrage_array2 == null || barrage_array2.length == 0) {//获取弹幕数组
        console.log("该视频还没有弹幕");
    }
    barrage_array = barrage_array2.concat();//装载到全局变量
    update_barrage_list(barrage_array);

}


//检测视频
function check_video() {
    // setTimeout(function () {
    //     if ($("#demand_video")[0].readyState == 0) {
    //         $("#demand_video")[0].poster = "img/cannotfind.jpg";
    //     }
    // },180)

    // if (getQueryString("video_id") == "av62813213"||true) {
    //     $("#demand_video").attr("src", "http://www.bilibilijj.com/Files/DownLoad/12322682.mp4/www.bilibilijj.com.mp4?mp3=true");
    //     $("#demand_video")[0].load;
    // }

}


function update_barrage_list(barrage_list) {//更新弹幕列表
    $("#barrage_table").empty();
    for (key in barrage_list) {
        var barrage_ = barrage_list[key];
        var barrage_item = $("<tr><td class='td1'>" + getnum(parseFloat(barrage_.videoTimePrint)) + "</td><td class='td2'>" + barrage_.barrageContent + "</td><td class='td3'>" + getDate(barrage_.barrageCreateTime + "") + "</td></tr>")
        $("#barrage_table").append(barrage_item);
    }
    $("#barrage_number_").text(barrage_list.length + "");//更新总条数
}