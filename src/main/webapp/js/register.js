/**
 * Created by zc on 2016/12/25.
 */

function resign_submit() {

    var is_register = true;
    $("#resig_div .holder").each(function () {
        if (!$(this).is(":hidden")) {
            is_register = false;
        }
    });



    if (is_register) {
        $.ajax({
            type: "POST",
            url: server_path + "/ajax/registerAction",
            dataType: "json",
            data: $('#resig_form').serializeArray(),// 提交表单
            success: function (data) {
                if (data.success) {

                    alert(data.username + "注册成功！");

                    if ($("#myModal").hasClass('in')) {
                        close_modal();
                    }//关闭注册模态框

                }
                else {
                    alert(data.username + "注册失败！");
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