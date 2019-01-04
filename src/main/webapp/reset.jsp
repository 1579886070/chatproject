<%--
  Created by IntelliJ IDEA.
  User: 小信
  Date: 2018/9/8
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="小信" content="width=device-width, xiaoxin1218@qq.com">
    <title>在线聊天室-密码重置</title>
    <link rel="stylesheet" href="css/style2.css">
    <script src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#bt3").click(function () {
            if (($("#name").val()) == "") {
                alert("账号不能为空");
                return false;
            }
            else if (($("#email").val()) == "") {
                alert("邮箱不能为空");
                return false;
            }
            else if (($("#pass").val()) == "") {
                alert("密码不能为空");
                return false;
            }
            else {
                return true;
            }
        });
    });
</script>
<body>
<div class="htmleaf-container">
    <div class="open">重置密码</div>
    <div class="modal">
        <div class="form">
            <form action="${pageContext.request.contextPath }/chat/reset.do" method="post">
                <label for="name" required="required">账号</label>
                <input id="name" type="text" name="name" onkeyup="value=value.replace(/[^\d]/g,'')"/>
                <label for="email" required="required">邮箱</label>
                <input id="email" type="email" name="email"/>
                <label for="pass">新密码</label>
                <input id="pass" type="password" required="required" name="password"/>
                <input type="submit" id="bt3" value="重置"/>
            </form>
        </div>
        <div class="invite">
            <h3>请输入原本的账号和邮箱，重置密码！</h3><br/>
            <h2><a href="http://www.xioaxin12.xyz">爱生活爱技术</a></h2>
            <div title="close" class="close"></div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(".close, .nope").on('click', function () {
        $('.modal').addClass('hidden');
        $('.open').addClass('active');
    })

    $(".open").on('click', function () {
        $(this).removeClass('active');
        $('.modal').removeClass('hidden');
    })
</script>

</body>
</html>
