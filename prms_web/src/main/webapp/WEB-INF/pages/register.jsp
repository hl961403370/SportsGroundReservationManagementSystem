<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎注册</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    <script src="vendor/jquery/jquery-1.11.1.min.js"></script>
    <script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
    <script src="assets/js/utility/utility.js"></script>
    <script src="assets/js/demo/demo.js"></script>
    <script src="assets/js/main.js"></script>
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<script type="text/javascript">
    function validate(){
        if(zc.username.value==""){
            alert("用户名不能为空");
            return;
        }
        if(zc.password.value==""){
            alert("密码不能为空");
            return;
        }
        zc.submit();
    }
</script>
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="content-header">
                    <h1> 欢迎注册</h1>
                    <div id="divContent"></div>
                </div>
                <div class="panel mt30 mb25">
                    <form name="zc"  method="post" action="/register" id="contact" enctype="multipart/form-data">
                        <div class="panel-body bg-light p25 pb15">
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">用户名</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="userName" id="username" class="gui-input" placeholder="请输入用户名...">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <input id="btnLoad" type="button" value="验证"><br>
                            <div class="section">
                                <label for="password" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="passWord" id="password" class="gui-input" placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label for="name" class="field-label text-muted fs18 mb10">姓名</label>
                                <label for="name" class="field prepend-icon">
                                    <input type="text" name="name"  id="name" class="gui-input" placeholder="请输入姓名...">
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label class="field-label text-muted fs18 mb10">性别</label>
                                    <input type="radio" name="sex" value="男" checked="checked">男
                                    <input type="radio" name="sex" value="女">女
                            </div>
                            <div class="section">
                                <label for="phoneNumber" class="field-label text-muted fs18 mb10">手机号码</label>
                                <label for="phoneNumber" class="field prepend-icon">
                                    <input type="text" name="phoneNumber"  id="phoneNumber" class="gui-input" placeholder="请输入手机号码...">
                                    <label for="phoneNumber" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label  class="field-label text-muted fs18 mb10">头像</label>
                                <label  class="field prepend-icon">
                                    <input name="smallImg" class="file-loading"
                                           type="file" multiple accept=".jpg,.jpeg,.png"
                                           data-show-preview="true">
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer clearfix">
                            <button type="submit" class="button btn-primary mr10 pull-right" onClick="validate()">注册</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </section>
</div>
<script type="text/javascript">
    document.getElementById("btnLoad").onclick = function(){
        //1.创建XmlHttpRequest对象
        var xmlhttp;
        var userName;
        userName=zc.userName.value;
        if(window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
        }else{
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        console.log(xmlhttp);
        //2.发送Ajax请求
        xmlhttp.open("GET","/checkUserName?userName="+userName,true);
        xmlhttp.send();
        //3.处理服务器响应
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var t =xmlhttp.responseText;
                document.getElementById("divContent").innerHTML = t;
            }
        }
    }
</script>
</body>
</html>

