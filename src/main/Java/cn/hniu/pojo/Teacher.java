package cn.hniu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 *  教师
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher {
    private Integer id;

    private String password;

    private String teaName;

    public Teacher(String password, String teaName) {
        this.password = password;
        this.teaName = teaName;
    }
}
