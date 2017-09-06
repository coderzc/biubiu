<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="security-left">
    <ul class="security-list">
        <li class="f-list" style="cursor: default;"><a href="#" class="first-level"
                                                       style="color: #99a2aa;cursor: default;">个人中心</a>
            <ul class="child-list">
                <li>
                    <a href="#" id="home"
                       rec-linkid="account_tab_index_click" title="首页">
                        <i class="al-sy"></i>
                        <span>首<b class="nbsp"></b>页</span>
                    </a>
                </li>
                <li>
                    <a href="${path}/vip/user_info.html" id="setting" class="bg-blue">
                        <i class="al-info check-t"></i>
                        <span>我的信息</span>
                    </a>
                </li>
                <li>
                    <a href="${path}/vip/user_face.html" id="face">
                        <i class="al-tx"></i>
                        <span>我的头像</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="nameplate">
                        <i class="al-mp"></i>
                        <span>成就勋章</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="site">
                        <i class="al-aq"></i>
                        <span>账号安全</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="coin">
                        <i class="al-coin"></i>
                        <span>我的硬币</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="record">
                        <i class="al-jl"></i>
                        <span>我的记录</span>
                    </a>
                </li>
                <li>
                    <a href="#" id="identification">
                        <i class="al-rz"></i>
                        <span>实名认证</span>
                    </a>
                </li>
                <li>
                    <a href="#" target="_blank" id="iden"
                       rec-linkid="account_tab_gift_click" title="礼物兑换">
                        <i class="al-dh"></i>
                        <span>礼物兑换</span>
                    </a>
                </li>
                <li>
                    <a href="#" target="_blank" id="identifica"
                       rec-linkid="account_tab_invite_click" title="邀请注册">
                        <i class="al-zc"></i>
                        <span>邀请注册</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="f-list f-list-hover"><a href="#" target="_blank" class="first-level"
                                           rec-linkid="account_tab_space_click" id="account_tab_space_click"
                                           title="个人空间">个人空间<i class="m-arrow"></i></a></li>
        <li class="f-list f-list-hover"><a href="#" target="_blank"
                                           class="first-level" rec-linkid="account_tab_wallet_click"
                                           id="account_tab_wallet_click" title="我的钱包">我的钱包<i
                class="m-arrow"></i></a></li>
        <li class="f-list f-list-hover"><a href="#" target="_blank"
                                           class="first-level" rec-linkid="account_tab_video_click"
                                           id="account_tab_video_click" title="投稿管理">投稿管理<i class="m-arrow"></i></a>
        </li>
        <li class="f-list f-list-hover"><a href="#" target="_blank" class="first-level"
                                           rec-linkid="account_tab_live_click" id="account_tab_live_click"
                                           title="直播中心">直播中心<i class="m-arrow"></i></a></li>
    </ul>
</div>
