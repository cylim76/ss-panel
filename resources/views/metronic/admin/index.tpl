{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">管理中心</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>Admin Control</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->  
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 margin-bottom-10">
                <div class="dashboard-stat blue">
                    <div class="visual">
                        <i class="fa fa-users"></i>
                    </div>
                    <div class="details">
                        <div class="number"> {$sts->getTotalUser()} </div>
                        <div class="desc"> 总用户 </div>
                    </div>
                    <a class="more" href="/admin/user"> View more
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>          
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat red">
                    <div class="visual">
                        <i class="fa fa-user-plus"></i>
                    </div>
                    <div class="details">
                        <div class="number"> {$sts->getCheckinUser()} </div>
                        <div class="desc"> 签到用户 </div>
                    </div>
                    <a class="more" href="/admin/checkinlog"> View more
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>            
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat green">
                    <div class="visual">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="details">
                        <div class="number"> {$sts->getOnlineUser(3600)} </div>
                        <div class="desc"> 前一小时在线用户 </div>
                    </div>
                    <a class="more" href="/admin/user"> View more
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>
        </div>        
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat purple">
                    <div class="visual">
                        <i class="fa fa-send"></i>
                    </div>
                    <div class="details">
                        <div class="number"> {$sts->getTotalNode()} </div>
                        <div class="desc"> 节点数 </div>
                    </div>
                    <a class="more" href="/admin/node"> View more
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>            
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="dashboard-stat green-jungle">
                    <div class="visual">
                        <i class="fa fa-bar-chart"></i>
                    </div>
                    <div class="details">
                        <div class="number"> {$sts->getTrafficUsage()} </div>
                        <div class="desc"> 产生流量 </div>
                    </div>
                    <a class="more" href="/admin/trafficlog"> View more
                        <i class="m-icon-swapright m-icon-white"></i>
                    </a>
                </div>
            </div>              
        </div>
        <!-- /.row --><!-- END PROGRESS BARS -->
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

{include file='admin/footer.tpl'}