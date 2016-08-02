{include file='user/main.tpl'}

<div class="page-content-wrapper">
    
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase"> 我的信息</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>User Profile</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->      	
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                   <!-- BEGIN Portlet PORTLET-->
                   <div class="portlet light bordered">
                       <div class="portlet-title">
                           <div class="caption">
                           		<i class="fa fa-user"></i>
                               <span class="caption-subject bold uppercase"> 我的帐号 </span>
                           </div>
                       </div>
                       <div class="portlet-body">
                       	 	<dl class="dl-horizontal">
               							<dt>用户名</dt>
               							<dd>{$user->user_name}</dd>
               							<dt>邮&nbsp;&nbsp;&nbsp;箱</dt>
               							<dd>{$user->email}</dd>
            							</dl>
            							<dl class="dl-horizontal">
            									<a class="btn btn-danger btn-sm" href="kill">删除我的账户</a>
            							</dl>     							
                       </div>
                   </div>
                   <!-- END Portlet PORTLET-->
            </div>

        </div>
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
{include file='user/footer.tpl'}