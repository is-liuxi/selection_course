package cn.hniu.service.impl;

import cn.hniu.mapper.StuCTeaMapper;
import cn.hniu.pojo.StuCTea;
import cn.hniu.service.StuCTeaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/30
 */
@Service
@Slf4j
public class StuCTeaServiceImpl implements StuCTeaService {

    @Autowired
    StuCTeaMapper stuCTeaMapper;

    @Override
    public Integer save(StuCTea stuCTea) {
        Integer result = stuCTeaMapper.save(stuCTea);

        log.info("添加选课信息，返回值：{}", result);

        return result;
    }
}
