    package xyz.xioaxin12.web;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.beans.factory.annotation.Qualifier;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestMethod;
    import org.springframework.web.servlet.ModelAndView;
    import xyz.xioaxin12.bean.User;
    import xyz.xioaxin12.service.UserService;

    import javax.servlet.ServletContext;
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.util.Map;

    /**
     * @author 小信
     */
    @Controller
    @RequestMapping("/chat")
    public class UserServlet extends HttpServlet {

        @Autowired
        @Qualifier("userService")
        private UserService service;

        public void setService(UserService service) {
            this.service = service;
        }

        /**
         *
         *  注册
         */
        @RequestMapping("/register.do")
        public ModelAndView add(User user) {
            try {
                service.addUser(user);
                ModelAndView view = new ModelAndView();
                view.setViewName("redirect:/index.jsp");
                return view;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        /**
         *
         *  重置密码
         */
        @RequestMapping("/reset.do")
        public void update(User user, HttpServletResponse response) {
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = null;
            try {
                int result = service.modifyUser(user);
                if (!(result > 0)) {
                    out = response.getWriter();
                    out.print("<script>alert('重置失败，请核实信息!');window.location.href='http://111.230.233.245:8080/chatproject/reset.jsp'</script>");
                } else {
                    out = response.getWriter();
                    out.print("<script>alert('重置成功，请登陆!');window.location.href='http://111.230.233.245:8080/chatproject/index.jsp'</script>");
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        /**
         *  登陆，详细功能
         */
        @RequestMapping(value = "/login.do", method=RequestMethod.POST)
        public void login(User users, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {

            String name = request.getParameter("name");
            String password = request.getParameter("password");
            try {
                User user = service.findUser(users);
                if(user==null) {
                    request.setAttribute("error","登陆信息有误，请重新输入！");
                    request.getRequestDispatcher(request.getContextPath()+"/index.jsp").forward(request,response);
                    return;
                }
                else{
                    // 用户登录成功,第二个用户登录后将之前的session销毁!
                    request.getSession().invalidate();

                    //判断用户是否已经在Map集合中,存在：已经在列表中.销毁其session.
                    Map<User, HttpSession> userMap = (Map<User, HttpSession>)request.getServletContext()
                            .getAttribute("userMap");
                    // 判断用户是否已经在map集合中'
                    if(userMap.containsKey(user)){
                        // 说用map中有这个用户.
                        HttpSession session = userMap.get(user);
                        // 将这个session销毁.
                        session.invalidate();
                    }


                    //获取信息
                    request.getSession().setAttribute("user",user);
                    ServletContext servletContext = request.getServletContext();
                    //实现显示在线用户功能，Users实现HttpSessionBindingListener
                    response.sendRedirect(request.getContextPath() + "/main.jsp");
                    String sourceMessage = "";

                    if(servletContext.getAttribute("message")!=null){
                        sourceMessage = servletContext.getAttribute("message").toString();
                    }
                    sourceMessage += "系统公告：<font color='gray'>"+user.getNickname()+"进入聊天室</font><br>";
                    servletContext.setAttribute("message",sourceMessage);

                }
            }catch (Exception e){
                e.printStackTrace();
            }

        }
    }
