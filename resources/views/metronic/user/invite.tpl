{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">
    <!-- Main content --><!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject  font-green bold uppercase">邀请</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>Invite</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->       	
        <div class="row">
            <div class="col-sm-12">
                <div id="msg-error" class="alert alert-warning alert-dismissable" style="display:none">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>
            </div>
        </div>
        <div class="row">
        <div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-rocket"></i>
                          <span class="caption-subject font-red bold uppercase"><strong> 邀请 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                    <p>当前您可以生成<code>{$user->invite_num}</code>个邀请码。 </p>
                    {if $user->invite_num }
                            <button id="invite" class="btn btn-sm btn-info">生成我的邀请码</button><br><br>
                    {/if}
                    
                    <p><strong> 我的邀请码</strong></p>
                    <div class="table-scrollable">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">###</th>
                                <th scope="col">邀请码(点右键复制链接)</th>
                                <th scope="col">状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $codes as $code}
                                <tr>
                                    <td><b>{$code->id}</b></td>
                                    <td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
                                    </td>
                                    <td>可用</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>

                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>

        <div class="col-md-6">
            	<div class="panel panel-info">
							    <div class="panel-heading">
							        <h3 class="panel-title"> 注意</h3>
							    </div>
							    <div class="panel-body">
							    	<h5>邀请码请给认识的需要的人。</h5>
							    	<h5>邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</h5>
							    </div>
							</div> 
     		</div>
        <div class="col-md-6">
            	<div class="panel panel-info">
							    <div class="panel-heading">
							        <h3 class="panel-title"> 说明</h3>
							    </div>
							    <div class="panel-body">
							    	<h5>用户注册48小时后，才可以生成邀请码。</h5>
							    	<h5>邀请码暂时无法购买，请珍惜。</h5>
							    	<h5>公共页面不定期发放邀请码，如果用完邀请码可以关注公共邀请。</h5>
							    </div>
							</div>             	
     		</div> 
        </div>
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
<script src="/assets/public/js/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

{include file='user/footer.tpl'}