<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <%@include file="../inclued_page/base_js_css.jsp" %>
    <link id="css" rel="stylesheet" type="text/css" href="css/zclc2.css">
    <script type="text/javascript" src="js/userinfo_setting.js"></script>
    <link rel="stylesheet" href="css/fileinput.min.css">
    <script type="text/javascript" src="js/fileinput.min.js"></script>
    <script type="text/javascript" src="js/fileinput_locale_zh.js"></script>

    <style>
        .kv-upload-progress {
            position: absolute;
            top: 210px;
            width: 198px;
        }

        .file-preview {
            display: none;
        }

        .face-g-change.face-g-action.btn-file {
            color: transparent;
        }

        #user_picupload {
            left: 0px;
        }

        .file-input.file-input-new i {
            display: none;
        }

    </style>

</head>
<body>
<%@include file="../inclued_page/nav.jsp" %>
<div class="top_bg">
    <div class="top"></div>
</div>
<div class="security_content">
    <%@include file="security-list.jsp" %>

    <div class="security-right">
        <div class="sr-t">
            <span class="tit-b"></span><span class="acc-sec">我的头像</span>
        </div>
        <div class="sr-b">
            <div class="face-g-preview">

                <input type="file" id="user_picupload" class="face-g-change face-g-action" name="file"
                       data-min-file-count="1">
                <div
                        style="position: absolute;top:90px;left: -13px;cursor: pointer;pointer-events: none;">
                    <p class="line-1">更换</p>
                    <p class="line-2">头像</p>
                </div>


                <span id="face-g-takedown" class="face-g-action disabled"><p class="line-1">卸下</p><p
                        class="line-2">挂件</p></span>
                <img src="${sessionScope.user.userPicPath}" id="face-g-avatar">
                <img id="face-g-g">
            </div>

            <div class="face-g-list mt30" data-api="/pendant/all">
            </div>
        </div>
    </div>
</div>


<%@include file="../inclued_page/model_login.jsp" %>


</body>
<script>

    var server_path = "${pageScope.path}";
    var islogined = false;
    var username_my = "${sessionScope.user.userName}";//我的用户名
    var userPicPath = "${sessionScope.user.userPicPath}";//用户头像信息
    var userid_my = "${sessionScope.user.userId}";//获取我的username

    if (userid_my != null && userid_my.length > 0) {
        islogined = true;
    } else {
        islogined = false;
    }


    login_update(userid_my);//更新用户登录区界面


    $(".child-list a").removeClass("bg-blue");
    $(".child-list a i").removeClass("check-t");

    $("#face").addClass("bg-blue");
    $("#face i").addClass("check-t");

</script>

<script>


    $(document).ready(function () {


        $("#user_picupload").fileinput({
            language: 'zh', //设置语言
            uploadUrl: '../ajax/upload-head_pic', // you must set a valid URL here else you will get an error
            uploadExtraData: {"userId": userid_my},
            maxFileSize: 2000,
            maxFileCount: 1, //表示允许同时上传的最大文件个数
            dropZoneEnabled: false,//是否显示拖拽区域
            showUpload: false,
            showCaption: false,//是否显示标题
            showPreview: true,//是否显示预览
            showCancel: false,//是否显示取消按钮
            showRemove: false,//删除按钮
            browseClass: "face-g-change face-g-action", //按钮样式
            overwriteInitial: true,//是否覆盖已经存在的图片
            validateInitialCount: true,
            allowedFileTypes: ["image"],
            allowedFileExtensions: ['jpg', 'png', 'gif'],//接收的文件后缀,
            slugCallback: function (filename) {
                return filename.replace('(', '_').replace(']', '_');
            }


        });


        $("#user_picupload").on('change', function () {//更改上传文件触发
            if ($("span.file-input").hasClass("has-error")) {
                var msgerror = $(".kv-fileinput-error.file-error-message li").text();

                alert(msgerror)
            }
            else {
                $('#user_picupload').fileinput('upload');
            }
        });


       //异步上传失败返回结果处理
        $('#user_picupload').on('fileerror', function (event, data, msg) {
            alert("修改失败");
        });



        //异步上传成功返回结果处理
        $("#user_picupload").on("fileuploaded", function (event, data, previewId, index) {
            console.log(data)
            console.log(data.id);
            console.log(data.index);
            console.log(data.file);
            console.log(data.reader);
            console.log(data.files);
            var obj = data.response;
            if (obj.success) {

                setTimeout(function () {
                    alert("修改成功");
                    window.location.reload(true);//刷新页面
                },200)

            }
            else {
                alert("修改失败");
            }

        });
    });


</script>
</html>
