{include file='auth/header.tpl'}
<body>
<div class="app app-header-fixed ">

<div class="container w-xl w-auto-xs" ng-init="app.settings.container = false;">
  <a href="/" class="navbar-brand block m-t">{$config['appName']}</a>
  <div class="m-b-lg">
    <div class="wrapper text-center">
      <strong>请输入邮箱以重置密码</strong>
    </div>
    <form name="reset">
      <div class="list-group list-group-sm">
        <div class="list-group-item">
          <input type="email" id="email" placeholder="邮箱" class="form-control no-border" required>
          <!--<span  class="glyphicon glyphicon-envelope form-control-feedback"></span>-->
        </div>
      </div>
      
    </form>
    <button type="submit" id="reset" class="btn btn-lg btn-primary btn-block" >重置密码</button>
    <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
        <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-check"></i> 成功!</h4>
        <p id="msg-success-p"></p>
    </div>
    <div id="msg-error" class="alert alert-danger alert-dismissable" style="display: none;">
        <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-warning"></i> 出错了！</h4>
        <p id="msg-error-p"></p>
    </div>
    <br>
    <a href="/auth/login" class="btn btn-lg btn-default btn-block">返回登录</a>

  </div>
  <div class="text-center" ng-include="'tpl/blocks/page_footer.html'">
    <p>
  <small class="text-muted">All rights reserved. Powered by <b>ss-panel</b> {$config['version']}<br>Copyright &copy; 2016 <a href="#">{$config['appName']}</a></small>
</p>
  </div>
</div>


</div>

<script src="/assets/public/js/jquery.min.js"></script>

<script>
    $(document).ready(function(){
        function reset(){
            $.ajax({
                type:"POST",
                url:"/password/reset",
                dataType:"json",
                data:{
                    email: $("#email").val()
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#msg-error").hide(100);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        //window.setTimeout("location.href='#'", 2000);
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
        $("#reset").click(function(){
            reset();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>
</body>
</html>
