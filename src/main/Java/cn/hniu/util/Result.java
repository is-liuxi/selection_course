package cn.hniu.util;


import lombok.Data;

/**
 * <p>
 * Controller数据返回，自定义返回类型，需要提供 get/set方法
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/29
 */
@Data
public class Result<T> {

    private T data;
    private String message;

    // 赋值初始化
    private Result(T t) {
        this.data = t;
    }

    private Result(T t, String mes) {
        this.data = t;
        this.message = mes;
    }

    // 成功数据返回
    public static <T> Result<T> success(T data) {

        return new Result<>(data);
    }

    public static <T> Result<T> success(T data, String mes) {

        return new Result<>(data, mes);
    }

    public static <T> Result<T> fail(T data, String mes) {
        return new Result<>(data, mes);
    }
}
