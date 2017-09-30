<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/modal_login_resign.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/modal_login_resign.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/logout.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/register.js"></script>


<!--登录/注册模态框-->
<div class="modal" id="myModal" role="dialog" tabindex="-1" data-remote="true" data-keydata-backdrop="true"
     data-backdrop="true" style="font-family: 'Microsoft YaHei',Arial,Helvetica,sans-serif">
    <div class="modal-dialog ">
        <div class="modal-content" id="myModal_content">
            <div class="modal-header">
                <button type="button" class="close" onclick="close_modal()"
                        aria-hidden="false">x
                </button>
                <span style="cursor: pointer" class="modal-title" id="mydelulablel">登录</span>
                <span style="cursor: pointer;margin-left: 17px" class="modal-title" id="myzhucelablel">注册</span>
                <div id="xian" style="position: absolute;top:39px;left: 2px;color: #337ab7;font-family: unset">————
                </div>
            </div>
            <div class="modal-body" id="login_div" style="display: none">
                <form id="login_form" class="form-horizontal" role="form" onsubmit="return false">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input id="userid_login" type="text" class="form-control" name="userId" placeholder="手机号/用户名"
                               required/>
                        <span id="hold1" class="holder" style="width:90px;top:4px;left:230px">用户id不存在</span>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" name="userPassword" class="form-control" placeholder="密码" required onkeydown="aaaaa(event)"/>
                        <!--<span id="hold2" class="holder" style="top:4px;left:240px">密码错误</span>-->
                    </div>
                    <br>
                    <div class="input-group" style="line-height: 26px;width: 100%">
                        <input type="checkbox" name="rember"/>
                        <span style="position: relative;top: 2px;margin-left: 4px">下次自动登录</span>
                        <div href="#" style="float: right"><a href="#">忘记密码</a></div>
                    </div>
                    <br>

                    <div style="width: 100%;text-align: center">
                        <button type="button" id="btn_login" class="btn btn-primary  btn-block"
                                onclick="login_submit()">登录
                        </button>
                    </div>

                </form>

            </div>
            <div class="modal-body" id="resig_div" style="display: none">

                <form id="resig_form" class="form-horizontal" role="form" action="#" method="post" onsubmit="return false">

                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                        <input type="text" name="userId" class="form-control" id="phone_resig" placeholder="请输入手机号"
                               required/>
                        <span id="hold3" class="holder" style="width:100px;top:4px;left:220px">手机号格式错误</span>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" class="form-control" name="userName" id="username_resig" placeholder="请输入用户名"
                               required/>
                        <span id="hold4" class="holder" style="top:4px;left:201px;width: 120px">用户错误</span>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                        <input type="email" name="userEmail" class="form-control" id="email_resig" placeholder="请输入邮箱"
                               required/>
                        <span id="hold5" class="holder" style="width:100px;top:4px;left:220px">邮箱错误</span>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" class="form-control" id="password1" placeholder="请输入密码"
                               required/>
                        <span id="hold6" class="holder" style="top:4px;left:240px">密码错误</span>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" name="userPassword" class="form-control" id="password2"
                               placeholder="确认密码" required onkeydown="bbbbb(event)"/>
                        <span id="hold7" class="holder" style="top:4px;width:100px;left:220px">密码确认错误</span>
                    </div>
                    <br>

                    <div style="width: 100%;text-align: center">
                        <button id="btn_resig" onclick="resign_submit()" class="btn btn-primary  btn-block">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function aaaaa(event) {
        if(event.keyCode==13){
            login_submit();
        }
    }
    function bbbbb(event) {
        if(event.keyCode==13){
            resign_submit();
        }
    }
</script>