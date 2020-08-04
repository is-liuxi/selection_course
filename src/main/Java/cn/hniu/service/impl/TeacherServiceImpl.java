package cn.hniu.service.impl;

import cn.hniu.mapper.TeacherMapper;
import cn.hniu.pojo.Teacher;
import cn.hniu.service.TeacherService;
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
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    TeacherMapper teacherMapper;

    @Override
    public Teacher login(Integer id, String password) {
        Teacher teacher = teacherMapper.login(id, password);

        log.info("teacher登录校验，返回值：{}", teacher);

        return teacher;
    }

    @Override
    public List<Teacher> list() {
        List<Teacher> list = teacherMapper.list();

        log.info("查询到的全部 Teacher信息，返回值：{}", list);

        return list;
    }

    @Override
    public Integer addTeacher(Teacher teacher) {
        Integer result = teacherMapper.addTeacher(teacher);

        log.info("添加 Teacher返回值：{}", result);

        return result;
    }

    @Override
    public Teacher selectTeacherById(Integer id) {
        Teacher teacher = teacherMapper.selectTeacherById(id);

        log.info("根据 ID查询 Teacher，返回值：{}", teacher);

        return teacher;
    }

    @Override
    public Integer deleteTeacherById(Integer tNo) {
        Integer result = teacherMapper.deleteTeacherById(tNo);

        log.info("删除教师返回值：{}", result);

        return result;
    }

    @Override
    public Integer updateTeacherById(Teacher teacher) {
        Integer result = teacherMapper.updateTeacherById(teacher);

        log.info("更新 Teacher返回值：{}", result);

        return result;
    }


}
