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
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="/assets/metronic/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->        
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="/assets/metronic/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="/assets/metronic/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="/assets/metronic/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/metronic/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="/assets/metronic/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="/favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md page-sidebar-mobile-offcanvas page-sidebar-fixed">
        <div class="page-wrapper">
            <!-- BEGIN HEADER -->
            <div class="page-header navbar navbar-fixed-top">
                <!-- BEGIN HEADER INNER -->
                <div class="page-header-inner ">
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="/user" alt="logo" class="logo-default" />{$config["appName"]} </a>
                        <div class="menu-toggler sidebar-toggler">
                            <span></span>
                        </div>
                    </div>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a href="javascript:;" class="menu-toggler responsive-toggler">
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
                                    <img alt="User Image" class="img-circle" src="https://secure.gravatar.com/avatar/f38dc10e7609ec461e33100eea9ba707" />
                                    <span class="username username-hide-on-mobile"> {$user->user_name} </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                            				<li>                            				
                            				    <a> {$user->email} </a>
                            				    <a><small> 加入时间：{$user->regDate()} </small></a>
                            				</li>
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
                           
                            <li class="nav-item">
                                <a href="/user" class="nav-link">
                                    <i class="fa fa-dashboard"></i>
                                    <span class="title">用户中心</span>
                                </a>
                            </li>                           
                            <li class="nav-item">
                                <a href="/user/node" class="nav-link">
                                    <i class="fa fa-sitemap"></i>
                                    <span class="title">节点信息</span>
                                </a>
                            </li>                           
                           
														<li class="nav-item  ">
														    <a href="/user/profile" class="nav-link">
														        <i class="icon-user"></i> 
														        <span class="title">我的信息</span>
														    </a>
														</li>
														
														<li class="nav-item  ">
														    <a href="/user/trafficlog" class="nav-link">
														        <i class="fa fa-history"></i> 
														        <span class="title">流量记录</span>
														        <span class="selected"></span>
														    </a>
														</li>
														
														
														<li class="nav-item">
														    <a href="/user/edit" class="nav-link">
														        <i class="icon-pencil"></i> 
														        <span class="title">修改资料</span>
														        <span class="selected"></span>
														    </a>
														</li>
														
														<li class="nav-item  ">
														    <a href="/user/invite" class="nav-link">
														        <i class="icon-users"></i> 
														        <span class="title">邀请好友</span>
														    </a>
														</li>
														
														{if $user->isAdmin()}
														    <li class="nav-item  ">
														        <a href="/admin" class="nav-link">
														            <i class="icon-settings"></i> 
														            <span class="title">管理面板</span>
														        </a>
														    </li>
														{/if}

                        </ul>
                        <!-- END SIDEBAR MENU -->
                        <!-- END SIDEBAR MENU -->
                    </div>
                    <!-- END SIDEBAR -->
                </div>
                <!-- END SIDEBAR -->
                