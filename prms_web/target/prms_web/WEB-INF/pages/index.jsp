<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF8" %>
<%@ taglib prefix="pd" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets1/img/ico/favicon.ico">
    <link rel="apple-touch-icon" sizes="144x144" href="assets1/img/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets1/img/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets1/img/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" href="assets1/img/ico/apple-touch-icon-57x57.png">

    <title>运动场预约快速浏览</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets1/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets1/css/animate.css" rel="stylesheet">
    <link href="assets1/css/plugins.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="assets1/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets1/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets1/css/pe-icons.css" rel="stylesheet">

</head>

<body id="page-top" class="regular-navigation" onload="javascript:window.alert('                                  运动场预约管理系统须知\n'+
'一、本系统支持网上预约用户为宁波大学科学技术学院内学生和教职工以及附近居民。\n'+
'二、系统提供7天内场地使用情况浏览和预约。\n'+
'三、场馆网上预约时间与方式\n'+
'预约时间全天预约当天及后三天的场地，每天早上7点准时开放第7天的场地，以此类推。\n'+
'预约方式：网上支付（支付宝）、网上预约现场现金支付。\n'+
'四、已付费的场地如需退款、调场请提前24小时以上到各场馆前台或办公室现场办理。\n'+
'五、恶意预约场地以及破坏场地秩序的行为将被记录，并影响之后场地预约系统的使用。未及时交费累计6（小时/场地）以上者，将失去网上预约权限，180天后自动恢复。\n'+
'六、入场需出示预定场地人员校园卡或者预约订单信息。\n'+
'七、为规范管理，确保场馆的正常运行，请到场锻炼人员自觉遵守以下规定：\n'+
'1、自觉维护场地秩序，遵守社会公德，讲文明礼貌，服从管理人员管理；\n'+
'2、进入场地的人员须穿运动专业鞋或浅色软胶底无钉运动鞋。如遇到雨雪天气，须鞋底干净后方可进入场地，雨具须在指定地点存放，不得带入场地；\n'+
'3、须按预定场地位置进行活动，禁止打空场、边场；如额外使用其他空闲场地请自觉交费；\n'+
'4、如客户因不能按时来馆锻炼，请至少提前24小时通知我馆，否则按出席计算；如遇场馆大型活动占用场地，场地将自动顺延或另行安排；\n'+
'5、未成年人（14岁以下）须有成年人陪伴方可进入，并在活动中对其负监护责任；\n'+
'6、自觉维护馆内和场地卫生，严禁在场地内使用口香糖等食物、喝碳酸饮料、随地吐痰、乱丢杂物，场馆严禁吸烟；\n'+
'7、注意安全，不要再球场间快跑穿行，以免发生危险；酒后或患有高血压、心脏病、癫痫等危险易急性发病者，不宜参加剧烈活动，禁止入内，后果自负；\n'+
'8、自行保管私人物品，防止丢失，丢失责任自负；\n'+
'9、场馆禁止一切私自培训，包括教练私自带班、学生自己请教练等一切培训行为，如发现立即取消其全部场地，并将该用户记录到诚信记录里，取消订场资格；\n'+
'10、损坏场馆设施，一律照价赔偿；\n'+
'11、进入场地人员必须严格遵守以上规定，凡违反管理规定者，管理人员有权终止其使用权。\n'+
'八、最终解释权归宁波大学科学技术学院场馆中心所有。\n'+
'九、场馆电话：17858908693\n'+
'宁波大学科学技术学院场馆中心\n'+
'2021年2月10日\n')">


<div class="master-wrapper">

    <div class="preloader">
        <div class="preloader-img">
            <span class="loading-animation animate-flicker"><img src="assets1/img/loading.GIF" alt="loading" /></span>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top fadeInDown" data-wow-delay="0.2s">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand smoothie" href="/index">运动场<span class="theme-accent-color">预约管理系统</span></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="main-navigation">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/to_login" class="page-scroll">登录</a></li>
                    <li><a href="/to_register" class="page-scroll">注册</a></li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->

        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header id="headerwrap" class="backstretched fullheight">
        <div class="container-fluid fullheight">
            <div class="vertical-center row">
                <div class="col-sm-1 pull-left text-center slider-control match-height">
                    <a href="#" class="prev-bs-slide vertical-center wow fadeInLeft" data-wow-delay="0.8s"><i class="fa fa-long-arrow-left"></i></a>
                </div>
                <div class="col-sm-1 pull-right text-center slider-control match-height">
                    <a href="#" class="next-bs-slide vertical-center wow fadeInRight" data-wow-delay="0.8s"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </header>

    <section id="about" class="top-border-me">
        <div class="section-inner">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb100">
                        <h2 class="section-heading">--热烈<span class="theme-accent-color">欢迎</span>--</h2>
                        <hr class="thin-hr">
                        <h3 class="section-subheading secondary-font">很 高 兴 见 到 你</h3>
                    </div>
                </div>
            </div>

            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-md-offset-1">
                            <h2 class="mb50">关于<span class="theme-accent-color">体育场</span></h2>
                            <p class="lead">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2019年9月，学校决定成立体育场馆管理中心，挂靠体育部，统一管理学校体育场馆，保障学生课余运动以及校外居民健身运动需求。目前我校有体育馆5座，总建筑面积近5万平方米，排球、羽毛球、乒乓球、游泳、健美、啦啦操、健美操、体育舞蹈、瑜伽、太极拳、跆拳道、散打、武术、女子防身术、国际象棋、中国象棋等专项课教学和学生课余体育活动均可在室内开展；室外体育场地近12万平方米，拥有田径场、足球场、篮球场、排球场、网球场、体操健身区等专业运动场地。</p>
                        </div>

                        <div class="col-md-5">
                            <h2 class="mb50">日常<span class="theme-accent-color">公告</span></h2>
                            <p class="lead">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为切实做好新型冠状病毒疫情防控工作，确保病毒疫情不传播，我馆开启全方位模式，加强做好疫情防疫防控工作。</p>
                            <p class="lead">(1)进入场馆，场地须佩戴口罩，出示健康码，登记个人信息</p>
                            <p class="lead">(2)经过体温检测后,无异常后方可进入运动区域</p>
                            <p class="lead">(3)如有不适，请立即求助前台管理员或附近运动人员</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <section class="dark-wrapper top-border-me opaqued parallax" data-parallax="scroll" data-image-src="assets1/img/bg/bg4.jpg" data-speed="0.8">
        <div class="section-inner">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb100">
                        <h2 class="section-heading">我们即将<span class="theme-accent-color">举办</span>的活动</h2>
                        <hr class="thin-hr">
                        <a href="/login"><h3 class="section-subheading secondary-font">快来试一试吧</h3></a>
                    </div>
                </div>
            </div>

            <div class="wow fadeIn" data-wow-delay="0.2s">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12" role="tabpanel">
                            <div class="text-center">
                                <!-- Nav tabs -->
                                <ul class="nav nav-justified icon-tabs" id="nav-tabs" role="tablist">
                                    <li role="presentation" class="active">
                                        <a href="#dustin" aria-controls="dustin" role="tab" data-toggle="tab">
                                            <span class="tabtitle heading-font">羽毛球周赛</span>
                                            <span class="tabtitle small"><p class="lead">星期二</p></span>
                                        </a>
                                    </li>
                                    <li role="presentation" class="">
                                        <a href="#daksh" aria-controls="daksh" role="tab" data-toggle="tab">
                                            <span class="tabtitle heading-font">篮球对抗赛</span>
                                            <span class="tabtitle small"><p class="lead">星期四</p></span>
                                        </a>
                                    </li>
                                    <li role="presentation" class="">
                                        <a href="#anna" aria-controls="anna" role="tab" data-toggle="tab">
                                            <span class="tabtitle heading-font">全民运动大赛</span>
                                            <span class="tabtitle small"><p class="lead">星期日</p></span>
                                        </a>
                                    </li>
                                    <li role="presentation" class="">
                                        <a href="#wafer" aria-controls="wafer" role="tab" data-toggle="tab">
                                            <span class="tabtitle heading-font">老年人乒乓球比赛</span>
                                            <span class="tabtitle small"><p class="lead">四月二十六日</p></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="mt60">
                                <!-- Tab panes -->
                                <div class="tab-content" id="tabs-collapse">
                                    <div role="tabpanel" class="tab-pane fade in active" id="dustin">
                                        <div class="tab-inner">
                                            <h2 class="secondary-font mb30">每周二我们都会为所有喜欢打羽毛球的人提供最好的比赛服务。</h2>
                                            <p>快来参加比赛吧！</p>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade" id="daksh">
                                        <div class="tab-inner">
                                            <h2 class="secondary-font mb30">篮球就是生活!</h2>
                                            <p>快来参加比赛吧！</p>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade" id="anna">
                                        <div class="tab-inner">
                                            <h2 class="secondary-font mb30">让我们一起来运动吧！</h2>
                                            <p>快来参加比赛吧！</p>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade" id="wafer">
                                        <div class="tab-inner">
                                            <h2 class="secondary-font mb30">谁说老年人乒乓技术不行？</h2>
                                            <p>快来参加比赛吧！</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="the-menu">
        <div class="section-inner">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb100">
                        <h2 class="section-heading">--浏览<span class="theme-accent-color">部分场地</span>--</h2>
                        <hr class="thin-hr">
                        <h3 class="section-subheading secondary-font">你的身体会感谢你的</h3>
                    </div>
                </div>
            </div>

            <div class="container">

                <div class="row">
                    <div class="col-md-6 wow fadeIn">
                        <h2 class="mb50"><span class="heading-font text-uppercase">球类运动</span></h2>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/lq.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>室外篮球<span class="theme-accent-color">30元/小时</span></h3>
                                        <p>可以打篮球</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/snymq.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>室内羽毛球<span class="theme-accent-color">40元/小时</span></h3>
                                        <p>可以打羽毛球</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/snlq.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>室内篮球<span class="theme-accent-color">100元/小时</span></h3>
                                        <p>可以打篮球</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/snppq.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>室内乒乓球<span class="theme-accent-color">30元/小时</span></h3>
                                        <p>可以打乒乓球</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-6 wow fadeIn">
                        <h2 class="mb50"><span class="heading-font text-uppercase">其他类运动</span></h2>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/qq.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>铅球<span class="theme-accent-color">20元/小时</span></h3>
                                        <p>可以扔铅球</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/tg.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>跳高<span class="theme-accent-color">15元/小时</span></h3>
                                        <p>可以跳高</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/ty.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>跳远<span class="theme-accent-color">15元/小时</span></h3>
                                        <p>可以跳远</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="food-menu-item">
                            <a href="/to_login">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <img src="/upload/yy.jpg" class="img-responsive">
                                    </div>
                                    <div class="col-xs-9">
                                        <h3>游泳<span class="theme-accent-color">120元/小时</span></h3>
                                        <p>可以游泳</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-wrapper opaqued parallax" data-parallax="scroll" data-image-src="assets1/img/bg/bgpb.jpg" data-speed="0.8">
        <div class="section-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb100">
                        <h2 class="section-heading">最新<span class="theme-accent-color">用户</span>留言</h2>
                        <hr class="thin-hr">
                        <h3 class="section-subheading secondary-font">展示真实的我们</h3>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <ul class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="1" data-items-desktop="[1200,1]" data-items-desktop-small="[980,1]" data-items-tablet="[768,1]" data-items-mobile="[479,1]">
                            <li>
                                <div class="row">
                                    <div class="col-xs-8 col-xs-offset-2 item-caption">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <img src="/upload/wrtx.jpg" class="img-responsive testimonial-author" alt="">
                                            </div>
                                            <div class="col-sm-10">
                                                <h4>赵四</h4>
                                                <p> 这个场地真好，给了我们一个很好的环境来运动，希望场馆能给我们老年人开设一些活动，我想在老年时期能够享受更多运动带来的快乐</p>
                                                <ul class="list-inline">
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row">
                                    <div class="col-xs-8 col-xs-offset-2 item-caption">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <img src="/upload/wdc.jpg" class="img-responsive testimonial-author" alt="">
                                            </div>
                                            <div class="col-sm-10">
                                                <h4>王大锤</h4>
                                                <p> 预约安排合理，工作人员态度亲切，场地保养很好！</p>
                                                <ul class="list-inline">
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="row">
                                    <div class="col-xs-8 col-xs-offset-2 item-caption">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <img src="/upload/aguang.jpg" class="img-responsive testimonial-author" alt="">
                                            </div>
                                            <div class="col-sm-10">
                                                <h4>阿光</h4>
                                                <p> 有了网上预约功能，就不用提前到达场地预约，之前电话预约经常占线也预约不到，现在科技真是越来越发达了。</p>
                                                <ul class="list-inline">
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                    <li><i class="fa fa-star theme-accent-color"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dark-wrapper opaqued parallax" data-parallax="scroll" data-image-src="assets1/img/bg/bgymq.jpg" data-speed="0.8">
        <div class="section-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb100">
                        <a href="/to_login"><h2 class="section-heading">预定<span class="theme-accent-color">你的</span>场地</h2></a>
                        <hr class="thin-hr">
                        <h3 class="section-subheading secondary-font">保证每次都让你满意</h3>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row mb100">
                    <!-- Address, Phone & Email -->
                    <div class="col-md-5 col-md-offset-1 wow fadeIn">
                        <h3 class="mb30">地址</h3>
                        <p class="lead">浙江省宁波市慈溪市白沙街道文蔚路521号</p>
                        <h3 class="mb30">电话</h3>
                        <p class="lead">+17858908693<br>
                    </div>

                    <div class="col-md-5 col-sm-7 wow fadeIn">
                        <h3 class="mb30">开放时间</h3>
                        <div class="row">
                            <div class="col-xs-5">
                                <ul class="list-unstyled weekdays">
                                    <li>星期一</li>
                                    <li>星期二</li>
                                    <li>星期三</li>
                                    <li>星期四</li>
                                    <li>星期五</li>
                                    <li>星期六</li>
                                    <li>星期日</li>
                                </ul>
                            </div>
                            <div class="col-xs-7">
                                <ul class="list-unstyled">
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                    <li>7:00 AM - 10:00 PM</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <footer class="white-wrapper">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-md-12 wow fadeIn mb30" data-wow-delay="0.2s">
                    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33011002015424" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="/assets/img/gn/备案图标.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">浙公网安备 33011002015424号</p></a>
                    <a target="_blank" href="http://beian.miit.gov.cn/" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><p style="float:left;height:20px;line-height:20px;color:#939393;">  浙ICP备2021003047号</p></a>
                </div>
            </div>
        </div>
    </footer>

    <div id="bottom-frame"></div>

    <a href="#" id="back-to-top"><i class="fa fa-long-arrow-up"></i></a>

</div>

<script src="assets1/js/jquery.js"></script>
<script src="assets1/js/bootstrap.min.js"></script>
<script src="assets1/js/plugins.js"></script>

<script src="assets1/js/init.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    $(document).ready(function(){
        'use strict';
        jQuery('#headerwrap').backstretch([
            "assets1/img/bg/ymq.jpg",
            "assets1/img/bg/ppq.jpg",
            "assets1/img/bg/pq.jpg",
            "assets1/img/bg/zq2.jpg",
            "assets1/img/bg/lq.jpg",
            "assets1/img/bg/zq.jpg",
        ], {duration: 8000, fade: 500});
    });
</script>

</body>

</html>
