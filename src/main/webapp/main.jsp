<%--
  Created by IntelliJ IDEA.
  User: 小信
  Date: 2018/9/8
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    if (null == session.getAttribute("user")) {
        out.println("<script language='javascript'>alert('您的账户已经过期，请重新登录!');window.location='index.jsp';</script>");
        return;
    }

%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Web在线聊天室</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="author" content="小信" />
    <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/styles3.css">
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>

</head>
<script language="javascript" type="text/javascript">
    function setVar(v_sel) {
        txt.value = txt.value + v_sel.value;
    }
</script>
<script type="text/javascript">
    var sysBBS = "<span style='font-size:14px; line-height:30px;'>欢迎进入聊天室，功能完善中，现在可畅谈哦。。。<br/>";
    window.setInterval("showOnLine();", 5000);
    window.setInterval("showContent();", 1000);
    window.setInterval("ShowScroll()", 1000)
    $(function () {
        showOnLine();
        showContent();
        ShowScroll();
    })

    // 显示在线人员列表
    function showOnLine() {
        // 异步发送请求 获取在线人员列表
        $.post("${pageContext.request.contextPath}/online.jsp?" + new Date().getTime(), function (data) {
            $("#online").html(data);
        });
    }

    function showContent() {
        $.post("${pageContext.request.contextPath}/information?" + new Date().getTime(), {'method': 'getMessage'}, function (data) {
            $("#content").html(sysBBS + data);
        });

    }

    function ShowScroll() {
        $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
    }

    function exit() {
        alert("欢迎您下次光临！");
        window.location.href = "${pageContext.request.contextPath}/information?method=exit";
    }
</script>

<script type="text/javascript">
    function del() {
        if (form1.txt.value == "") {
            alert("请先输入内容哦！");
            return false;
        }
        $.post("${pageContext.request.contextPath}/information?" + new Date().getTime(), $("#form1").serialize(), function (data) {
            $("#content").html(data);
        });
        $("#form1")[0].reset();
        $("#txt").val("").focus(); // 清空并获得焦点

    }

    function hrtest() {
        $.post("${pageContext.request.contextPath}/information?" + new Date().getTime(), {'method': 'hrTest'}, function (data) {
            $("#content").html(data);
        });
    }
</script>

<body>
<div>
    <%--导航--%>
    <nav>
        <div id="menu_button_wrapper">
            <div id="menu_button">
                Home&nbsp;&nbsp;
                <div id="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <ul id="menu_list">
            <li><a href="#">Home</a></li>
            <li><a href="http://www.xioaxin12.xyz">博客</a></li>
            <li><a href="https://gitee.com/xiaoxin1218">码云</a></li>
            <li><a href="#">暂无</a></li>
            <li><a href="#">暂无</a></li>
            <li><a href="#">暂无</a></li>
        </ul>
    </nav>

    <script type="text/javascript">

        function addListener(element, type, callback) {
            if (element.addEventListener) {
                element.addEventListener(type, callback);
            } else if (element.attachEvent) {
                element.attachEvent('on' + type, callback);
            }
        }

        addListener(document, 'DOMContentLoaded', function () {

            var mq = window.matchMedia("(max-width: 760px)");
            if (mq.matches) {
                document.getElementById("menu_list").classList.add("hidden");
            }

            addListener(document.getElementById("menu_button"), 'click', function () {
                document.getElementById("menu_list").classList.toggle("hidden");
            });

            addListener(window, 'resize', function () {
                var width = window.innerWidth ||
                    document.documentElement.clientWidth ||
                    document.body.clientWidth;

                if (width > 760) {
                    document.getElementById("menu_list").classList.remove("hidden");
                } else {
                    document.getElementById("menu_list").classList.add("hidden");
                }
            });

        });
    </script>

    <header class="am-g my-head">
        <div class="am-u-sm-12 am-article">
            <h1 class="am-article-title">在线聊天室</h1>
            <p class="am-article-meta">比你聪明的都在努力，你应该有所觉悟--小信</p>
        </div>
    </header>
    <hr class="am-article-divider"/>
    <div class="am-g am-g-fixed">
        <div class="am-u-md-9 am-u-md-push-3">
            <div class="am-g">
                <div class="am-u-sm-11 am-u-sm-centered">
                    <div class="am-g-fixed2 chat-content-container2" id="scroll">
                        <p id="content"></p>
                    </div>

                </div>
            </div>
            <hr/>
            <form id="form1" name="form1" method="post">
                <input type="hidden" name="method" value="sendMessage"/>
                <input name="name" type="hidden" value="${user.nickname}"/>
                <div class="choose">
                    <select
                            name="color" size="1" class="wenbenkuang" id="select">
                        <option selected style="color:#000000 " value="000000">字体颜色</option>
                        <option style="color:#FF0000" value="FF0000">纯正红色</option>
                        <option style="color:#00CED1" value="00CED1">深绿宝石</option>
                        <option style="color:#2F4F4F" value="2F4F4F">深石板灰</option>
                        <option style="color:#8B008B" value="8B008B">深洋红色</option>
                        <option style="color:#009900" value="009900">绿色青春</option>
                        <option style="color:#009999" value="009999">青色清爽</option>
                        <option style="color:#990099" value="990099">紫色拘谨</option>
                        <option style="color:#990000" value="990000">暗夜兴奋</option>
                        <option style="color:#000099" value="000099">深蓝忧郁</option>
                        <option style="color:#999900" value="999900">卡其制服</option>
                        <option style="color:#ff9900" value="ff9900">镏金岁月</option>
                        <option style="color:#0099ff" value="0099ff">湖波荡漾</option>
                        <option style="color:#9900ff" value="9900ff">发亮蓝紫</option>
                        <option style="color:#ff0099" value="ff0099">爱的暗示</option>
                        <option style="color:#006600" value="006600">墨绿深沉</option>
                        <option style="color:#999999" value="999999">烟雨蒙蒙</option>
                    </select>
                </div>

                <div class="choose">
                    <select
                            name="biaoqing" size="1" class="wenbenkuang">
                        <option selected style="color:#000000 " value="1.png">暴走漫画表情</option>
                        <option value="bmanshuang_org.gif">吃东西</option>
                        <option value="bmaoye_org.gif">眼花</option>
                        <option value="bmbaonu_org.gif">暴动</option>
                        <option value="bmbianshen_org.gif">跳跃</option>
                        <option value="bmbinfen_org.gif">花痴</option>
                        <option value="bmcaise_org.gif">变色</option>
                        <option value="bmchan_org.gif">流口水</option>
                        <option value="bmchijing_org.gif">移动</option>
                        <option value="bmdajiao_org.gif">大笑</option>
                        <option value="bmdaku_org.gif">大哭</option>
                    </select>
                </div>

                <div class="choose">
                    <select
                            name="biaoqing2" size="1" class="wenbenkuang">
                        <option selected style="color:#000000 " value="1.png">天气表情</option>
                        <option value="ch_org.gif">彩虹</option>
                        <option value="dark_org.gif">多云</option>
                        <option value="ljf_org.gif">龙卷风</option>
                        <option value="rain.gif">下雨</option>
                        <option value="snow_org.gif">雪花</option>
                        <option value="sh_org.gif">闪电</option>
                        <option value="lx_org.gif">流星</option>
                        <option value="bb2_org.gif">冰雹</option>
                        <option value="sunny_org.gif">晴天</option>
                        <option value="gf_org.gif">刮风</option>
                        <option value="hs2_org.gif">海啸</option>
                    </select>
                </div>

                <div class="choose">
                    <select
                            name="shuzi" size="1" class="wenbenkuang" onchange="setVar(this);">
                        <option selected style="color:#000000 " value="">数字符号</option>
                        <option value="⓵">⓵</option>
                        <option value="⓶">⓶</option>
                        <option value="⓷">⓷</option>
                        <option value="⓸">⓸</option>
                        <option value="⓹">⓹</option>
                        <option value="⓺">⓺</option>
                        <option value="⓻">⓻</option>
                        <option value="⓼">⓼</option>
                        <option value="⓽">⓽</option>
                        <option value="⓾">⓾</option>
                    </select>
                </div>

                <div class="choose">

                    <select
                            name="yan" size="1" class="wenbenkuang" onchange="setVar(this);">
                        <option selected style="color:#000000 " value="">颜文字</option>
                        <option value="(╯ε╰)">(╯ε╰)</option>
                        <option value="( ╯▽╰)">( ╯▽╰)</option>
                        <option value="눈_눈">눈_눈</option>
                        <option value="(u‿ฺu✿ฺ)">(u‿ฺu✿ฺ)</option>
                        <option value="( ఠൠఠ )ﾉ">( ఠൠఠ )ﾉ</option>
                        <option value="_( ﾟДﾟ)ﾉ">_( ﾟДﾟ)ﾉ</option>
                        <option value="U•ェ•*U">U•ェ•*U</option>
                        <option value="ԅ(¯﹃¯ԅ)">ԅ(¯﹃¯ԅ)</option>
                        <option value="╰(*°▽°*)╯">╰(*°▽°*)╯</option>
                        <option value="(*^▽^*)">(*^▽^*)</option>
                        <option value="<(－︿－)>"><(－︿－)></option>
                        <option value="(*￣;(￣ *)">(*￣;(￣ *)</option>
                        <option value="┏ (^ω^)=☞">┏ (^ω^)=☞</option>
                        <option value="✎～～～✐">✎～～～✐</option>
                        <option value="（＃￣～￣＃）">（＃￣～￣＃）</option>
                    </select>
                </div>

                <div class="choose">
                    <input class="btn" name="button_exit" type="button" value="分割线" onClick="hrtest()">
                </div>

                <div class="ex">
                    <input class="btn" name="button_exit" type="button" value="退出聊天室" onClick="exit()">
                </div>
                <hr/>
                <hr/>
                <br>
                <div class="chattext">
                    <textarea name="txt" id="txt" type="text" class="text2"
                              placeholder="想说点什么吗"></textarea>
                </div>
                <div class="chatbtn">
                    <input class="btn draw-outline" style="float:right" name="button_exit" type="button" onclick="
del()" value="发送">
                </div>
            </form>
        </div>
        <div class="am-u-md-3 am-u-md-pull-9 my-sidebar">
            <table>
                <tr>
                    <td width="165" valign="top" id="online" style="text-align: center">在线人员列表</td>
                </tr>
            </table>
        </div>
    </div>
    <footer class="my-footer">
        <p>静心也心静<br>
            <small>© Copyright 小信. xiaoxin1218@qq.com</small>
        </p>
    </footer>

    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="assets/js/amazeui.ie8polyfill.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script type="text/javascript" src="js/canvas-nest.min.js"></script>
</body>
</html>

