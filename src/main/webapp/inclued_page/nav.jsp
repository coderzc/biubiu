<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<%=request.getContextPath()%>/css/nav.css" rel="stylesheet">

<nav class="navbar" role="navigation" style="margin-bottom:10px">
    <div id="head_content" style="width: 90%;margin: 0 auto;height: 100%">
        <div class="logo" style="width: 100px;text-align: center;float: left;">biubiu</div>

        <div class="ul_buttons">

       <span class="item">
        <a class="head_item head_iteam_main" href="${path}/homepage">首 页</a>
        </span>


            <span class="item button-dropdown" data-buttons="dropdown">
                <a class="head_item head_iteam_demand" href="#">点 播</a>
           <ul class="button-dropdown-list is-below">
           <li><a href="${path}/classify?videoType=douga" id="my_class6" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i> 动画</a></li>
           <li><a href="${path}/classify?videoType=fanju" id="my_class7" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>番剧</a></li>
           <li><a href="${path}/classify?videoType=music" id="my_class8" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>音乐</a></li>
           <li><a href="${path}/classify?videoType=dance" id="my_class9" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>舞蹈</a></li>
           <li><a href="${path}/classify?videoType=game" id="my_class10" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>游戏</a></li>
           <li><a href="${path}/classify?videoType=technology" id="my_class11" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>科技</a></li>
           <li><a href="${path}/classify?videoType=life" id="my_class12" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>生活</a></li>
           <li><a href="${path}/classify?videoType=kichiku" id="my_class13" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>鬼畜</a></li>
           <li><a href="${path}/classify?videoType=fashion" id="my_class14" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>时尚</a></li>
           <li><a href="${path}/classify?videoType=ad" id="my_class15" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>广告</a></li>
           <li><a href="${path}/classify?videoType=ent" id="my_class16" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>娱乐</a></li>
           <li><a href="${path}/classify?videoType=film" id="my_class17" class="my_class"><i
                   class="glyphicon glyphicon-chevron-right"></i>影视</a></li>
           </ul>
           </span>

            <span class="item">
            <a class="head_item head_iteam_live" href="/live">直 播</a>
            </span>

        </div>
        <div class="nav_right_list">
            <button id="open_btn" class="btn" style="display: none">开启直播</button>
            <div id="login_regist" style="display: none">
                <button id="btn1" class="button button-caution  button-rounded button-small"
                        style="width: 60px;height:28px;font-size: 13px;padding: 0;margin-right: 25px">登录
                </button>
                <button id="btn2" class="button button-primary  button-rounded button-small"
                        style="width: 60px;height:28px;font-size: 13px;padding: 0">注册
                </button>
            </div>
            <div id="logined" class="logined" style="float: right;display: none">
                <img src="" class="i_face"/>
                <div class="i_menu">
                    <div class="uname">
                        欢迎你<a id="logined_a" href="#" style="color:#337ab7;font-size: 14px; "><span
                            id="user_name_">Mary</span></a>
                    </div>
                    <div style="margin: 0 20px;overflow:hidden">
                        <ul class="member-menu">
                            <li>
                                <a href=${path}/vip/user_info><i
                                        style="background-position: -471px -407px;"></i>个人中心</a>
                            </li>
                            <li>
                                <a href="/vip/upload_video"><i style="background-position: -536px -1046px;"></i> 投稿管理</a>
                            </li>
                            <li>
                                <a href="/vip/user_face"><i style="background-position: -472px -344px;"></i> 我的头像</a>
                            </li>
                            <li>
                                <a href="/live?roomId=0"><i style="background-position: -473px -855px ;"></i>我的直播</a>
                            </li>
                        </ul>
                    </div>

                    <div class="member_bottom">
                        <a id="logout" style="float: right;">退出</a>
                    </div>
                </div>

                <a class="favlist" href="#">收藏夹</a>
                <a class="video_submit" href="${path}/vip/upload_video">投稿</a>
            </div>

        </div>
        <div class="search_nav navbar-form" role="search">
            <input type="text" class="form-control" style="width: 300px" placeholder="搜你想要的...">
            <span id="soso" class="glyphicon glyphicon-search soso"
                  onclick="soso($('.search_nav.navbar-form input').val())"></span>
        </div>

    </div>

</nav>
<script>
    //导航栏脚本
    $(".i_face").on("mouseover", function () {
        $(".i_face").addClass("scale_in");
        $(".i_menu").slideDown(300);
    });

    $(".i_menu").on("mouseleave", function () {
        $(".i_face").removeClass("scale_in");
        $(".i_menu").slideUp(200);
    });


    $('.head_item').mouseenter(function () {
        $(this).click();
        $(this).css({color: "#5bc0de"})
    });

    $('.item').mouseleave(function () {
        $(this).click();
        $(this).find(".head_item").css({color: "black"})
    });

    function soso(keyword) {
        window.location = server_path + "/soso?keyword=" + keyword;
    }

    $(".search_nav.navbar-form input").keydown(function (event) {
        if (event.which == 13) {
            soso($(this).val());
        }
    });


</script>




