package cn.hniu.controller;

import cn.hniu.constant.ResultStatus;
import cn.hniu.pojo.Teacher;
import cn.hniu.service.TeacherService;
import cn.hniu.util.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/31
 */
@RestController
@RequestMapping("api/teacher")
@Slf4j
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    @GetMapping("list")
    public Result<List<Teacher>> list() {
        List<Teacher> list = teacherService.list();

        return Result.success(list);
    }

    @PostMapping("addTeacher")
    public Result<Integer> addTeacher(@RequestBody Teacher teacher) {
        log.info("添加教师，请求参数：{}", teacher);

        Teacher teacherId = teacherService.selectTeacherById(teacher.getId());

        if (teacherId != null)
            return Result.fail(ResultStatus.ERROR_CODE, "用户 ID已存在");

        teacherService.addTeacher(teacher);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @GetMapping("selectTeacherById/{tNo}")
    public Result<Teacher> selectTeacherById(@PathVariable("tNo") Integer tNo) {
        log.info("根据 ID查询 Teacher信息，请求参数：{}", tNo);

        Teacher teacher = teacherService.selectTeacherById(tNo);

        return Result.success(teacher);
    }

    @PutMapping("updateTeacherById")
    public Result<Integer> updateTeacherById(@RequestBody Teacher teacher) {
        log.info("修改 Teacher信息，请求的参数：{}", teacher);

        teacherService.updateTeacherById(teacher);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @DeleteMapping("deleteTeacherById/{tNo}")
    public Result<Integer> deleteTeacherById(@PathVariable("tNo") Integer tNo) {
        log.info("删除教师信息，请求的信息：{}", tNo);

        teacherService.deleteTeacherById(tNo);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }
}
