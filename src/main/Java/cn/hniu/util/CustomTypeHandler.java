package cn.hniu.util;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <p>
 * 类型转换器，Java -> MySql
 * </p>
 *
 * @author: liuxi
 * @date: 2020/7/30
 */
public class CustomTypeHandler extends BaseTypeHandler<Integer> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Integer parameter, JdbcType jdbcType) throws SQLException {
        // 0：男，1：女
        if (parameter == 0)
            ps.setString(i, "男");
        else
            ps.setString(i, "女");
    }

    @Override
    public Integer getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String result = rs.getString(columnName);

        int flag;
        if ("男".equals(result))
            flag = 0;
        else
            flag = -1;

        return flag;
    }

    @Override
    public Integer getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String result = rs.getString(columnIndex);

        int flag;
        if ("男".equals(result))
            flag = 0;
        else
            flag = -1;

        return flag;
    }

    @Override
    public Integer getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String result = cs.getString(columnIndex);

        int flag;
        if ("男".equals(result))
            flag = 0;
        else
            flag = -1;

        return flag;
    }
}
