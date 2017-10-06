<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path", path);

    String full_path=request.getScheme()+"://" +request.getServerName()+":"+request.getServerPort()+request.getContextPath();

    pageContext.setAttribute("full_path", full_path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>投稿-biubiu</title>
    <%@include file="../inclued_page/base_js_css.jsp" %>

    <script src="js/fileinput.min.js" type="text/javascript"></script>
    <script src="js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="js/upload_video.js" type="text/javascript"></script>
    <link href="./css/app.css" rel="stylesheet">
    <link href="./css/fileinput.min.css" rel="stylesheet">
    <style>
        .container {
            padding: 0 0;
        }

        .control {
            font-weight: normal;
        }

        .submit-wrp.submit-btn {
            line-height: normal;
        }

        .file-drop-zone {
            margin: 0 0;
            padding: 0 0;
        }

        .cover-box {
            border-radius: 4px;
            border: 2px dashed #00a1d6
        }
        .video_url_{
            font-family: cursive;
            font-size: 16px;
        }

        .pic{
            width: 160px;
            height: 100px;
            margin: 0 auto;
            margin-bottom: 50px;
        }

        .success-wrp .hint{
            margin: 25px auto;
        }
    </style>

</head>


<body>

<%@include file="../inclued_page/nav.jsp" %>
<div class="main">

    <div id="submiting">
        <div class="container bili-box">
            <div class="form-wrp clearfix">
                <div class="left col-l">
                    <div class="cover-wrp">
                        <div class="cover-box">
                         </div>
                        <div class="cover-tip-wrp">
                            <div class="cover-arrow-border"></div>
                            <div class="cover-arrow"></div>
                            <div class="tip-list clearfix">
                                <div class="left dot"></div>
                                <div class="left tip-text">这里是系统为你自动截取的视频封面哦</div>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="right col-r">

                    <div class="container kv-main" style="width: 100%;height:300px">
                        <form enctype="multipart/form-data" method="post">
                            <div class="form-group" style="width: auto">
                                <input id="upload_video" type="file" name="file"
                                       class="type-btn is-selected" data-min-file-count="1">
                            </div>
                        </form>
                    </div>

                    <div>
                        <div>
                            <div class="form-header clearfix">
                                <div class="left tab-wrp">
                                    <div class="tab is-selected" data-header-base="">基本信息</div>
                                    <%--<div class="tab" data-header-high="">高级设置</div>--%>
                                </div>
                                <div class="template-wrp">
                                    <%--<div class="template-hint">使用投稿模板</div>--%>
                                    <div class="icon icon-setting manage-btn"></div>
                                    <div class="line"></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="section copyright-wrp"><h3>投稿类型</h3>
                                <div>
                                    <div class="control-group" style="margin-bottom: 15px;"><label
                                            class="control control-radio" data-article-copyright="">自制
                                        <input type="radio" name="isDiy" form="video_form" value="自制">
                                        <div class="control-indicator"></div>
                                    </label> <label class="control control-radio" data-article-copyright="">转载
                                        <input type="radio" name="isDiy" form="video_form" value="转载" checked
                                               class="is-checked">
                                        <div class="control-indicator"></div>
                                    </label></div>
                                    <%--<div class="control-group" style="margin-bottom: 15px; display: none;"><label--%>
                                            <%--class="control control-checkbox"> <input type="checkbox">在视频播放页显示充电面板--%>
                                        <%--<div class="control-indicator"></div>--%>
                                    <%--</label></div>--%>
                                    <%--<div class="elec-hint"><a href="//member.bilibili.com/v/#!/charge" class="link"--%>
                                                              <%--target="_blank">参加充电计划</a>, 让我为您的创作充电--%>
                                    <%--</div>--%>
                                </div>
                            </div>
                            <div class="section type-wrp"><h3>选择分区</h3>
                                <div>
                                    <ul class="type-menu clearfix">
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="douga">动画
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="fanju">番剧
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="music">音乐
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="dance">舞蹈
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="game">游戏
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="technology">科技
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="ent">娱乐
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="kichiku">鬼畜
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="film">电影
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="fashion">时尚
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="life">生活
                                            </button>
                                        </li>
                                        <li class="dropdown">
                                            <button type="button" data-article-typeid="" class="type-btn"
                                                    data-toggle="dropdown" value="ad">广告
                                            </button>
                                        </li>
                                    </ul>
                                    <div class="type-hint">请选择分区，合适的分区选择有利于投稿通过</div>
                                </div>
                            </div>
                            <div class="section title-wrp"><h3>稿件标题</h3>
                                <div>
                                    <div class="title-wrp"><input name="videoTitle" form="video_form" class="bili-input"
                                                                  type="text" value=""
                                                                  placeholder="请输入稿件标题" maxlength="80">
                                        <div class="count-wrp">0/80</div>
                                    </div>
                                    <div class="title-hint" style="display: none;"><i class="icon icon-notice"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="section template-description-wrp" style="margin: 0"><h3>视频简介</h3>
                                <div>
                                    <div class="description-wrp"><textarea placeholder=""></textarea>
                                        <div class="count-wrp">0/250</div>
                                    </div>
                                </div>
                            </div>
                            <a href="javascript: void(0);" data-template-save="" class="template-btn link"> <i
                                    class="icon icon-template"></i>保存模版 </a></div>
                    </div>
                    <div class="wait-wrp" style="display: none;">
                        <div class="wait-header clearfix"> 稿件信息填写完成 <i class="icon icon-success"></i></div>
                        <div class="wait-pic"></div>
                        <div class="wait-hint">等待视频上传完后会自动提交 <a href="javascript: void(0);"
                                                                class="wait-btn link">取消自动提交</a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="submit-wrp">
                <%--<div class="auto-wrp">--%>
                    <%--<i class="icon icon-bottom-arrow auto-btn"></i> --%>
                    <%--<span class="auto-hint">保存稿件信息，上传完成后自动提交</span>--%>
                <%--</div>--%>
                <form onsubmit="return false;" id="video_form">
                    <input type="hidden" name="up_user.userId" value="${sessionScope.user.userId}" form="video_form">
                    <input type="hidden" name="videoType" id="videotype" value="" form="video_form">
                    <input type="hidden" name="videoPath" id="videopath" value="" form="video_form">
                    <input type="hidden" name="videoCoverPath" id="videocoverpath" value="" form="video_form">
                    <button class="btn submit-btn" type="submit" form="video_form">提交稿件</button>
                </form>


                <div class="error"></div>
            </div>
        </div>
        <div class="email-link">对新版投稿有任何建议请邮件反馈到xxxxxxx.xxx</div>
    </div>

    <div id="submited" style="display: none;">
        <div class="container bili-box">
            <div class="success-wrp">
                <div class="header">
                    <div class="header-layer"></div>
                    <a class="header-link" target="_blank" href="http://www.bilibili.com/blackboard/culture.html"
                       data-loc-id="142"></a></div>
                <div class="hint"><span class="outline">圣诞</span>稿件已成功投递</div>
                <%--<div class="hint">若你的稿件没有立刻显示在稿件列表中，请耐心等待5分钟</div>--%>
                <div class="hint">下面是你是你的稿件访问地址:<br>
                    <span class="video_url_">www.agyufsdysfdyuk.dfghd</span></div>
                <div class="pic"><img width="100%" src="../res/video_cover/default.png" ></div>
                <a id="go_video" class="button" href="#">查看稿件</a>
                <a id="again_video" class="button" href="#">再投一个</a>
            </div>
        </div>
    </div>
</div>
<%@include file="../inclued_page/model_login.jsp" %>
</body>
<script>
    var full_path="${pageScope.full_path}";
    var server_path = "${pageScope.path}";
    var islogined = false;
    var username_my = "${sessionScope.user.userName}";//我的用户名
    var userPicPath = "${sessionScope.user.userPicPath}";//用户头像信息
    var userid_my = "${sessionScope.user.userId}";//获取我的username

    var is_uploaded=false;//视频是否已经上传成功

    if (userid_my != null && userid_my.length > 0) {
        islogined = true;
    } else {
        islogined = false;
    }


    login_update(userid_my);//更新用户登录区界面


</script>
</html>
