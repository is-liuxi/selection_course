package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 *  实体类：学生
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private Integer id;
    // 姓名
    private String stuName;
    // 密码
    private String password;
    // 班级
    private String classes;
    // 性别
    private Integer gender;

    public Student(String stuName, String password, String classes, Integer gender) {
        this.stuName = stuName;
        this.password = password;
        this.classes = classes;
        this.gender = gender;
    }
}
