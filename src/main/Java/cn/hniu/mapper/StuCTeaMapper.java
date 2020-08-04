package cn.hniu.mapper;

import cn.hniu.pojo.StuCTea;
import org.apache.ibatis.annotations.Insert;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/30
 */
public interface StuCTeaMapper {

    @Insert("INSERT INTO student_course(cNo, stuNo, teaNo) VALUES(#{couNo}, #{stuNo}, #{teaNo})")
    Integer save(StuCTea stuCTea);
}
