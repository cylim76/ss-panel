{include file='auth/header.tpl'}
<body>
<div class="app app-header-fixed ">
<div class="container w-xxl w-auto-xs" ng-controller="SigninFormController" ng-init="app.settings.container = false;">
  <a href="/" class="navbar-brand block m-t">{$config['appName']}</a>
  <div class="m-b-lg">
    <div class="wrapper text-center">
      <strong>登录到用户中心</strong>
    </div>
    <form name="form" class="form-validation">
      <div class="text-danger wrapper text-center" ng-show="authError">
          
      </div>
      <div class="list-group list-group-sm">
        <div class="list-group-item">
          <input id="email" type="email" placeholder="邮箱" class="form-control no-border" required>
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="list-group-item">
           <input id="passwd" type="password" placeholder="密码" class="form-control no-border" required>
           <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
      </div>
      <div class="checkbox m-b-md m-t-none">
       	 <label class="i-checks">
         		 <input type="checkbox" id="remember_me" value="day"><i></i>记住密码
       	 </label>
     	</div> 
    </form>
		{if $user->isLogin}
			<a href="/user" class="btn btn-lg btn-primary btn-block">登录</a>
		{else}
			<button id="login" type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
		{/if}
      <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
          <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-check"></i> 登录成功!</h4>
          <p id="msg-success-p"></p>
      </div>
      <div id="msg-error" class="alert alert-danger alert-dismissable" style="display: none;">
          <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-warning"></i> 出错了!</h4>
          <p id="msg-error-p"></p>
      </div>
      <div class="text-center m-t m-b"><a href="/password/reset">忘记密码?</a></div>
      <div class="line line-dashed"></div>
      <p class="text-center"><small>没有账户?</small></p>
      <a href="/auth/register" class="btn btn-lg btn-default btn-block">注册账户</a>
    
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
        function login(){
            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
                    remember_me: $("#remember_me").val()
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/user'", 2000);
                    }else{
                        $("#msg-success").hide(10);
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
        $("#login").click(function(){
            login();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>
<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>
