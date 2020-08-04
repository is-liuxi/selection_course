package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 课程
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
    // 课程编号
    private Integer cNo;
    // 课程名
    private String cName;
    // 教师编号
    private Integer teaNo;
    // 课程学分
    private Float credit;
    // 上课教室
    private String address;
    // 课程时间
    private Integer cHour;
    // 课程对应的教师
    private Teacher teacher;

    public Course(String cName, Integer teaNo, Float credit, String address, Integer cHour) {
        this.cName = cName;
        this.teaNo = teaNo;
        this.credit = credit;
        this.address = address;
        this.cHour = cHour;
    }

    public Course(String cName, Integer teaNo, Float credit, String address, Integer cHour, Teacher teacher) {
        this.cName = cName;
        this.teaNo = teaNo;
        this.credit = credit;
        this.address = address;
        this.cHour = cHour;
        this.teacher = teacher;
    }
}
