{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			自动化命令执行
			
			<small>系统中所有自动化命令执行记录。</small>
		</h1>

	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				  <p><a class="btn btn-success btn-sm" href="/admin/autoctrl/create">添加</a></p>
				
					<div class="box">
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
									<th>操作</th>
									<th>ID</th>
									<th>日期</th>
									<th>类型</th>
									<th>内容</th>
								</tr>
								{foreach $logs as $log}
								<tr>
									<td><a class="btn btn-danger btn-sm" id="delete" value="{$log->id}" href="javascript:void(0);" onClick="delete_modal_show('{$log->id}')">删除</a></td>
									<td>#{$log->id}</td>
									<td>{$log->datetime()}</td>
									{if $log->type==1}
									  <td>命令下发</td>
									{else}
										<td>命令被执行</td>
                  {/if}
									<td>{$log->content()}</td>
								</tr>
								{/foreach}
							</table>
							{$logs->render()}
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

				  <div aria-hidden="true" class="modal fade" id="delete_modal" role="dialog" tabindex="-1">
				  	<div class="modal-dialog">
				  		<div class="modal-content">
				  			<div class="modal-heading">
				  				<a class="modal-close" data-dismiss="modal">×</a>
				  				<h2 class="modal-title" style="text-align:center;"><small>确认要删除？</small></h2>
				  			</div>
				  			<div class="modal-inner" style="text-align:center;"><p>请您确认</p>
				  			</div>
				  			<div class="modal-footer">
				  				<p class="text-right">
				  				  <button class="btn btn-info btn-sm" data-dismiss="modal" type="button">取消</button>
				  				  <button class="btn btn-danger btn-sm" data-dismiss="modal" id="delete_input" type="button">确定</button>
				  				</p>
				  			</div>
				  		</div>
				  	</div>
				  </div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->



<script>
	function delete_modal_show(id) {
		deleteid=id;
		$("#delete_modal").modal();
	}


	$(document).ready(function(){
		function delete_id(){
			$.ajax({
				type:"DELETE",
				url:"/admin/autoctrl",
				dataType:"json",
				data:{
					id: deleteid
				},
				success:function(data){
					if(data.ret){
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", 500);
					}else{
						$("#result").modal();
						$("#msg").html(data.msg);
					}
				},
				error:function(jqXHR){
					$("#result").modal();
					$("#msg").html(data.msg+"  发生错误了。");


				}
			});
		}
		$("#delete_input").click(function(){
			delete_id();
		});
	})

</script>

{include file='admin/footer.tpl'}
