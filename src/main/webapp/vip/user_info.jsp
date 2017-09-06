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
</head>
<body>
<%@include file="../inclued_page/nav.jsp" %>
<div class="top_bg">
    <div class="top"></div>
</div>
<div class="security_content">
    <%@include file="security-list.jsp" %>
    <form onsubmit="return false;" id="user_info_form">
        <div class="security-right">
            <div class="sr-t">
                <span class="tit-b"></span><span class="acc-sec">我的信息</span>
            </div>
            <div class="sr-b">
                <ul>

                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">用户名：</p>
                            <div class="sbi-m">
                                <input type="hidden" name="userName"value="${sessionScope.user.userName}">
                                <span>${sessionScope.user.userName}</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">手机号：</p>
                            <div class="sbi-m">
                                <input type="hidden" name="userId"value="${sessionScope.user.userId}">
                                <span>${sessionScope.user.userId}</span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">邮箱：</p>
                            <div class="sbi-m">
                                <span><input class="user-id" type="text" name="userEmail"
                                             value="${sessionScope.user.userEmail}"></span>
                            </div>
                            <%--<p class="sbi-r">注：修改一次昵称需要消耗6个硬币</p>--%>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">我的签名：</p>
                            <div class="sbi-m">
                                <textarea name="sign" id="" cols="30" rows="10" class="my-sign"></textarea>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">性别：</p>
                            <input type="hidden" name="userGender" id="select_sex" value="${sessionScope.user.userGender}">
                            <div class="sbi-m">
                                <ul class="sex" id="sex_ul">
                                    <li class="" data-sex="男">男</li>
                                    <li data-sex="女">女</li>
                                    <li data-sex="保密" class="blue">保密</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="sb-info">
                            <p class="sbi-l">出生日期：</p>
                            <div class="sbi-m">
                                    <span class="Zebra_DatePicker_Icon_Wrapper"
                                          style="display: inline-block; position: relative;
                                          float: none; top: auto; right: auto; bottom: auto; left: auto;">
                                    <input class="user-id sb-ys" name="userBirthday" type="date" value="${sessionScope.user.userBirthday}"
                                           id="user-birthday"
                                           style="position: relative; top: auto; right: auto;
                                           bottom: auto; left: auto;">
                                   </span>
                            </div>
                        </div>
                    </li>


                </ul>
            </div>
            <div class="sb-line"></div>
            <input type="submit" class="sb-save" value="保存" style="position: absolute;bottom:80px;display: block;">
        </div>
    </form>
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
</script>
</html>
