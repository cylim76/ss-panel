<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="UTF-8" />
        <title>{$config["appName"]}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="//cdn.bootcss.com/simple-line-icons/2.3.2/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--<link href="//cdn.bootcss.com/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />-->
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="//cdn.bootcss.com/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="/assets/metronic/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="/assets/metronic/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="/assets/metronic/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <!-- END THEME LAYOUT STYLES -->
        <script async src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
        <link rel="shortcut icon" href="/favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md page-sidebar-mobile-offcanvas page-sidebar-fixed <!--page-footer-fixed-->">
        <div class="page-wrapper">
            <!-- BEGIN HEADER -->
            <div class="page-header navbar navbar-fixed-top">
                <!-- BEGIN HEADER INNER -->
                <div class="page-header-inner ">
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="/admin" alt="logo" class="logo-default"> {$config["appName"]} </a>
                        <div class="menu-toggler sidebar-toggler">
                            <span></span>
                        </div>
                    </div>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a href="javascript:;" class="menu-toggler responsive-toggler">
                    <!--<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">-->
                        <span></span>
                    </a>
                    <!-- END RESPONSIVE MENU TOGGLER -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="User Image" class="img-circle" src="/assets/metronic/global/img/userimage.png" />
                                    <span class="username username-hide-on-mobile">{if $user->isLogin}{$user->user_name}{/if} </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <li>
                                        <a href="/user/profile">
                                            <i class="icon-user"></i> 个人信息 </a>
                                    </li>
                                    <li>
                                        <a href="/user/logout">
                                            <i class="icon-key"></i> 退出 </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END HEADER INNER -->
            </div>
            <!-- END HEADER -->
            <!-- BEGIN HEADER & CONTENT DIVIDER -->
            <div class="clearfix"> </div>
            <!-- END HEADER & CONTENT DIVIDER -->
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    <!-- BEGIN SIDEBAR -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <div class="page-sidebar">
                    <!--<div class="page-sidebar navbar-collapse collapse">-->
                        <!-- BEGIN SIDEBAR MENU -->
                        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <li class="sidebar-toggler-wrapper hide">
                                <div class="sidebar-toggler">
                                    <span></span>
                                </div>
                            </li>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                            
                           	<!-- BEGIN OFFCANVAS SIDEBAR TOGGLER BUTTON -->
                            <li class="sidebar-mobile-offcanvas-toggler">
                                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                                <a href="#" class="responsive-toggler">
                                    <i class="icon-logout"></i>
                                </a>
                            </li>
                            <!-- END OFFCANVAS SIDEBAR TOGGLER BUTTON -->
                                            
                            <li class="nav-item  ">
                                <a href="/admin" class="nav-link">
                                    <i class="fa fa-dashboard"></i> 
                                    <span class="title">管理中心</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/admin/config" class="nav-link">
                                    <i class="fa fa-cubes"></i> 
                                    <span class="title">站点配置</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/admin/node" class="nav-link">
                                    <i class="fa fa-sitemap"></i> 
                                    <span class="title">节点管理</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/admin/user" class="nav-link">
                                    <i class="fa fa-user"></i> 
                                    <span class="title">用户管理</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/admin/invite" class="nav-link">
                                    <i class="fa fa-users"></i> 
                                    <span class="title">邀请管理</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/admin/trafficlog" class="nav-link">
                                    <i class="fa fa-history"></i> 
                                    <span class="title">流量记录</span>
                                </a>
                            </li>          
                            
                            <li class="nav-item  ">
                                <a href="/admin/checkinlog" class="nav-link">
                                    <i class="fa  fa-check-square"></i> 
                                    <span class="title">签到日志</span>
                                </a>
                            </li>
                            
                            <li class="nav-item  ">
                                <a href="/user" class="nav-link">
                                    <i class="fa fa-reply-all"></i> 
                                    <span class="title">用户中心</span>
                                </a>
                            </li>

                        </ul>
                        <!-- END SIDEBAR MENU -->
                        <!-- END SIDEBAR MENU -->
                    </div>
                    <!-- END SIDEBAR -->
                </div>
                <!-- END SIDEBAR -->
                
