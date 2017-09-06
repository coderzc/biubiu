/**
 * Created by zc on 2016/12/14.
 */

//登出,下线
function logout_submit() {

    if (userid_my) {

        if ("undefined" != typeof websocket) {//直播用户下线
            websocket.send(JSON.stringify({
                "state": 2,//下线状态码
                "logout_id": userid_my
            }));//切换为用户登录状态

            //主播下线
            if ("undefined" != typeof websocket_rtc && isprovider) {//这里先写isprovider？？？？？？
                websocket_rtc.send(JSON.stringify({
                    "style": "host_close",
                    "data": {}
                }));
                $("#live_video")[0].src = "";

                for (var key in pc_opened_array) {
                    if (pc_opened_array[key] != null) {
                        pc_opened_array[key].close();
                    }
                }
            }

        }


        $.ajax({
            type: "POST",
            url: server_path + "/ajax/logout_logoutJsonAction",
            dataType: "json",
            data: {
                logout_id: userid_my
            },
            success: function (data) {
                if (data.success) {

                    var strs = window.location.pathname.split("/");
                    var parent_path = strs[strs.length-2];

                    if (parent_path=="vip") {//如果在vip下则 重新加载
                        window.location.reload(true);//刷新页面
                    }
                    else {

                        userid_my = "";
                        islogined = false;
                        userPicPath = "";
                        username_my = "";

                        if ("undefined" != typeof ishost && "undefined" != typeof isprovider) {//这是必然的
                            ishost = false;
                            isprovider = false;
                        }
                        login_update();

                    }

                }
                else {
                    alert("下线失败请重试");
                }
            },
            error: function (jqXHR) {
                alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
            }
        });
    }
    else {
        alert("请先登录");
    }


}

$(document).ready(function () {
    $("#logout").on("click", function () {

            if (confirm("亲,确定要走吗？")) {
                logout_submit();
            }

        }
    );
})