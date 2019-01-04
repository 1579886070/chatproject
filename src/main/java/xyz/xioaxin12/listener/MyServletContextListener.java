package xyz.xioaxin12.listener;

import xyz.xioaxin12.bean.User;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class MyServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        Map<User,HttpSession> userMap = new HashMap<User,HttpSession>();
        servletContextEvent.getServletContext().setAttribute("userMap",userMap);

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
