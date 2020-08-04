<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title> 添加学生</title>
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
                <a class="navbar-brand" href="${APP_PATH}/main/teacher"> 课程管理</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/addCourse"> 添加课程</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/addUser"
                   style="background-color: #ff9933; border-radius: 3px; color: white;"> 添加用户</a>
            </div>
            <div class="navbar-header dropdown">
                <a class="navbar-brand" href="javascript:void(0)" data-toggle="dropdown"> 信息管理 <span
                        class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${APP_PATH}/main/studentManager"> 学生信息管理</a></li>
                    <li><a href="${APP_PATH}/main/teacherManager"> 教师信息管理</a></li>
                </ul>
            </div>
            <div class="navbar-header  navbar-right">
                <a class="navbar-brand" href="${APP_PATH}/main/logout"> 退出登录 </a>
            </div>
        </div>
    </nav>

    <%-- 添加用户 --%>
    <form class="form-horizontal">
        <input type="hidden" name="teaNo" class="form-control" id="teaNo">
        <div class="form-group">
            <label for="cNo" class="col-sm-2 control-label"> 用户 ID</label>
            <div class="col-sm-8">
                <input type="number" name="cNo" class="form-control" id="cNo">
            </div>
        </div>
        <div class="form-group">
            <label for="cName" class="col-sm-2 control-label"> 用户姓名</label>
            <div class="col-sm-8">
                <input type="text" name="cName" class="form-control" id="cName">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label"> 用户密码</label>
            <div class="col-sm-8">
                <input type="text" name="password" class="form-control" id="password" value="888888">
            </div>
        </div>
        <div class="form-group">
            <label for="student" class="col-sm-2 control-label"> 用户角色</label>
            <div class="col-sm-8">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="type" id="student" value="student" checked> 学生
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="type" id="teacher" value="teacher"> 教师
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group" style="padding-top: 20px">
            <div class="col-sm-offset-3 col-sm-3">
                <button type="button" class="btn btn-primary btn-lg" onclick="addUser()"> 添加</button>
            </div>
            <div class="col-sm-2">
                <button type="reset" class="btn btn-warning btn-lg"> 清空</button>
            </div>
        </div>
    </form>
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/js/layer/layer.js"></script>
<script>
    function addUser() {
        var type = $(":checked[name='type']").val();

        var no = $("#cNo").val();
        var name = $("#cName").val();
        var password = $("#password").val();

        if (no.length <= 0 || name.length <= 0 || password.length <= 0) {
            layer.msg('添加的用户信息不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        // 添加学生
        if (type === "student") {
            $.ajax({
                type: "POST",
                url: "${APP_PATH}/api/student/addStudent",
                contentType: "application/json",
                data: JSON.stringify({
                    id: no,
                    stuName: name,
                    password: password
                }),
                success: function (result) {
                    var flag = result.data;

                    if (flag === 500)
                        layer.msg('用户 ID已存在！！！', {time: 1000, icon: 5, shift: 6}, null);

                    if (flag === 200)
                        layer.msg("添加用户成功", {time: 1000, icon: 1})
                }
            })
        }

        // 添加教师
        if (type === "teacher") {
            $.ajax({
                type: "POST",
                url: "${APP_PATH}/api/teacher/addTeacher",
                contentType: "application/json",
                data: JSON.stringify({
                    id: no,
                    teaName: name,
                    password: password
                }),
                success: function (result) {
                    console.log(result);

                    var flag = result.data;
                    if (flag === 500)
                        layer.msg('用户 ID已存在！！！', {time: 1000, icon: 5, shift: 6}, null);

                    if (flag === 200)
                        layer.msg("添加用户成功", {time: 1000, icon: 1})
                }
            })
        }
    }
</script>
</body>
</html>