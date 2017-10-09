$(document).ready(function () {

    $("#upload_video").on("change", function () {
        $(".file-other-error.text-danger").parent().remove();
    });


    $("#upload_video").fileinput({
        language: 'zh', //设置语言
        uploadUrl: '../ajax/upload-video', // you must set a valid URL here else you will get an error
        maxFileSize: 1000000,
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        dropZoneEnabled: true,//是否显示拖拽区域
        showUpload: true,
        showCaption: true,//是否显示标题
        showPreview: true,//是否显示预览
        overwriteInitial: true,//是否覆盖已经存在的图片
        validateInitialCount: true,
        allowedFileTypes: ["video"],
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        allowedPreviewTypes: "text",
        // browseClass:"" ,
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');

        }
    });


    $("#uploadfile").on('fileselect', function (event, n, l) {//更改上传文件触发
        // alert('File Selected. Name: ' + l + ', Num: ' + n);
        //     $(".file-other-error.text-danger").parent().remove();
        $(".file-preview-frame").remove();

    });


//异步上传失败返回结果处理
    $('#upload_video').on('fileerror', function (event, data, msg) {
        console.log(data.id);
        console.log(data.index);
        console.log(data.file);
        console.log(data.reader);
        console.log(data.files);
        // get message

        alert("上传失败！");
    });
//异步上传成功返回结果处理
    $("#upload_video").on("fileuploaded", function (event, data, previewId, index) {
        console.log(data);
        console.log(data.id);
        console.log(data.index);
        console.log(data.file);
        console.log(data.reader);
        console.log(data.files);
        var obj = data.response;
        if (obj.success) {

            setTimeout(function () {

                alert("上传成功");

                $(".cover-wrp .cover-box").css({
                    "background-image": "url(" + obj.videoCoverURL + ")",
                    "border":"none"
                });

                $("#videopath").val(obj.videoURI);
                $("#videocoverpath").val(obj.videoCoverURI);
                is_uploaded = true;

            },100)

        } else {
            alert("上传失败");
        }

    });


    //isDiy 单选操作
    $(".control-group label").on("click", function () {
        $(".control-group input").removeClass("is-checked");
        $(this).find("input").addClass("is-checked");
    });


    //videoType单选操纵
    $(".section.type-wrp .type-btn").on("click", function () {
        $(".section.type-wrp .type-btn").removeClass("is-selected");
        $(this).addClass("is-selected");
        $("#videotype").val($(this).val());

    });

    //标题框
    $(".bili-input").on("input", function () {
        var length = $(this).val().length;
        // alert(length);
        $(".title-wrp .count-wrp").text(length + "/80")
    });


    //提交视频信息
    $('#video_form').submit(
        function () {
            if (is_uploaded) {
                $.ajax({
                    type: "POST",
                    url: server_path + "/ajax/video_submit",
                    dataType: "json",
                    data: $('#video_form').serializeArray(),// 提交表单
                    success: function (data) {
                        if (data.success) {
                            // alert("投稿成功！");

                            $("#submiting").hide();

                            $(".success-wrp .outline").text(data.videoTitle);
                            $(".success-wrp .video_url_").text(full_path + "/video/demand?video_id=" + data.videoId);
                            $(".success-wrp .pic img").attr("src", $("#videocoverpath").val());

                            $("#submited").show();

                            $("#go_video").attr("href", server_path + "/video/demand?video_id=" + data.videoId);
                            $("#again_video").attr("href", server_path + "vip/upload_video");

                        }
                        else {
                            alert("投稿失败！");
                        }
                    },
                    error: function (jqXHR) {
                        alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
                    }
                });

            } else {
                alert("请等待视频上传成功在发布");
            }


            return false;
        });


})






