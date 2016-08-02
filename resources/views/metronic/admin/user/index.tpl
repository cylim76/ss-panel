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
                    <div class="table-scrollable">
                        {$users->render()}
                        <table class="table table-striped table-hover">
                        	<thead>
                            <tr>
                                <th scope="col" style="width:40px !important">ID</th>
                                <th scope="col">昵称</th>
                                <th scope="col">邮箱</th>
                                <th scope="col">端口</th>
                                <th scope="col">状态</th>
                                <!--<th scope="col">协议</th>-->
                                <!--<th scope="col">混淆</th>-->
                                <th scope="col">加密</th>
                                <th scope="col">已用流量/总流量</th>
                                <th scope="col">最后在线时间</th>
                                <!--<th scope="col">最后签到时间</th>-->
                                <th scope="col">注册时间</th>
                                <th scope="col">到期时间</th>
                                <th scope="col">注册IP</th>
                                <th scope="col">邀请者</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>                            
                            {foreach $users as $user}
                            <tbody>
                            <tr>
                                <td>#{$user->id}</td>
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
                                <th scope="col">{$user->reg_date}</th>
                                <th scope="col">{$user->expire_at}</th>
                                <th scope="col">{$user->reg_ip}</th>
                                <th scope="col">{$user->ref_by}</th>
                                <td>
                                    <a class="btn btn-outline btn-circle btn-sm purple" href="/admin/user/{$user->id}/edit"><i class="fa fa-pencil"></i>编辑</a>
                                    <a class="btn btn-outline btn-circle red btn-sm black" data-toggle="confirmation" data-popout="true" data-original-title="" title="确认删除?" id="delete" value="{$user->id}" href="/admin/user/{$user->id}/delete"><i class="fa fa-trash-o"></i>删除</a>
                                </td>
                            </tr>
                            </tbody>                            
                            {/foreach}
                        </table>
                        {$users->render()}
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </div><!-- /.content -->
</div><!-- /.content-wrapper -->


<script>
    $(document).ready(function(){
        function delete(){
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
        $("#delete").click(function(){
            delete();
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
