package cn.hniu.service;

import cn.hniu.pojo.Student;

import java.util.List;

/**
 * <p>
 *  学生 Service层接口
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
public interface StudentService {

    Student login(Integer id, String password);

    Integer updateStudent(Student student);

    Student selectStudentById(Integer id);

    Integer addStudent(Student student);

    List<Student> list();

    Integer deleteStudentById(Integer sNo);
}
