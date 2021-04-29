<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用运动场预约管理系统</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="assets/img/favicon.ico">
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="content-header">
                    <h1> 运动场预约管理系统</h1>
                    <p class="lead">欢迎使用运动场预约管理系统</p>
                </div>
                <div class="panel mt30 mb25">
                    <form method="post" action="login" id="contact">
                        <div class="panel-body bg-light p25 pb15">
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">用户名</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" class="gui-input" placeholder="请输入用户名...">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label for="password" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input" placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label for="password" class="field-label text-muted fs18 mb10">验证码：</label>
                                <input type = "text" name="code" class="gui-input" placeholder="验证码..."><br><br>
                                <img src="/checkCode" id="checkCode" title="看不清，点击换一张" alt="" width="100" height="32" class="center-block" style="height:43px;cursor:pointer;" onclick="getPic()"/>
                            </div>
                        </div>
                        <div class="panel-footer clearfix">
                            <button type="submit" class="button btn-primary mr10 pull-right">登录</button>
                            <label class="switch ib switch-primary mt10">
                                没有账号？<a href="/to_register"><span>立即注册</span></a>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </section>
    <div  class="beian">
        <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33011002015424" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="/assets/img/gn/备案图标.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">浙公网安备 33011002015424号</p></a>
        <a target="_blank" href="http://beian.miit.gov.cn/" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><p style="float:left;height:20px;line-height:20px;color:#939393;">  浙ICP备2021003047号</p></a>
    </div>
</div>
<script type="text/javascript">
    function getPic(){
        $("#checkCode").attr("src","/checkCode?flag="+Math.random());
    };
</script>
<script src="vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="assets/js/utility/utility.js"></script>
<script src="assets/js/demo/demo.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>

