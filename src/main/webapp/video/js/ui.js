/**
 * Created by johl on 2016/11/10.
 */

function isclick() {//单选按钮组事件
    $(this).parent().find("button").each(function (i, v) {
        if ($(this)[0] == event.target) {
            $(this).addClass("clicked");
            $(this).css({background_color: "#4285F4"})
        }
        else {
            $(this).removeClass("clicked");
        }
    });
}


$(document).ready(function () {
    
    $("#sendfont_size").on("click", function () {
        if ($("#sendfontchoose_panle").css("display") == "none") {
            $("#sendfontchoose_panle").show();
            $("#size_btns").show();
        } else {
            if ($("#size_btns").css("display") == "none") {
                $("#size_btns").show();
                $("#speed_btns").hide();
            }
            else {
                $("#sendfontchoose_panle").hide();
                $("#size_btns").hide();
            }
        }
    });

    $("#sendfont_speed").on("click", function () {
        if ($("#sendfontchoose_panle").css("display") == "none") {
            $("#sendfontchoose_panle").show();
            $("#speed_btns").show();
        } else {
            if ($("#speed_btns").css("display") == "none") {
                $("#speed_btns").show();
                $("#size_btns").hide();
            }
            else {
                $("#sendfontchoose_panle").hide();
                $("#speed_btns").hide();
            }
        }
    });

    $("#sendfontchoose_panle button").on("click", isclick)
    $("#sendcolor").colorpicker({
        fillcolor: true,
        target: "#jADFV******FV7FW",
        success: function (o, color) {
            $("#sendcolor").val(color)
            $("#barr_text").css({color: color});
        }
    });

    $(".fontbutton_config").mouseenter(function () {
        $(this).css({"background-color": "#4285F4"});
        $(this).css({"color": "white"});
    });
    $(".fontbutton_config").mouseleave(function () {
        $(this).css({"background-color": "white"});
        $(this).css({"color": "black"});
    });

    $("#sendfont_size").on("click", function () {
        $("#colorpanel").hide();
    });

    $("#sendfont_speed").on("click", function () {
        $("#colorpanel").hide();
    });

    $("#sendcolor").on("click", function () {
        $("#sendfontchoose_panle").hide();
        $("#speed_btns").hide();
        $("#size_btns").hide();
    });


    $("#barr_text").keydown(function (event) {
        if(event.which==13){
            if(videopage_type=="demand"){
                demand_send_Barrage();
            }else
            {
                live_send_Barrage(1)
            }
        }
    });




});

