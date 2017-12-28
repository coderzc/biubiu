/**
 * Created by zc on 2016/6/27.
 */
function login_model_show() {
    $(".modal-body").find("input").val("")
    $("#login_div").show();
    $("#resig_div").hide();
    $(".holder").hide();
}
function resign_model_show() {
    $(".modal-body").find("input").val("")
    $("#resig_div").show();
    $("#login_div").hide();
    $(".holder").hide();
}
function close_modal() {
    $("#myModal_content").css("-webkit-animation", "umod 1s linear");
    $("#myModal_content").css("animation-fill-mode", "forwards");
    setTimeout(" $('#myModal').modal('hide')", 1000)
}


$(document).ready(function () {
    
    
    //用户id(手机号)存在检测
    $("#userid_login").blur(function () {
        var str_id = $(this).val().trim();
        if (str_id != null && str_id.length > 0) {
            $.when(isexit_user(str_id)).done(function (is_exit) {
                if (is_exit) {
                    $("#hold1").hide();
                } else {
                    $("#hold1").text("用户不存在");
                    $("#hold1").show();
                }
            })

        } else {
            $(this).next("span").text("用户不能为空");
            $(this).next("span").show();
        }
    });


    $("#myModal").on("shown.bs.modal", function () {
        $("#myModal_content").css("-webkit-animation", "mod 1s linear");
    });

    //登录模态框打开
    $("#btn1").click(function () {
        $("#myModal").modal("show");
        $("#xian").css({left: '2px'});
        login_model_show()
    });
    //注册模态框打开
    $("#btn2").click(function () {
        $("#myModal").modal("show");
        $("#xian").animate({left: '51px'});
        resign_model_show()
    });

    //滑动小线动画
    $("#mydelulablel").click(function () {
        $("#xian").animate({left: '2px'});
        login_model_show();
    });
    $("#myzhucelablel").click(function () {
        $("#xian").animate({left: '51px'});
        resign_model_show();
    });


    $("#username_resig").blur(function () {
        var str = this.value;
        var par = /^\d+$/;
        if (par.test(str)) {
            $(this).next("span").text("用户名不能纯数字").show();
        } else {
            $(this).next("span").hide();
            if (str != null && str.length > 0) {
                isexit_user_name(str);
            }
            else {
                $(this).next("span").text("用户名不能为空").show();
            }

        }
    });

    //密码相同检验
    $("#password2").blur(function () {
        var str = $(this).val().trim();
        if(str!=null&&str.length>0){
            check_password2();
        }else {
            $("#password2").next("span").text("请填写密码").show();
        }
    });
    

    function check_password2() {
        var password1 = document.getElementById('password1').value;
        var password2 = document.getElementById('password2').value;
        if (password1 != password2) {
            $("#password2").next("span").text("两次密码不同").show();
            document.getElementById('password1').value = "";
            document.getElementById('password2').value = "";
        }
    }

    $("#phone_resig").blur(function () {
        var str_id = this.value;
        var par = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (!par.test(str_id)) {
            $(this).next("span").text("手机格式错误").show();
        } else {//手机号重复性检验
            if (str_id != null && str_id.length > 0) {
                $.when(isexit_user_id(str_id)).done(function (is_exit) {
                    if (is_exit) {
                        $("#hold3").text("手机号已被注册");
                        $("#hold3").show();
                    } else {
                        $("#hold3").hide();
                    }
                })
            } else {
                $(this).next("span").text("手机号不能为空");
                $(this).next("span").show();
            }
        }

    });


    $("#email_resig").blur(function () {
        var str = this.value;
        var reg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (!reg.test(str)) {
            $(this).next("span").text("邮箱格式错误").show();
        }
    });


    //恢复检验
    $("#resig_div,#login_div").find("input").focus(function () {

        if ($(this).attr("name") != "rember") {
            $(this).next("span").hide();
        }
    });
    
});
