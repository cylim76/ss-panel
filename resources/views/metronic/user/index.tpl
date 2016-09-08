{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper"> 
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">用户中心 </span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>User Center</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->      	
        <!-- START PROGRESS BARS -->
        <div class="row">
        	<div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-bullhorn"></i>
                          <span class="caption-subject bold"><strong> 公告&FAQ </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                    <!--<p>本站节点支持混淆协议，请优先使用支持混淆的客户端，手机端请选择兼容模式。</p>-->
                    <h4><small>{$msg}</small></h4>
                    <h5><small>Windows客户端下载：<a href="http://any.mokoo.xyz/app/ShadowsocksR-win.zip"><span class="badge bg-blue">ShadowsocksR for Windows</span></a></small></h5>
                    <h5><small>Android客户端下载：<a href="https://github.com/shadowsocks/shadowsocks-android/releases/latest"><span class="badge bg-blue">Shadowsocks for Android</span></a></small></h5>
                    <h5><small>IOS客户端下载：<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118"><span class="badge bg-blue">Shadowrocket for IOS</span></a></small></h5> 
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     			</div>

        	<div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-exchange"></i>
                          <span class="caption-subject bold"><strong> 流量使用情况 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                    <div class="row">
                        <div class="col-xs-12">
                        	<div class="progress-info">
                            <div class="progress" style="height: 20px;">                                 
                                	<span class="progress-bar progress-bar-success green-sharp" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                     style="width: {$user->trafficUsagePercent()}%">
                                    <span class="sr-only">Transfer</span>
                                  </span>
                            </div>
                          </div>
                        </div>
                    </div>
                    <dl class="dl-horizontal">
                        <dt>总流量</dt>
                        <dd>{$user->enableTraffic()}</dd>
                        <dt>已用流量</dt>
                        <dd>{$user->usedTraffic()}</dd>
                        <dt>剩余流量</dt>
                        <dd>{$user->unusedTraffic()}</dd>
                        <dt>流量重置日</dt>
                        {if $user->auto_reset_day == 0 }
                        <dd> 您的流量暂不重置</dd>
                        {else}
                        <dd> 每月{$user->auto_reset_day}日</dd>
                        {/if}
                    </dl>                                       	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     			</div>
        	<div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-pencil"></i>
                          <span class="caption-subject bold"><strong> 签到获取流量 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                    <p> 每{$config['checkinTime']}小时可以签到一次。</p>

                    <p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>
                    {if $user->isAbleToCheckin() }
                        <p id="checkin-btn">
                            <button id="checkin" class="btn btn-success  btn-flat">签到</button>
                        </p>
                    {else}
                        <p><a class="btn btn-success btn-flat disabled" href="#">不能签到</a></p>
                    {/if}
                    <p id="checkin-msg"></p>                                	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     			</div>

        	<div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-paper-plane"></i>
                          <span class="caption-subject bold"><strong> 连接信息 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                    <dl class="dl-horizontal">
                        <dt>端口</dt>
                        <dd>{$user->port}</dd>
                        <dt>密码</dt>
                        <dd>{$user->passwd}</dd>
                        {if $user->protocol != 'origin' || $user->obfs != 'plain'}
                        <dt>协议插件</dt>
                        <dd>{$user->protocol}</dd>
                        <dt>混淆插件</dt>
                        <dd>{$user->obfs}</dd>
                        {/if}
                        <dt>加密方式</dt>
                        <dd>{$user->method}</dd>
                        <dt>上次使用</dt>
                        <dd>{$user->lastSsTime()}</dd>
                        <dt>帐号到期时间</dt>
                        <dd>{$user->expire_at}</dd>
                    </dl>                              	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     			</div>
        </div>
        <!-- /.row --><!-- END PROGRESS BARS -->
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


{include file='user/footer.tpl'}
