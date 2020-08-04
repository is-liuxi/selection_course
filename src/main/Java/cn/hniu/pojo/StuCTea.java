package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 *  学生、课程、教师对应的实体类
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StuCTea {

    private Integer stuNo;
    private Integer couNo;
    private Integer teaNo;
}
