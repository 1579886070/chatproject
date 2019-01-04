package xyz.xioaxin12.bean;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.util.Map;

/**
 * @author 小信
 */
public class User implements HttpSessionBindingListener {
    private Integer id;
    private String nickname;
    private Integer name;
    private String password;
    private String email;

    public User() {
    }

    public User(String nickname, Integer name, String password, String email) {
        this.nickname = nickname;
        this.name = name;
        this.password = password;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getName() {
        return name;
    }

    public void setName(Integer name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "nickname='" + nickname + '\'' +
                ", name=" + name +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    @Override
    public void valueBound(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println(this.getNickname()+"进入了");
        HttpSession session = httpSessionBindingEvent.getSession();
        Map<User,HttpSession> userMap = (Map<User,HttpSession>) session.getServletContext().getAttribute("userMap");
        userMap.put(this,session);
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent httpSessionBindingEvent) {
        //移除session对象
        System.out.println(this.getNickname()+"退出了");
        HttpSession session = httpSessionBindingEvent.getSession();
        Map<User, HttpSession> userMap = (Map<User, HttpSession>) session
                .getServletContext().getAttribute("userMap");
        userMap.remove(this);
    }
}
