package cn.hniu.listener;

import cn.hniu.constant.ConstantClass;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * <p>
 * 自定义过滤器
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/28
 */
@WebListener
@Slf4j
public class CustomListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 获取项目上下文
        ServletContext context = sce.getServletContext();

        String path = context.getContextPath();

        log.info("项目上下文路径：{}", path);

        // 将项目名保存到 Session中
        context.setAttribute(ConstantClass.PROJECT_PATH, path);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
