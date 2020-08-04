package cn.hniu.service;

import cn.hniu.pojo.Course;

import java.util.List;

/**
 * <p>
 * 课程
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface CourseService {

    List<Course> selectionCourse(Integer sNo);

    Course selectCourseById(Integer cNo);

    List<Course> selectionMyCourse(Integer sNo);

    Integer deleteMyCourseById(Integer cNo, Integer stuNo);

    List<Course> selectList();

    Integer updateCourseById(Course course);

    Integer deleteCourseById(Integer cNo);

    Integer addCourse(Course course);
}
