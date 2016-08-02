{include file='user/main.tpl'}

<div class="page-content-wrapper">   
    <!-- Main content -->
    <div class="page-content">
    	<!-- BEGIN PAGE BAR-->
    	<div class="page-bar">
    	   <ul class="page-breadcrumb">
    	       <li>
    	           <h4><span class="caption-subject bold font-green uppercase"> 节点列表</span></h4>
    	       </li>
    	       <li>
    	           <span class="caption-subject bold font-green uppercase"><small>Node List</small></span>
    	       </li>
    	   </ul>
    	</div>
    	<!-- END PAGE BAR-->     	
      <div class="row">
        <div class="row">
            <div class="alert alert-info alert-dismissable">
                	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                  <strong class="font-red">注意!</strong>&nbsp;配置文件以及二维码请勿泄露！
            </div>
        </div>
        <div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-code"></i>
                          <span class="caption-subject bold"><strong> 配置Json </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                  	<textarea class="form-control" {if $user->obfs=='http_post' || $user->obfs=='http_simple' || $user->obfs=='tls1.2_ticket_auth' } rows="9" {else} rows="8" {/if}>{$json_show}</textarea>                  	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
            	<!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-code"></i>
                          <span class="caption-subject bold"><strong> 配置地址 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                  	{if $user->obfs=='http_simple' || $user->obfs=='http_post' || $user->obfs=='random_head' || $user->obfs=='tls_simple' || $user->obfs=='tls1.0_session_auth' || $user->obfs=='tls1.2_ticket_auth' || $user->protocol=='verify_simple' || $user->protocol=='verify_deflate' || $user->protocol=='verify_sha1' || $user->protocol=='auth_simple' || $user->protocol=='auth_sha1' || $user->protocol=='auth_sha1_v2'}
                        <p> 当前模式仅支持带有混淆协议的客户端 </p>
                        <input id="ss-qr-text" class="form-control" value="{$ssqr_s}">
                    {else}
                        <input id="ss-qr-text" class="form-control" value="{$ssqr_s}">
                        <p></p>
                        <p> 当前模式支持Andriod等原版协议客户端 </p>
                        <a href="{$ssqr}">Android 手机上用默认浏览器打开点我就可以直接添加 </a>
                    {/if}                  	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>	
            
        {if $user->obfs=='http_simple' || $user->obfs=='http_post' || $user->obfs=='random_head' || $user->obfs=='tls_simple' || $user->obfs=='tls1.0_session_auth' || $user->obfs=='tls1.2_ticket_auth' || $user->protocol=='verify_simple' || $user->protocol=='verify_deflate' || $user->protocol=='verify_sha1' || $user->protocol=='auth_simple' || $user->protocol=='auth_sha1' || $user->protocol=='auth_sha1_v2' || ( $user->obfs=='plain' && $user->protocol=='origin')}		
        <div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-qrcode"></i>
                          <span class="caption-subject bold"><strong> 配置二维码 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                  	  <div class="text-center">
                          <div id="ss-qr"></div>
                      </div>                  	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>
     		{else}
        <div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-qrcode"></i>
                          <span class="caption-subject bold"><strong> ShadowsocksR配置二维码 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                  	  <div class="text-center">
                          <div id="ss-qr"></div>
                      </div>                  	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>
     		<div class="col-md-6">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-qrcode"></i>
                          <span class="caption-subject bold"><strong> 原版配置二维码 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                      <div class="text-center">
                          <div id="ss-qr-y"></div>
                      </div>                	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>
     		{/if}             
      </div>                  
      <div class="row">
     		<div class="col-md-12">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet light bordered">
                  <div class="portlet-title">
                      <div class="caption">
                      		<i class="fa fa-qrcode"></i>
                          <span class="caption-subject bold"><strong> Surge配置 </strong></span>
                      </div>
                  </div>
                  <div class="portlet-body">
                     <div class="row">
                         <div class="col-md-4">
                             <h4>Surge使用步骤</h4>

                             <p>基础配置只需要做一次：
                             <ol>
                                 <li>打开 Surge ，点击右上角“Edit”，点击“Download Configuration from URL”</li>
                                 <li>输入基础配置的地址（或扫描二维码得到地址，复制后粘贴进来），点击“OK”</li>
                                 <li><b>注意：</b>基础配置不要改名，不可以直接启用。</li>
                             </ol>
                             </p>
                             <p>代理配置需要根据不同的节点进行添加：
                             <ol>
                                 <li>点击“New Empty Configuration”</li>
                                 <li>在“NAME”里面输入一个配置文件的名称</li>
                                 <li>点击下方“Edit in Text Mode”</li>
                                 <li>输入代理配置的全部文字（或扫描二维码得到配置，复制后粘贴进来），点击“OK”</li>
                                 <li>直接启用代理配置即可科学上网。</li>
                             </ol>
                             </p>
                         </div>
                         <div class="col-md-4">
                             <h4>基础配置</h4>

                             <div class="text-center">
                                 <div id="surge-base-qr"></div>
                             </div>
                             <textarea id="surge-base-text" class="form-control" rows="6">{$surge_base}</textarea>
                         </div>
                         <div class="col-md-4">
                             <h4>代理配置</h4>

                             <div class="text-center">
                                 <div id="surge-proxy-qr"></div>
                             </div>
                             <textarea id="surge-proxy-text" class="form-control" rows="6">{$surge_proxy}</textarea>
                         </div>
                     </div>             	
                 	</div>                                    	
            	</div>
            	<!-- END Portlet PORTLET-->
     		</div>
      </div>
        <!-- /.row -->
        <!-- END PROGRESS BARS -->
        <script src="/assets/public/js/jquery.min.js" type="text/javascript"></script>
        <script src="/assets/public/js/qrcode.js" type="text/javascript"></script>
        <script src="/assets/public/js/jquery.qrcode.js" type="text/javascript"></script>
        <script>
        	 
            {if $user->obfs=='http_simple' || $user->obfs=='http_post' || $user->obfs=='random_head' || $user->obfs=='tls_simple' || $user->obfs=='tls1.0_session_auth' || $user->obfs=='tls1.2_ticket_auth' || $user->protocol=='verify_simple' || $user->protocol=='verify_deflate' || $user->protocol=='verify_sha1' || $user->protocol=='auth_simple' || $user->protocol=='auth_sha1' || $user->protocol=='auth_sha1_v2' || ( $user->obfs=='plain' && $user->protocol=='origin')}
          
            var text_qrcode = '{$ssqr_s}';
            jQuery('#ss-qr').qrcode({
                "text": text_qrcode
            });
          
            {else} 
            	
            var text_qrcode = '{$ssqr_s}';
	          jQuery('#ss-qr').qrcode({
		            "text": text_qrcode
	          });
	          	                     
            var text_qrcode1 = '{$ssqr}';
	          jQuery('#ss-qr-y').qrcode({
		            "text": text_qrcode1
            });
	          
	          {/if}
	           
            var text_surge_base = jQuery('#surge-base-text').val();
            jQuery('#surge-base-qr').qrcode({
                "text": text_surge_base
            });
            var text_surge_proxy = jQuery('#surge-proxy-text').text();
            jQuery('#surge-proxy-qr').qrcode({
                "text": text_surge_proxy
            });
        </script>
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->
{include file='user/footer.tpl'}
