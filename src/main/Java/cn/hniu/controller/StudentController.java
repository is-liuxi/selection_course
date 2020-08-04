package cn.hniu.controller;

import cn.hniu.constant.ResultStatus;
import cn.hniu.pojo.Student;
import cn.hniu.service.StudentService;
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
 * @date: 2020/7/30
 */
@RestController
@RequestMapping("api/student")
@Slf4j
public class StudentController {

    @Autowired
    StudentService studentService;

    @GetMapping("selectStudentById/{id}")
    public Result<Student> selectStudentById(@PathVariable("id") Integer id) {
        log.info("查询 Student传入的参数：{}", id);

        Student student = studentService.selectStudentById(id);

        return Result.success(student);
    }

    @PutMapping("updateStudent")
    public Result<Integer> updateStudent(@RequestBody Student student) {
        log.info("修改 Student传入的参数：{}", student);

        studentService.updateStudent(student);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @PostMapping("addStudent")
    public Result<Integer> addStudent(@RequestBody Student student) {
        log.info("添加的学生信息，请求的参数：{}", student);

        // 查看学生 ID是否已存在
        Student studentId = studentService.selectStudentById(student.getId());

        if (studentId != null)
            return Result.fail(ResultStatus.ERROR_CODE, "用户 ID已存在");

        studentService.addStudent(student);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @GetMapping("list")
    public Result<List<Student>> list() {
        List<Student> list = studentService.list();

        return Result.success(list);
    }

    @DeleteMapping("deleteStudentById/{sNo}")
    public Result<Integer> deleteStudentById(@PathVariable("sNo") Integer sNo) {
        log.info("删除 Student，请求参数：{}", sNo);

        studentService.deleteStudentById(sNo);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }
}
