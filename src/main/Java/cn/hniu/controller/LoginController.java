package cn.hniu.controller;

import cn.hniu.constant.ConstantClass;
import cn.hniu.constant.ResultStatus;
import cn.hniu.pojo.Student;
import cn.hniu.pojo.Teacher;
import cn.hniu.service.StudentService;
import cn.hniu.service.TeacherService;
import cn.hniu.util.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * <p>
 * 登录处理
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@RestController
@RequestMapping("api/user")
@Slf4j
public class LoginController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @PostMapping("login")
    public Result<Integer> login(@RequestBody Map<String, Object> map, HttpServletRequest req) {
        log.info("登录校验，前端请求的参数：{}", map);

        Integer id = Integer.valueOf(String.valueOf(map.get("id")));
        String password = String.valueOf(map.get("password"));
        String type = String.valueOf(map.get("type"));

        HttpSession session = req.getSession();
        log.info("session：{}", session);

        // 根据登录的角色查询
        if ("teacher".equals(type)) {
            Teacher teacher = teacherService.login(id, password);

            if (teacher == null)
                return Result.fail(400, "用户名或者密码错误！！！");

            // 将用户登录信息保存到 Session中
            session.setAttribute(ConstantClass.USER_SESSION, teacher);

            return Result.success(ResultStatus.SUCCESS_CODE, ConstantClass.ROLE_TEACHER);
        } else {
            Student student = studentService.login(id, password);

            if (student == null)
                return Result.fail(400, "用户名或者密码错误！！！");

            // 将用户登录信息保存到 Session中
            session.setAttribute(ConstantClass.USER_SESSION, student);
            return Result.success(ResultStatus.SUCCESS_CODE, ConstantClass.ROLE_STUDENT);
        }

    }

}
