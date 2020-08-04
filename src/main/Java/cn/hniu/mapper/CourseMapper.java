package cn.hniu.mapper;

import cn.hniu.pojo.Course;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 课程
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface CourseMapper {


    // 查询出可以选择的课程
    List<Course> selectionCourse(@Param("sNo") Integer sNo);

    // 根据课程 ID查询课程详细信息
    Course selectCourseById(@Param("cNo") Integer cNo);

    // 查询已选课程
    List<Course> selectionMyCourse(@Param("sNo") Integer sNo);

    @Delete("DELETE FROM student_course WHERE cNo = #{cNo} AND stuNo = #{stuNo}")
    Integer deleteMyCourseById(@Param("cNo") Integer cNo, @Param("stuNo") Integer stuNo);

    List<Course> selectList();

    Integer updateCourseById(Course course);

    @Delete("DELETE FROM course WHERE cNo = #{cNo}")
    Integer deleteCourseById(Integer cNo);

    @Insert("INSERT INTO course(cNo, cName, teaNo, credit, address, cHour) VALUES(#{cNo}, #{cName}, #{teaNo}, #{credit}, #{address}, #{cHour})")
    Integer addCourse(Course course);
}
