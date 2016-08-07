{include file='auth/header.tpl'}
<body class="register-page">   
 	<div class="container w-xxl w-auto-xs" ng-controller="SignupFormController" ng-init="app.settings.container = false;">
      <a href="../" class="navbar-brand block m-t">{$config['appName']}</a>
      <div class="m-b-lg">
        <div class="wrapper text-center">
          <strong>注册，然后变成一只猫。</strong>
        </div>
        <form name="form" class="form-validation">
          <div class="text-danger wrapper text-center" ng-show="authError">
              
          </div>
          <div class="list-group list-group-sm">
            <div class="list-group-item">
              <input id="name" placeholder="昵称" class="form-control no-border" required>
              <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="list-group-item">
              <input id="email" type="email" placeholder="邮箱(QQ邮箱可能无法接收到验证邮件)" class="form-control no-border" required>
              <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            {if $requireEmailVerification}
            <div class="list-group-item">
                <div class="input-group">
                    <input type="text" id="verifycode" class="form-control no-border" placeholder="邮箱验证码"/>
                <span class="input-group-btn">
                    <button type="button" id="sendcode" class="btn btn-lg btn-primary btn-block">发送验证码</button>
                </span>
                </div>
            </div>
       	 		{/if}
            
            <div class="list-group-item">
               <input type="password" id="passwd" placeholder="密码" class="form-control no-border" required>
               <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="list-group-item">
               <input type="password" id="repasswd" placeholder="重复密码" class="form-control no-border" required>
               <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="list-group-item">
               <input type="text" id="code" value="{$code}" placeholder="邀请码" class="form-control no-border" required>
               <span class="glyphicon glyphicon-send form-control-feedback"></span>
            </div>
          </div>
          </form>
          <button type="submit" id="reg" class="btn btn-lg btn-primary btn-block" >同意服务条款并提交注册</button>
          <div class="line line-dashed"></div>
          <p class="text-center"><small>已经注册?</small></p>
          <a href="/auth/login" class="btn btn-lg btn-default btn-block">登    录</a>
        	<div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
            <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-check"></i> 成功!</h4>
            <p id="msg-success-p"></p>
          </div>

        	<div id="msg-error" class="alert alert-danger alert-dismissable" style="display: none;">
            <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-warning"></i> 出错了!</h4>
            <p id="msg-error-p"></p>
       		</div>
        
 	</div>
	<div class="text-center" ng-include="'tpl/blocks/page_footer.html'">
    <p>
 	 		<small class="text-muted">All rights reserved. Powered by <b>ss-panel</b> {$config['version']}<br>Copyright &copy; 2016 <a href="#">{$config['appName']}</a></small>
		</p>
  </div>    
</div><!-- /.register-box -->

<script src="/assets/public/js/jquery.min.js"></script>

<script>
    $(document).ready(function () {
        function register() {
            $.ajax({
                type: "POST",
                url: "/auth/register",
                dataType: "json",
                data: {
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
                    code: $("#code").val(),
                    verifycode: $("#verifycode").val(),
                },
                success: function (data) {
                    if (data.ret == 1) {
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", 2000);
                    } else {
                        $("#msg-success").hide(10);
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
                register();
            }
        });
        $("#reg").click(function () {
            register();
        });
        $("#sendcode").on("click", function () {
            var count = sessionStorage.getItem('email-code-count') || 0;
            var email = $("#email").val();
            var timer, countdown = 60, $btn = $(this);
            if (count > 3 || timer) return false;

            if (!email) {
                $("#msg-error").hide(10);
                $("#msg-error").show(100);
                $("#msg-error-p").html("请先填写邮箱!");
                return $("#email").focus();
            }

            $.ajax({
                type: "POST",
                url: "/auth/sendcode",
                dataType: "json",
                data: {
                    email: email
                },
                success: function (data) {
                    if (data.ret == 1) {
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        timer = setInterval(function () {
                            --countdown;
                            if (countdown) {
                                $btn.text('重新发送 (' + countdown + '秒)');
                            } else {
                                clearTimer();
                            }
                        }, 1000);
                    } else {
                        $("#msg-success").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                        clearTimer();
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                    clearTimer();
                }
            });
            $btn.addClass("disabled").prop("disabled", true).text('发送中...');
            $("#verifycode").select();
            function clearTimer() {
                $btn.text('重新发送').removeClass("disabled").prop("disabled", false);
                clearInterval(timer);
                timer = null;
            }
        });
        $("#ok-close").click(function () {
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function () {
            $("#msg-error").hide(100);
        });
    })
</script>
<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>
