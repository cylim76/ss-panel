{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">  
	<!-- Main content -->
	<div class="page-content">
  	<!-- BEGIN PAGE BAR-->
  	<div class="page-bar">
  	   <ul class="page-breadcrumb">
  	       <li>
  	           <h4><span class="caption-subject font-green bold uppercase"> 编辑节点 #{$node->id}</span></h4>
  	       </li>
  	       <li>
  	           <span class="caption-subject font-green bold uppercase"><small>Edit Node</small></span>
  	       </li><br>
  	       <li>
  	       		<span class="caption-subject font-green bold uppercase"><small><small>如需修改加密方式、协议及混淆插件，请至用户管理界面修改</small></small></span>
  	       </li>
  	   </ul>
  	</div>
  	<!-- END PAGE BAR-->  		
		<div class="row">
			<div class="col-sm-12">
				<div id="msg-success" class="alert alert-success alert-dismissable" style="display: none;">
					<button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
					<h4>
					<i class="icon fa fa-info"></i> 成功!</h4>

						<p id="msg-success-p"></p>
					</div>
					<div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
						<button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
						<h4>
						<i class="icon fa fa-warning"></i> 出错了!</h4>

							<p id="msg-error-p"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-body">
								<div class="form-horizontal">
										<div class="row">
				<div class="tabbable tabbable-tabdrop">
					<ul class="nav nav-pills">
						<li class="active">
							<a href="#tab1" data-toggle="tab"><strong> 连接信息 </strong></a>
						</li>	
						<li>
							<a href="#tab2" data-toggle="tab"><strong> 描述信息 </strong></a>
						</li>
					</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div class="col-md-6">
					<div class="form-group">
						<label for="title" class="col-md-3 control-label bold">节点名称</label>


						<div class="col-md-9">
							<input class="form-control" id="name" value="{$node->name}">
						</div>
					</div>

					<div class="form-group">
						<label for="server" class="col-md-3 control-label bold">节点地址</label>


						<div class="col-md-9">
							<input class="form-control" id="server" value="{$node->server}">
						</div>
					</div>

					<div class="form-group">
						<label for="protocol" class="col-md-3 control-label bold">默认协议插件</label>



						<div class="col-md-9">
							<select class="bs-select form-control" id="protocol" onchange="disprotocolparam();" disabled="disabled">
								<option value="origin" {if $node->protocol=="origin"}selected="selected"{/if}>origin</option>
								<option value="verify_deflate" {if $node->protocol=="verify_deflate"}selected="selected"{/if}>verify_deflate</option>
								<option value="auth_sha1_v4" {if $node->protocol=="auth_sha1_v4"}selected="selected"{/if}>auth_sha1_v4</option>
								<option value="auth_sha1_v4_compatible" {if $node->protocol=="auth_sha1_v4_compatible"}selected="selected"{/if}>auth_sha1_v4_compatible</option>
								<option value="auth_aes128_md5" {if $node->protocol=="auth_aes128_md5"}selected="selected"{/if}>auth_aes128_md5</option>
								<option value="auth_aes128_sha1" {if $node->protocol=="auth_aes128_sha1"}selected="selected"{/if}>auth_aes128_sha1</option>
								<option value="auth_chain_a" {if $node->protocol=="auth_chain_a"}selected="selected"{/if}>auth_chain_a</option>
								<option value="auth_chain_b" {if $node->protocol=="auth_chain_b"}selected="selected"{/if}>auth_chain_b</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label bold" for="protocol_param">默认协议参数</label>



						<div class="col-md-9">
							<input class="form-control" id="protocol_param" type="text" readonly="true" value="{$node->protocol_param}" {if $node->protocol != "auth_chain_a" && $node->protocol != "auth_chain_b" && $node->protocol != "auth_sha1_v4" && $node->protocol != "auth_aes128_md5" && $node->protocol != "auth_aes128_sha1"} disabled="disabled"{/if}>
						</div>
					</div>

					<div class="form-group">
						<label for="obfs" class="col-md-3 control-label bold">默认混淆插件</label>



						<div class="col-md-9">
							<select class="bs-select form-control" id="obfs" onchange="disobfsparam();"  disabled="disabled">
								<option value="plain" {if $node->obfs=="plain"}selected="selected"{/if}>plain</option>
								<option value="http_post" {if $node->obfs=="http_post"}selected="selected"{/if}>http_post</option>
								<option value="http_post_compatible" {if $node->obfs=="http_post_compatible"}selected="selected"{/if}>http_post_compatible</option>
								<option value="http_simple" {if $node->obfs=="http_simple"}selected="selected"{/if}>http_simple</option>
								<option value="http_simple_compatible" {if $node->obfs=="http_simple_compatible"}selected="selected"{/if}>http_simple_compatible</option>
								<option value="random_head" {if $node->obfs=="random_head"}selected="selected"{/if}>random_head</option>
								<option value="tls1.2_ticket_auth" {if $node->obfs=="tls1.2_ticket_auth"}selected="selected"{/if}>tls1.2_ticket_auth</option>
								<option value="tls1.2_ticket_auth_compatible" {if $node->obfs=="tls1.2_ticket_auth_compatible"}selected="selected"{/if}>tls1.2_ticket_auth_compatible</option>
							</select>
						</div>
					</div>
<!--					<div class="form-group">
						<label class="col-md-3 control-label bold" for="obfs_param">默认混淆参数</label>



						<div class="col-md-9">
							<input class="form-control" id="obfs_param" type="text"  readonly="true" value="{$node->obfs_param}" {if $node->obfs != "http_simple" && $node->obfs != "http_post" && $node->obfs != "tls1.2_ticket_auth"} disabled="disabled"{/if}>
						</div>
					</div>-->

					<div class="form-group">
						<label for="method" class="col-md-3 control-label bold">默认加密方式</label>



						<div class="col-md-9">
							<select class="bs-select form-control" id="method"  disabled="disabled">
								<option value="none" {if $node->method=="none"}selected="selected"{/if}>none</option>
								<option value="table" {if $node->method=="table"}selected="selected"{/if}>table</option>
								<option value="aes-128-cfb" {if $node->method=="aes-128-cfb"}selected="selected"{/if}>aes-128-cfb</option>
								<option value="aes-192-cfb" {if $node->method=="aes-192-cfb"}selected="selected"{/if}>aes-192-cfb</option>																
								<option value="aes-256-cfb" {if $node->method=="aes-256-cfb"}selected="selected"{/if}>aes-256-cfb</option>
								<option value="aes-128-ctr" {if $node->method=="aes-128-ctr"}selected="selected"{/if}>aes-128-ctr</option>
								<option value="aes-192-ctr" {if $node->method=="aes-192-ctr"}selected="selected"{/if}>aes-192-ctr</option>																
								<option value="aes-256-ctr" {if $node->method=="aes-256-ctr"}selected="selected"{/if}>aes-256-ctr</option>																
								<option value="bf-cfb" {if $node->method=="bf-cfb"}selected="selected"{/if}>bf-cfb</option>
								<option value="camellia-128-cfb" {if $node->method=="camellia-128-cfb"}selected="selected"{/if}>camellia-128-cfb</option>
								<option value="camellia-192-cfb" {if $node->method=="camellia-192-cfb"}selected="selected"{/if}>camellia-192-cfb</option>
								<option value="camellia-256-cfb" {if $node->method=="camellia-256-cfb"}selected="selected"{/if}>camellia-256-cfb</option>
								<option value="rc4-md5" {if $node->method=="rc4-md5"}selected="selected"{/if}>rc4-md5</option>
								<option value="rc4-md5-6" {if $node->method=="rc4-md5-6"}selected="selected"{/if}>rc4-md5-6</option>
								<option value="salsa20" {if $node->method=="salsa20"}selected="selected"{/if}>salsa20</option>
								<option value="chacha20" {if $node->method=="chacha20"}selected="selected"{/if}>chacha20</option>
								<option value="chacha20-ietf" {if $node->method=="chacha20-ietf"}selected="selected"{/if}>chacha20-ietf</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="rate" class="col-md-3 control-label bold">流量比例</label>


						<div class="col-md-9">
							<input class="form-control" id="rate" value="{$node->traffic_rate}">
						</div>

					</div>

					<!--<div class="form-group">
					<label for="method" class="col-md-3 control-label bold">自定义加密</label>


					<div class="col-md-9">
					<select class="bs-select form-control" id="custom_method">
					<option value="0" {if $user->custom_method==0}selected="selected"{/if}>不支持</option>

					<option value="1" {if $user->custom_method==1}selected="selected"{/if}>支持</option>

					</select>
					</div>
					</div>

					<div class="form-group">
					<label for="custom_rss" class="col-md-3 control-label bold">自定义协议&混淆</label>



					<div class="col-md-9">
					<select class="bs-select form-control" id="custom_rss">
					<option value="0" {if $node->custom_rss==0}selected="selected"{/if}>不支持</option>

					<option value="1" {if $node->custom_rss==1}selected="selected"{/if}>支持</option>

					</select>
					</div>
					</div>-->
				</div>
				</div>
				<div class="tab-pane" id="tab2">
					<div class="col-md-6">
					<div class="form-group">
						<label for="class" class="col-md-3 control-label bold"> 节点等级 </label>


								<div class="col-md-9">
									<input class="form-control" id="node_class" type="number" value="{$node->node_class}">
									<p class="help-block"><code class="font-blue-sharp"><small> 用户只能访问用户等级大于等于节点等级的节点 </small></code></p>
								</div>
							</div>

							<div class="form-group">
								<label for="group" class="col-md-3 control-label bold">节点群组</label>



									<div class="col-md-9">
										<input class="form-control" id="node_group" type="number" value="{$node->node_group}">
										<p class="help-block"><code class="font-blue-sharp"><small> 用户只能访问用户所属节点群组和节点群组为0的节点 </small></code></p>
									</div>
								</div>

								<div class="form-group">
									<label for="type" class="col-md-3 control-label bold">是否显示</label>



									<div class="col-md-9">
										<select class="bs-select form-control" id="type">
											<option value="1" {if $node->type==1}selected="selected"{/if}>显示</option>


											<option value="0" {if $node->type==0}selected="selected"{/if}>隐藏</option>


										</select>
									</div>
								</div>


								<div class="form-group">
									<label for="status" class="col-md-3 control-label bold">节点状态</label>



									<div class="col-md-9">
										<select class="bs-select form-control" id="status">
											<option value="1" {if $node->status==1}selected="selected"{/if}>可用</option>



											<option value="0" {if $node->status==0}selected="selected"{/if}>不可用</option>



											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="sort" class="col-md-3 control-label bold">排序</label>

										<div class="col-md-9">
											<input class="form-control" id="sort" type="number" value="{$node->sort}">
										</div>
									</div>
									<div class="form-group">
										<label for="info" class="col-md-3 control-label bold">节点描述</label>


										<div class="col-md-9">
											<textarea class="form-control" id="info" rows="2">{$node->info}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="info" class="col-md-3 control-label bold">节点备注</label>



										<div class="col-md-9">
											<textarea class="form-control" id="note" rows="2" placeholder="节点备注仅管理员可见" >{$node->note}</textarea>
										</div>
									</div>
							</div>		

									</div>
								</div>
								</div>

                    </div>

										<div class="col-md-6">
												<div class="btn-group pull-right">
        						    	 <button type="submit" class="btn btn-primary" id="submit" name="action" value="add"> <strong> 修改 </strong> </button>
        						 		</div>
        						</div> 										
										</div>
		
        						</div>										
									</div>
									<!-- /.box-body -->
									<div class="box-footer">


									</div>
							</div>
							<!-- /.box -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.content -->
				</div>
				<!-- /.content-wrapper -->

				<script>
					$(document).ready(function () {
						function submit() {
							$.ajax({
								type: "PUT",
								url: "/admin/node/{$node->id}",
								dataType: "json",
								data: {
									name: $("#name").val(),
									server: $("#server").val(),
/*									protocol: $("#protocol").val(),
									protocol_param: $("#protocol_param").val(),
									obfs: $("#obfs").val(),
									obfs_param: $("#obfs_param").val(),*/
									method: $("#method").val(),
/*									custom_method: $("#custom_method").val(),
									custom_rss: $("#custom_rss").val(),		*/
									node_class: $("#node_class").val(),
								  node_group: $("#node_group").val(),							
									rate: $("#rate").val(),
									info: $("#info").val(),
									note: $("#note").val(),
									type: $("#type").val(),
									status: $("#status").val(),
									sort: $("#sort").val()
								},
								success: function (data) {
									if (data.ret) {
										$("#msg-error").hide(100);
										$("#msg-success").show(100);
										$("#msg-success-p").html(data.msg);
										window.setTimeout("location.href='/admin/node'", 2000);
									} else {
										$("#msg-error").hide(10);
										$("#msg-error").show(100);
										$("#msg-error-p").html(data.msg);
									}
								},
								error: function (jqXHR) {
									$("#msg-error").hide(10);
									$("#msg-error").show(100);
									$("#msg-error-p").html("发生错误：" + jqXHR.status);

								}
							});
						}

						$("html").keydown(function (event) {
							if (event.keyCode == 13) {
								login();
							}
						});
						$("#submit").click(function () {
							submit();
						});
						$("#ok-close").click(function () {
							$("#msg-success").hide(100);
						});
						$("#error-close").click(function () {
							$("#msg-error").hide(100);
						});
					})
				</script>

				<!--<script>
					function disprotocolparam()
					{
						var protocol = document.getElementById("protocol");
						if (protocol.value == "auth_simple" || protocol.value == "auth_sha1" || protocol.value == "auth_sha1_v2"){
							document.getElementById("protocol_param").disabled=false
						} else {
							document.getElementById("protocol_param").disabled=true
						}
					}
				</script>-->

				<!--<script>
				function checkProcotol()
				{
				{if $node->protocol == "auth_simple" || $node->protocol == "auth_sha1" || $node->protocol == "auth_sha1_v2"}{
				document.getElementById("protocol_param").disabled=false
				} {else} {
				document.getElementById("protocol_param").disabled=true
				}{/if}
				}
				</script>-->

				<!--<script>
					function disobfsparam()
					{
						var protocol = document.getElementById("obfs");
						if (obfs.value == "http_simple" || obfs.value == "http_post" || obfs.value == "tls1.2_ticket_auth"){
							document.getElementById("obfs_param").disabled=false
						} else {
							document.getElementById("obfs_param").disabled=true
						}
					}
				</script>-->

				<!--<script>
				function checkObfs()
				{
				{if $node->obfs == "http_simple" || $node->obfs == "http_post" || $node->obfs == "tls1.2_ticket_auth"}{
				document.getElementById("obfs_param").disabled=false
				} {else} {
				document.getElementById("obfs_param").disabled=true
				}{/if}
				}
				</script> -->
				{include file='admin/footer.tpl'}
				
