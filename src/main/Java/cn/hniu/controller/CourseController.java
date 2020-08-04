package cn.hniu.controller;

import cn.hniu.constant.ResultStatus;
import cn.hniu.pojo.Course;
import cn.hniu.service.CourseService;
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
 * @date: 2020/7/29
 */
@RestController
@RequestMapping("api/course")
@Slf4j
public class CourseController {

    @Autowired
    CourseService courseService;

    @GetMapping("selectionCourse/{sNo}")
    public Result<List<Course>> selectionCourse(@PathVariable("sNo") Integer sNo) {
        log.info("查询出可以选择的课程，前端请求的参数：{}", sNo);

        List<Course> courseList = courseService.selectionCourse(sNo);

        return Result.success(courseList);
    }

    @GetMapping("selectCourseById/{cNo}")
    public Result<Course> selectCourseById(@PathVariable("cNo") Integer cNo) {
        log.info("根据课程 ID查询课程详细信息，前端请求的参数：{}", cNo);

        Course course = courseService.selectCourseById(cNo);

        return Result.success(course);
    }

    @GetMapping("selectionMyCourse/{sNo}")
    public Result<List<Course>> selectionMyCourse(@PathVariable("sNo") Integer sNo) {
        log.info("查询已选的课程，用户 ID：{}", sNo);

        List<Course> list = courseService.selectionMyCourse(sNo);

        return Result.success(list);
    }

    @DeleteMapping("deleteMyCourseById/{cNo}/{sNo}")
    public Result<Integer> deleteMyCourseById(@PathVariable("cNo") Integer cNo, @PathVariable("sNo") Integer sNo) {
        log.info("删除已选课程，用户名：{}，课程 ID：{}", sNo, cNo);

        courseService.deleteMyCourseById(cNo, sNo);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @GetMapping("list")
    public Result<List<Course>> list() {
        List<Course> list = courseService.selectList();

        return Result.success(list);
    }

    @PutMapping("updateCourseById")
    public Result<Integer> updateCourseById(@RequestBody Course course) {
        log.info("更新课程信息，请求的参数：{}", course);

        courseService.updateCourseById(course);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @DeleteMapping("deleteCourseById/{cNo}")
    public Result<Integer> deleteCourseById(@PathVariable("cNo") Integer cNo) {
        log.info("删除课程，请求参数：{}", cNo);

        courseService.deleteCourseById(cNo);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }

    @PostMapping("addCourse")
    public Result<Integer> addCourse(@RequestBody Course course) {
        log.info("添加课程，请求的参数：{}", course);

        Course courseId = courseService.selectCourseById(course.getCNo());
        log.info("课程 ID是否已存在：{}", courseId);

        if (courseId != null)
            return Result.success(ResultStatus.ERROR_CODE, "课程 ID已存在");

        courseService.addCourse(course);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }
}