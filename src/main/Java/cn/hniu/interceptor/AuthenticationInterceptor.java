package cn.hniu.interceptor;

import cn.hniu.constant.ConstantClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 拦截器：用于身份验证，权限管理
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Slf4j
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object loginUserDetails = request.getSession().getAttribute(ConstantClass.USER_SESSION);

        log.info("拦截器：{}", loginUserDetails);

        if (loginUserDetails == null) {
            response.sendRedirect(request.getServletContext().getAttribute(ConstantClass.PROJECT_PATH) + "/index.jsp");
            return false;
        }


        return true;
    }
}
