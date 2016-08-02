{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">  
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">用户签到记录</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>CheckIn Log</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR--> 
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="table-scrollable">
                        {$logs->render()}
                        <table class="table table-striped table-hover">
                        	<thead>
                            <tr>
                                <th scope="col style="width:70px !important"">ID</th>
                                <th scope="col">用户</th>
                                <th scope="col">用户昵称</th>
                                <th scope="col">获得流量</th>
                                <th scope="col">签到时间</th>
                            </tr>
                            </thead>                            
                            {foreach $logs as $log}
                            <tbody>
                                <tr>
                                    <td>#{$log->id}</td>
                                    <td>{$log->user_id}</td>
                                    <td>{$log->traffic()}</td>
                                    <td>{$log->CheckInTime()}</td>
                                </tr>
                            </tbody>                                
                            {/foreach}
                        </table>
                        {$logs->render()}
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </div><!-- /.content -->
</div><!-- /.content-wrapper -->

{include file='admin/footer.tpl'}