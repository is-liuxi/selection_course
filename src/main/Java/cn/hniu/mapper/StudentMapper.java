package cn.hniu.mapper;

import cn.hniu.pojo.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 学生 Mapper层
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface StudentMapper {

    @Select("SELECT * FROM student WHERE id = #{id} AND password = #{password}")
    Student login(@Param("id") Integer id, @Param("password") String password);

    Integer updateStudent(Student student);

    @Select("SELECT * FROM student WHERE id = #{id}")
    Student selectStudentById(Integer id);

    // 默认班级：计算机应用，默认性别：男（SQL已约束）
    @Insert("INSERT INTO student(id, stuName, password) VALUES(#{id}, #{stuName}, #{password})")
    Integer addStudent(Student student);

    @Select("SELECT * FROM student")
    List<Student> list();

    @Delete("DELETE FROM student WHERE id = #{sNo}")
    Integer deleteStudentById(Integer sNo);
}
