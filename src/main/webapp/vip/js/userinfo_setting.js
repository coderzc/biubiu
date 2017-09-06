$(document).ready(function () {
    $('#sex_ul li').click(function () {
        var $this = $(this);
        $('#sex_ul li').removeClass('blue');
        $this.addClass('blue');
        $('#select_sex').val($this.data('sex'));
    });
    var _sex = $('#select_sex').val();
    $('#sex_ul li').each(function () {
        if (_sex == $(this).data('sex')) {
            $(this).addClass('blue');
        } else {
            $(this).removeClass('blue');
        }
    })

    $('#user_info_form').submit(
        function () {
            $.ajax({
                type: "POST",
                url: server_path + "/ajax/userAjax-uinfo",
                dataType: "json",
                data: $('#user_info_form').serializeArray(),// 提交表单
                success: function (data) {
                    if (data.success) {
                        alert("信息修改成功！");
                        window.location.reload(true);
                    }
                    else {
                        alert("信息修改失败！");
                    }
                },
                error: function (jqXHR) {
                    alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
                }
            });


            return false;
        });
});
