package cn.hniu.controller;

import cn.hniu.constant.ConstantClass;
import cn.hniu.constant.ResultStatus;
import cn.hniu.pojo.StuCTea;
import cn.hniu.service.StuCTeaService;
import cn.hniu.util.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/30
 */
@RestController
@RequestMapping("api/StuCTea")
@Slf4j
public class StuCTeaController {

    @Autowired
    StuCTeaService stuCTeaService;

    @PostMapping("save")
    public Result<Integer> save(@RequestBody StuCTea stuCTea) {
        log.info("添加选课信息，前端请求的参数：{}", stuCTea);

        stuCTeaService.save(stuCTea);

        return Result.success(ResultStatus.SUCCESS_CODE);
    }
}
