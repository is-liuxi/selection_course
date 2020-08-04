package cn.hniu.controller;

import cn.hniu.constant.ConstantClass;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 用于请求页面跳转
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Controller
@RequestMapping("main")
public class PageRedirectController {

    // student首页
    @GetMapping("student")
    public String studentPage() {

        return "student";
    }

    // student中的选课中心
    @GetMapping("selectionCourse")
    public String selectionCourse() {

        return "selectionCourse";
    }

    @GetMapping("myCourse")
    public String myCourse() {

        return "myCourse";
    }

    @GetMapping("me")
    public String me() {

        return "me";
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest req) {

        HttpSession session = req.getSession();

        // 将用户 Session清除
        session.invalidate();

        // 从 application域中获取上下文路径
        Object contextPath = session.getServletContext().getAttribute(ConstantClass.PROJECT_PATH);

        // 跳转到登录页面
        return "redirect: " + contextPath + "";
    }


    // 教师管理
    @GetMapping("teacher")
    public String teacherPage() {

        return "teacher";
    }

    @GetMapping("addCourse")
    public String addCourse() {

        return "addCourse";
    }

    @GetMapping("addUser")
    public String addUser() {

        return "addUser";
    }

    @GetMapping("studentManager")
    public String studentManager() {

        return "studentManager";
    }

    @GetMapping("teacherManager")
    public String teacherManager() {

        return "teacherManager";
    }
}
