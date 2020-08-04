<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>登录页</title>
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.min.css">
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            /* 背景图片透明度 */
            background: rgba(24, 142, 238, .5) url("${APP_PATH}/static/img/backgroud.jpg") no-repeat;
            /* 将背景图片等比缩放填满整个容器 */
            background-size: cover;
        }

        #content {
            margin-top: 50px;
            background-color: #fff;
            /* 设置 div为圆角 */
            border-radius: 20px;
            /* 背景颜色透明度 */
            opacity: .7;
            height: 500px;
            text-align: center;
        }

        h2 {
            padding-top: 40px;
            padding-bottom: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="content">
        <h2>学生选课信息管理系统</h2>
        <form class="form-horizontal" role="form" onsubmit="return false">
            <div class="form-group">
                <label for="id" class="col-sm-3 control-label">学号</label>
                <div class="col-sm-7">
                    <input type="number" name="id" class="form-control" id="id" placeholder="请输入您的学号">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-7">
                    <input type="password" name="password" class="form-control" id="password"
                           placeholder="请输入您的密码">
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-sm-3 control-label">身份</label>
                <div class="col-sm-7">
                    <select class="form-control" name="type" id="type">
                        <option value="student" selected>学生</option>
                        <option value="teacher">管理员</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-1">
                    <button type="submit" class="btn btn-success" id="submit">登录</button>
                </div>
                <div class="col-sm-2">
                    <button type="reset" class="btn btn-info"> 清空</button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/layer/layer.js"></script>
<script>
    /* 登录 */
    $("#submit").click(function () {
        var id = $("#id").val();
        var password = $("#password").val();
        var type = $("#type").val();

        if (id < 0 || password.length <= 0) {
            layer.msg("请输入有效的用户信息！！！", {time: 500, icon: 5, shift: 6}, null);
            return;
        }

        var data = {
            "id": id,
            "password": password,
            "type": type
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/api/user/login",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                console.log(result);
                if (result.data === 400) {
                    layer.msg(result.message, {time: 500, icon: 2, shift: 4}, null);
                }

                if (result.message === "student") {
                    window.location.href = "main/student";
                }

                if (result.message === "teacher") {
                    window.location.href = "main/teacher";
                }
            }
        });

    });

</script>
</body>
</html>