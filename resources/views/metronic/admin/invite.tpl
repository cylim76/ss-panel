{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">  
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">邀请</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>Invite</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR--> 
        <div class="row">
            <div class="col-md-12">
                <div id="msg-success" class="alert alert-success alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-check"></i> 成功!</h4>

                    <p id="msg-success-p"></p>
                </div>
                <div id="msg-error" class="alert alert-danger alert-dismissable" style="display:none">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>                

            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- BEGIN Portlet PORTLET-->
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold uppercase"><strong> 添加邀请码 </strong></span>
                        </div>
                    </div>
                    <div class="portlet-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label for="cate_title" class="col-md-3 control-label"><strong> 邀请码前缀 </strong></label>

                                <div class="col-md-9">
                                    <input class="form-control" id="prefix" type="text" placeholder="小于8个字符">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-md-3 control-label"><strong> 邀请码类别 </strong></label>

                                <div class="col-md-9">
                                    <input class="form-control" id="uid" type="number" placeholder="0为公开，其他数字为对应用户的UID">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-md-3 control-label"><strong> 邀请码数量 </strong></label>

                                <div class="col-md-9">
                                    <input class="form-control" id="num" type="number" placeholder="要生成的邀请码数量">
                                </div>
                            </div>
														<div class="form-group">
								 								<div class="btn-group pull-right">
       				    	 								<button type="submit" class="btn btn-primary" id="invite" name="action" value="add"> <strong> 生成邀请码 </strong> </button>
       				 									</div>
														</div>       				 									
                        </div>
                    </div>                                    	
               </div>
               <!-- END Portlet PORTLET-->               
            </div>
        		<div class="col-md-6">
        			<div class="panel panel-info">
							    <div class="panel-heading">
							        <h3 class="panel-title"><strong> 注意 </strong></h3>
							    </div>
							    <div class="panel-body">
        		  			<h5>公共邀请码（类别为0的邀请码）请<a href="/code">在这里查看</a>。<br>以下为特定用户邀请码（类别不为0和1的邀请码）:</h5>
        		  			<div class="table-scrollable">
        		  			    <table class="table table-striped table-hover">
        		  			        <thead>
        		  			        <tr>
        		  			            <th scope="col">ID</th>
        		  			            <th scope="col">对应用户ID</th>
        		  			            <th scope="col">邀请码(点右键复制链接)</th>
        		  			            <th scope="col">状态</th>
        		  			        </tr>
        		  			        </thead>
        		  			        <tbody>
        		  			        {foreach $othercodes as $code}
        		  			            <tr>
        		  			                <td><b>#{$code->id}</b></td>
        		  			                <td><b>{$code->user_id}</b></td>
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
     		    	
     				</div>
            <!-- /.box -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/admin/invite",
                dataType: "json",
                data: {
                    prefix: $("#prefix").val(),
                    uid: $("#uid").val(),
                    num: $("#num").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        setTimeout("window.location.reload()",3000);
                        //window.setTimeout("location.href='/admin/invite'", 2000);
										} else {
												$("#msg-error").show();
												$("#msg-error-p").html(data.msg);
										}
                    // window.location.reload();
                },           
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

{include file='admin/footer.tpl'}
