{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">	
    <!-- Main content -->
    <div class="page-content">
        <!-- BEGIN PAGE BAR-->
        <div class="page-bar">
        	 <ul class="page-breadcrumb">
            	 <li>
                	 <h4><span class="caption-subject font-green bold uppercase">用户列表 #{$user->id}</span></h4>
            	 </li>
            	 <li>
                	 <span class="caption-subject font-green bold uppercase"><small>User List</small></span>
            	 </li>
        	 </ul>
        </div>
        <!-- END PAGE BAR-->    	
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                        <table class="table table-striped table-bordered table-hover table-header-fixed" id="sample_1">
                            <thead>
                                <tr class="">
                                    <th style="width:40px !important">ID</th>
                                    <th>昵称</th>
                                    <th>邮箱</th>
                                    <th>端口</th>
                                    <th>状态</th>
                                    <!--<th>协议</th>-->
                                    <!--<th>混淆</th>-->
                                    <th>加密</th>
                                    <th>已用流量/总流量</th>
                                    <th>最后在线时间</th>
                                    <!--<th>最后签到时间</th>-->
                                    <th>注册时间</th>
                                    <th>到期时间</th>
                                    <th>注册IP</th>
                                    <th>操作</th>
                                </tr>
                            </thead>        
                            <tbody>
                                {foreach $users as $user}
                                <tr>
                                    <td>{$user->id}</td>
                                    <td>{$user->user_name}</td>
                                    <td>{$user->email}</td>
                                    <td>{$user->port}</td>
                                    
                                    {if $user->enable==1}
                                        <td>正常</td>
                                    	{else}
                                        	<td>禁用</td>
                                    	{/if}
                                    
                                    <!--<td>{$user->protocol}</td>
                                    <td>{$user->obfs}</td>-->
                                    <td>{$user->method}</td>
                                    <td>{$user->usedTraffic()}/{$user->enableTraffic()}</td>
                                    <td>{$user->lastSsTime()}</td>
                                    <!--<td>{$user->lastCheckInTime()}</td>-->
                                    <th>{$user->reg_date}</th>
                                    <th>{$user->expire_at}</th>
                                    <th>{$user->reg_ip}</th>
                                    <td>
                                        <a class="btn btn-outline btn-circle btn-sm purple" href="/admin/user/{$user->id}/edit"><i class="fa fa-pencil"></i>编辑</a>
                                        <a class="btn btn-outline btn-circle red btn-sm black" data-toggle="confirmation" data-popout="true" data-original-title="" title="确认删除?" id="delete_user" value="{$user->id}" href="/admin/user/{$user->id}/delete"><i class="fa fa-trash-o"></i>删除</a>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>        	 
                        </table>
                </div><!-- /.box -->
            </div>
        </div>

    </div><!-- /.content -->
</div><!-- /.content-wrapper -->


<script>
    $(document).ready(function(){
        function delete_user(){
            $.ajax({
                type:"DELETE",
                url:"/admin/user/",
                dataType:"json",
                data:{
                    name: $("#name").val()
                },
                success:function(data){
                    if(data.ret){
                        $("#msg-error").hide(100);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/admin/user'", 2000);
                    }else{
                        $("#msg-error").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误："+jqXHR.status);
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#delete_user").click(function(){
            delete_user();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>

{include file='admin/footer.tpl'}
