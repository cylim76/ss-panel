{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">  
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">站点配置</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>App Config</small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->  
        <div class="row">
            <div class="col-md-12">
                <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 成功!</h4>

                    <p id="msg-success-p"></p>
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
                            <span class="caption-subject bold uppercase"><strong> 修改配置 </strong></span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form role="form">
                            <div class="form-group">
                                <label class="bold"> 网站名 </label>
                                <input type="text" class="form-control" placeholder="Enter ..." id="app-name"
                                       value="{$conf['app-name']}">
                            </div>

                            <div class="form-group">
                                <label class="bold"> 统计代码</label>
                                <textarea class="form-control" id="analytics-code" rows="3"
                                          placeholder="Enter ...">{$conf['analytics-code']}</textarea>
                            </div>

                            <div class="form-group">
                                <label class="bold">邀请页公告</label>
                                <textarea class="form-control" id="home-code" rows="3"
                                          placeholder="Enter ...">{$conf['home-code']}</textarea>
                            </div>

                            <div class="form-group">
                                <label class="bold">用户中心公告</label>
                                <textarea class="form-control" id="user-index" rows="3"
                                          placeholder="Enter ...">{$conf['user-index']}</textarea>
                            </div>

                            <div class="form-group">
                                <label class="bold">用户节点公告</label>
                                <textarea class="form-control" id="user-node" rows="3"
                                          placeholder="Enter ...">{$conf['user-node']}</textarea>
                            </div>

                        </form>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button id="update" type="submit" name="update" value="update" class="btn btn-primary">更新配置
                        </button>
                    </div>

                </div>
         </div>
         <div class="col-md-6">
                <!-- BEGIN Portlet PORTLET-->
                <div class="portlet light bordered">
                    <div class="portlet-title">
                        <div class="caption">
                            <span class="caption-subject bold uppercase"><strong> 其他信息 </strong></span>
                        </div>
                    </div>                    
                    <div class="portlet-body">
                    	<p>暂无</p>
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
        $("#update").click(function () {
            $.ajax({
                type: "PUT",
                url: "/admin/config",
                dataType: "json",
                data: {
                    analyticsCode: $("#analytics-code").val(),
                    homeCode: $("#home-code").val(),
                    appName: $("#app-name").val(),
                    userIndex: $("#user-index").val(),
                    userNode: $("#user-node").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        //window.setTimeout("location.href='/admin/invite'", 2000);
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
