package cn.hniu.service.impl;

import cn.hniu.mapper.CourseMapper;
import cn.hniu.pojo.Course;
import cn.hniu.service.CourseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Service
@Slf4j
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseMapper courseMapper;

    @Override
    public Integer deleteMyCourseById(Integer cNo, Integer stuNo) {
        Integer result = courseMapper.deleteMyCourseById(cNo, stuNo);

        log.info("删除已选课程返回值：{}", result);

        return result;
    }

    @Override
    public List<Course> selectList() {
        List<Course> list = courseMapper.selectList();

        log.info("查询到的全部课程信息：{}", list);

        return list;
    }

    @Override
    public Integer updateCourseById(Course course) {
        Integer result = courseMapper.updateCourseById(course);

        log.info("更新课程信息，返回值：{}", result);

        return result;
    }

    @Override
    public Integer deleteCourseById(Integer cNo) {
        Integer result = courseMapper.deleteCourseById(cNo);

        log.info("删除课程返回值：{}", result);

        return result;
    }

    @Override
    public Integer addCourse(Course course) {
        Integer result = courseMapper.addCourse(course);

        log.info("添加课程，返回值：{}", result);

        return result;
    }

    @Override
    public Course selectCourseById(Integer cNo) {
        Course course = courseMapper.selectCourseById(cNo);

        log.info("根据课程 ID查询课程详细信息，返回值：{}", course);

        return course;
    }

    @Override
    public List<Course> selectionMyCourse(Integer sNo) {
        List<Course> list = courseMapper.selectionMyCourse(sNo);

        log.info("查询已选的课程，返回值：{}", sNo);

        return list;
    }

    @Override
    public List<Course> selectionCourse(Integer sNo) {
        List<Course> courses = courseMapper.selectionCourse(sNo);

        log.info("{} 用户可以选择的课程，返回值：{}", sNo, courses);

        return courses;
    }
}
