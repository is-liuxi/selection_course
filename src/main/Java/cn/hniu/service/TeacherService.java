package cn.hniu.service;

import cn.hniu.pojo.Teacher;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface TeacherService {

    Teacher login(Integer id, String password);

    List<Teacher> list();

    Integer addTeacher(Teacher teacher);

    Teacher selectTeacherById(Integer id);

    Integer deleteTeacherById(Integer tNo);

    Integer updateTeacherById(Teacher teacher);
}
