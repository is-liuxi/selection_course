package cn.hniu.mapper;

import cn.hniu.pojo.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * <p>
 * teacher Mapper层
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface TeacherMapper {

    @Select("SELECT * FROM teacher WHERE id = #{id} AND password = #{password}")
    Teacher login(@Param("id") Integer id, @Param("password") String password);

    @Select("SELECT id,teaName,password FROM teacher")
    List<Teacher> list();

    @Insert("INSERT INTO teacher(id, password, teaName) VALUES(#{id}, #{password}, #{teaName})")
    Integer addTeacher(Teacher teacher);

    @Select("SELECT id,teaName,password FROM teacher WHERE id = #{id}")
    Teacher selectTeacherById(Integer id);

    @Delete("DELETE FROM teacher WHERE id = #{id}")
    Integer deleteTeacherById(Integer tNo);

    @Update("UPDATE teacher SET password = #{password}, teaName = #{teaName} WHERE id = #{id}")
    Integer updateTeacherById(Teacher teacher);
}
