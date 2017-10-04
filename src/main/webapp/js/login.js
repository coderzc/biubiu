/**
 * Created by zc on 2016/11/5.
 */

//手动连接登录
function login_submit() {
    if ($("#hold1").is(":hidden") && $("#login_form input[name='user_password']").val() != "") {
        var s = $('#login_form').serialize();
        $.ajax({
            type: "POST",
            url: server_path+"/ajax/login_loginJsonAction",
            dataType: "json",
            data: $('#login_form').serializeArray(),// 提交表单
            success: function (data) {
                if (data.success) {
                    // alert(data.username + "登陆成功！");
                    if ("undefined" != typeof websocket) {
                        websocket.send(JSON.stringify({"group":"danmu","state": 0}));//切换为用户登录状态
                    }

                    userid_my = data.user_id;
                    username_my = data.username;
                    userPicPath = data.userPicPath;
                    // if("undefined"!=typeof roomId){
                    //     data.roomId==roomId?isliver()=true:isliver=false;
                    // }
                    islogined = true;
                    login_update();
                }
                else {
                    if (data.islogined) {
                        alert(data.username + "已经登录请先下线");
                    } else {
                        alert(data.username + "登陆失败！");
                    }
                }
            },
            error: function (jqXHR) {
                alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
            }
        });
    }
    else {
        alert("请核对信息再提交")
    }

}

//登录更新界面
function login_update() {
    if (islogined) {
        $("#user_name_").text(username_my);
        $("#logined img").attr("src", server_path + userPicPath);
        //头像
        copeClose();
        if ($("#myModal").hasClass('in')) {
            close_modal();
        }//登录关闭模态框
        if ("undefined" != typeof videopage_type) {
            if (videopage_type == "live") {//直播

                // alert(username_my);
                if (isliver()) {
                    $("#open_btn").show();
                    // alert("你是主播");
                    $("#user_name_").append("<i class='glyphicon glyphicon-fire'>(*主播*)</i>")
                    if (islived) {
                        $("#open_btn").css({"background-color": "#ff9800","color":'antiquewhite'});
                        $("#open_btn").text("关闭直播");
                        // $("#open_btn").attr("disabled", "disabled");
                    }
                } else {
                    $("#open_btn").hide();
                }
            }
            else if (videopage_type == "demand") {//点播
                // alert(userid_my + "---" + up_userid)
                if (userid_my == up_userid) {
                    // alert("你是up主");
                    $("#user_name_").append("<i class='glyphicon glyphicon-fire'>(*UP*)</i>")
                }
            }

        }



    }
    else {//游客状态
        $("#open_btn").hide();
        copeOpen();
    }

}

//用户(手机号/用户名)存在检测
function isexit_user(user_id_name) {
    var defer = $.Deferred();//链式等待加载。。。

    $.ajax({
        type: "POST",
        url:  server_path+"/ajax/exist_user_loginJsonAction",
        // url:"../LoginServlet",
        dataType: "json",
        data: {
            user_pre: user_id_name
        },
        success: function (data) {
            if (data.success) {
                defer.resolve(true);
            }
            else {
                defer.resolve(false);
            }
        },
        error: function (jqXHR) {
            alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
        }
    });

    return defer;
}


//用户Id存在检测
function isexit_user_id(user_id) {
    var defer = $.Deferred();//链式等待加载。。。
    $.ajax({
        type: "POST",
        url:  server_path+"/ajax/exist_user_id_loginJsonAction",
        dataType: "json",
        data: {
            user_id_pre: user_id
        },
        success: function (data) {
            if (data.success) {
                defer.resolve(true);
            }
            else {
                defer.resolve(false);
            }
        },
        error: function (jqXHR) {
            alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
        }
    });

    return defer;
}


//检测用户名是否已经被注册
function isexit_user_name(user_name_pre) {

    $.ajax({
        type: "POST",
        url:  server_path+"/ajax/exist_username_loginJsonAction",
        dataType: "json",
        data: {
            user_name_pre: user_name_pre
        },
        success: function (data) {
            if (data.success) {
                $("#hold4").text("用户名已经被注册").show();
            }
            else {
                $("#hold4").hide();
            }
        },
        error: function (jqXHR) {
            alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
        }
    });
}


function copeClose() {//登陆后关闭遮挡
    $("#send_cope").hide();
    $("#login_regist").hide();
    $("#logined").show();
}

function copeOpen() {//登出后打开遮挡
    $("#send_cope").show();
    $("#login_regist").show();
    $("#logined").hide();
}