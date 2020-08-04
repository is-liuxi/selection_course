<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.min.css">
    <style>
        body {
            padding: 0px;
            margin: 0px;
        }

        nav {
            margin-top: 20px;
        }

        .navbar-header:not(:first-child) {
            align-content: center;
            margin-right: 10px;
            padding-left: 20px;
        }

        .form-horizontal {
            margin-top: 30px;
        }

        .form-horizontal .radio {
            padding-top: 0px;
        }
    </style>
</head>
<body>

<div class="container">
    <%-- 导航条 --%>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/student">新闻中心</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/selectionCourse">选课中心</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/myCourse">我的课表</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/me"
                   style="background-color: #ff9933; border-radius: 3px; color: white;">个人中心</a>
            </div>
            <div class="navbar-header  navbar-right">
                <a class="navbar-brand" href="${APP_PATH}/main/logout"> 退出登录 </a>
            </div>
        </div>
    </nav>

    <%-- 个人信息展示 --%>
    <form class="form-horizontal" onsubmit="return false">
        <div class="form-group">
            <label for="id" class="col-sm-2 control-label"> 学号</label>
            <div class="col-sm-8">
                <input type="text" name="id" class="form-control" id="id" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="stuName" class="col-sm-2 control-label"> 姓名</label>
            <div class="col-sm-8">
                <input type="text" name="stuName" class="form-control" id="stuName">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label"> 密码</label>
            <div class="col-sm-8">
                <input type="text" name="password" class="form-control" id="password">
            </div>
        </div>
        <div class="form-group">
            <label for="classes" class="col-sm-2 control-label"> 班级</label>
            <div class="col-sm-8">
                <input type="text" name="classes" class="form-control" id="classes">
            </div>
        </div>
        <div class="form-group">
            <label for="boy" class="col-sm-2 control-label"> 性别</label>
            <div class="col-sm-8">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="boy" value="0"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="girl" value="1"> 女
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="submit" class="btn btn-primary btn-lg" onclick="updateStudentById()"> 修改个人信息</button>
            </div>
        </div>
    </form>
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/layer/layer.js"></script>
<script>
    /* 页面初始化 */
    $(function () {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/api/student/selectStudentById/" + ${user.id},
            success: function (result) {
                var data = result.data;
                $("#id").val(data.id);
                $("#stuName").val(data.stuName);
                $("#password").val(data.password);
                $("#classes").val(data.classes);

                if (data.gender == 0)
                    $("#boy").attr("checked", true);
                else
                    $("#girl").attr("checked", true);
            }
        })
    })

    /* 修改用户信息 */
    function updateStudentById() {
        var data = {
            id: $("#id").val(),
            stuName: $("#stuName").val(),
            password: $("#password").val(),
            classes: $("#classes").val(),
            gender: $(":checked[name='gender']").val()
        };

        layer.confirm('是否确定修改信息？：', {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "PUT",
                url: "${APP_PATH}/api/student/updateStudent",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                    layer.msg('修改用户信息成功', {icon: 1});
                    if (result.data === 200)
                        window.location.href = "${APP_PATH}/main/me"
                }
            })
        });
    }
</script>
</body>
</html>