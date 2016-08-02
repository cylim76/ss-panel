{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="page-content-wrapper">
    <!-- Content Header (Page header) -->                   
    <!-- Main content -->
    <div class="page-content">
    		<!-- BEGIN PAGE BAR-->
    		<div class="page-bar">
    		   <ul class="page-breadcrumb">
    		       <li>
    		           <h4><span class="caption-subject font-green bold uppercase">节点列表</span></h4>
    		       </li>
    		       <li>
    		           <span class="caption-subject font-green bold uppercase"><small>Node List</small></span>
    		       </li><br>
    		       <li>
    		       		<span class="caption-subject font-green bold uppercase"><small><small>如需修改加密方式、协议及混淆插件，请至用户管理界面修改</small></small></span>
    		       </li>
    		   </ul>
    		</div>
    		<!-- END PAGE BAR-->     	
        <div class="row">
            <div class="col-xs-12">
                <p> <a class="btn blue btn-priamry" href="/admin/node/create"><i class="fa fa-plus"></i>添加</a> </p>
                    <div class="table-scrollable">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" style="width:70px !important">ID</th>
                										<th scope="col">节点</th>
                										<th scope="col">节点地址</th>
                										<th scope="col">默认协议</th>
                										<th scope="col">默认混淆</th>
                										<th scope="col">默认加密</th>
                										<th scope="col">流量比例</th>
                										<th scope="col">是否显示</th>
                										<th scope="col">节点状态</th>
                										<th scope="col">在线人数</th>
                										<th scope="col">描述</th>
                										<th scope="col">备注</th>
                										<th scope="col">排序</th>
                										<th scope="col">操作</th>
                                </tr>
                            </thead>
                            {foreach $nodes as $node}
                            <tbody>
                                <tr>
                                    <td>{$node->id}</td>
                										<td>{$node->name}</td>
                										<td>{$node->server}</td>
                										<td>{$node->protocol}</td>
                										<td>{$node->obfs}</td>
                										<td>{$node->method}</td>
                										<td>{$node->traffic_rate}</td>
                										<td>{if $node->type==1}显示{else}隐藏{/if}</td>
                										<td>{$node->status}</td>
                										<td>{$node->getOnlineUserCount()}</td>
                										<td>{$node->info}</td>
                										<td>{$node->note}</td>
                										<td>{$node->sort}</td>
                										<td>
                										    <a class="btn btn-outline btn-circle btn-sm purple" href="/admin/node/{$node->id}/edit"><i class="fa fa-pencil"></i>编辑</a>
                										    <a class="btn btn-outline btn-circle red btn-sm black" data-toggle="confirmation" data-popout="true" data-original-title="" title="确认删除?" id="delete_node" value="{$node->id}" href="/admin/node/{$node->id}/delete"><i class="fa fa-trash-o"></i>删除</a>
                										</td>
                                </tr>
                            </tbody>
                            {/foreach}
                        </table>
                    </div>
            </div>
        </div>

    </div><!-- /.content -->
</div><!-- /.content-wrapper -->


<script>
    $(document).ready(function(){
        function delete_node(){
            $.ajax({
                type:"DELETE",
                url:"/admin/node/",
                dataType:"json",
                data:{
                    name: $("#name").val()
                },
                success:function(data){
                    if(data.ret){
                        $("#msg-error").hide(100);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/admin/node'", 2000);
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
        $("#delete_node").click(function(){
            delete_node();
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
