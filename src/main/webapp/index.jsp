<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="小信" content="width=device-width, xiaoxin1218@qq.com">
    <title>在线聊天室--登陆注册</title>

    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/styles1.css">
    <script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
</head>
<script type="text/javascript">
    $(function(){
        $("#bt1").click(function(){
            if(($("#username").val())=="") {
                alert("账号不能为空");
                return false;
            }
            else if(($("#password").val())=="") {
                alert("密码不能为空");
                return false;
            }
            else {
                return true;
            }
        });
    });

    $(function(){
        $("#bt2").click(function(){
            if(($("#nickname").val())=="") {
                alert("昵称不能为空");
                return false;
            }
            else if(($("#name").val())==""){
                alert("账号不能为空");
                return false;
            }
            else if(($("#pass").val())=="") {
                alert("密码不能为空");
                return false;
            }
            else if(($("#email").val())=="") {
                alert("邮箱不能为空");
                return false
            }
            else {
                return true;
            }
        });
    });
</script>
<body>
<div>
    ${requestScope["error"] }
</div>
<div class="jq22-container" style="padding-top:10px">
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登陆</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
            <div class="login-form">
                <div class="sign-in-htm">
                    <form action="${pageContext.request.contextPath }/chat/login.do" method="post">
                        <div class="group">
                            <label for="username" class="label">账号</label>
                            <input id="username" type="text" class="input" name="name" onkeyup="value=value.replace(/[^\d]/g,'')">
                        </div>
                        <div class="group">
                            <label for="password" class="label">密码</label>
                            <input id="password" type="password" class="input" name="password">
                        </div>
  <%--                      <div class="group">
                            <input id="check" type="checkbox" class="check" checked>
                            <label for="check"><span class="icon"></span> 保持登陆</label>
                        </div>--%>
                        <div class="group">
                            <input type="submit" class="button" id="bt1" value="登陆">
                        </div>
                    </form>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="${pageContext.request.contextPath }/reset.jsp">忘记密码？</a>
                    </div>

                </div>

                <div class="sign-up-htm">
                    <form action="${pageContext.request.contextPath }/chat/register.do" method="post">
                        <div class="group">
                            <label for="nickname" class="label">昵称</label>
                            <input id="nickname" type="text" class="input" name="nickname">
                        </div>
                        <div class="group">
                            <label for="name" class="label">账号</label>
                            <input id="name" type="password" class="input" name="name" onkeyup="value=value.replace(/[^\d]/g,'')">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">密码</label>
                            <input id="pass" type="password" class="input" name="password">
                        </div>
                        <div class="group">
                            <label for="email" class="label">邮箱</label>
                            <input id="email" type="email" class="input" name="email">
                        </div>
                        <div class="group">
                            <input type="submit" class="button" id="bt2"  value="注册">
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <label for="tab-1">返回登陆！</label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>