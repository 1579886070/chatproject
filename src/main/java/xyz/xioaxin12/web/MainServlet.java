package xyz.xioaxin12.web;
import org.springframework.stereotype.Controller;
import xyz.xioaxin12.utils.BaseServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MainServlet extends BaseServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public String getMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message = (String) getServletContext().getAttribute("message");
        if (message != null) {
            response.getWriter().println(message);

        }
        return null;
    }

    public String hrTest(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ServletContext application = getServletContext();
        String sourceMessage = (String) application.getAttribute("message");
        sourceMessage += "<hr/><br/>";
        application.setAttribute("message", sourceMessage);
        return getMessage(req, resp);


    }


    public String sendMessage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 1.接收数据 。
        String email = req.getParameter("biaoqing");
        String email2 = req.getParameter("biaoqing2");
        String txt = req.getParameter("txt");
        String name = req.getParameter("name");
        String color = req.getParameter("color");
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // new Date()为获取当前系统时间，也可使用当前时间戳
        String date = df.format(new Date());

        // 获得ServletContext对象.
        ServletContext application = getServletContext();
        //  从ServletContext中获取消息
        String sourceMessage = (String) application.getAttribute("message");
        // 拼接发言的内容:xx 对 yy 说 xxx
        sourceMessage += "<font style=\"font-family:SimHei;color:#00008B;font-weight: bold\">"
                +"["+name+"]:</font>\n" +
                "    <font color='"+color+"' style=\"border:1px solid #BCD2EE;font-family:KaiTi;font-size: 16px;font-style:oblique;\">"+txt+"</font>\n"
                +"<img src=\"images/emia/"+email+"\" alt=\"\">"
                +"<img src=\"images/emia/"+email2+"\" alt=\"\">"+
                "    <font style=\"color:#800000;font-size: 10px;\">"
                +"("+date+")</font><br/>";
        // 将消息存入到application的范围
        application.setAttribute("message", sourceMessage);
        return getMessage(req, resp);
    }

    public String exit(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // 获得session对象
        HttpSession session = request.getSession();
        // 将session销毁.
        session.invalidate();
        // 页面转向.
        response.sendRedirect(request.getContextPath()+"/index.jsp");
        return null;
    }
}
