package cn.hniu.service.impl;

import cn.hniu.mapper.StudentMapper;
import cn.hniu.pojo.Student;
import cn.hniu.service.StudentService;
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
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentMapper studentMapper;

    @Override
    public Student login(Integer id, String password) {
        Student student = studentMapper.login(id, password);

        log.info("student登录验证，返回值：{}", student);

        return student;
    }

    @Override
    public Integer updateStudent(Student student) {
        Integer result = studentMapper.updateStudent(student);

        log.info("根据 student返回值：{}", result);

        return result;
    }

    @Override
    public Student selectStudentById(Integer id) {
        Student student = studentMapper.selectStudentById(id);

        log.info("根据 ID查询到的数据：{}", student);

        return student;
    }

    @Override
    public Integer addStudent(Student student) {
        Integer result = studentMapper.addStudent(student);

        log.info("添加 Student返回值：{}", result);

        return result;
    }

    @Override
    public List<Student> list() {
        List<Student> list = studentMapper.list();

        log.info("查询全部的 Student信息：{}", list);

        return list;
    }

    @Override
    public Integer deleteStudentById(Integer sNo) {
        Integer result = studentMapper.deleteStudentById(sNo);

        log.info("删除 Student，返回值：{}", result);

        return result;
    }
}
