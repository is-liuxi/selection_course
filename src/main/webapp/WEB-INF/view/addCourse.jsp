<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>添加课程</title>
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
            text-align: center;
        }

        th {
            text-align: center;
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
                <a class="navbar-brand" href="${APP_PATH}/main/addCourse"
                   style="background-color: #ff9933; border-radius: 3px; color: white;"> 添加课程</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/addUser"> 添加用户</a>
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

    <form class="form-horizontal">
        <input type="hidden" name="teaNo" class="form-control" id="teaNo">
        <div class="form-group">
            <label for="cNo" class="col-sm-2 control-label"> 课程编号</label>
            <div class="col-sm-8">
                <input type="number" name="cNo" class="form-control" id="cNo">
            </div>
        </div>
        <div class="form-group">
            <label for="cName" class="col-sm-2 control-label"> 课程名称</label>
            <div class="col-sm-8">
                <input type="text" name="cName" class="form-control" id="cName">
            </div>
        </div>
        <div class="form-group">
            <label for="credit" class="col-sm-2 control-label"> 课程学分</label>
            <div class="col-sm-8">
                <input type="number" name="credit" class="form-control" id="credit">
            </div>
        </div>
        <div class="form-group">
            <label for="cHour" class="col-sm-2 control-label"> 课程学时</label>
            <div class="col-sm-8">
                <input type="number" name="cHour" class="form-control" id="cHour">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label"> 上课教室</label>
            <div class="col-sm-8">
                <input type="text" name="address" class="form-control" id="address">
            </div>
        </div>
        <div class="form-group">
            <label for="teaName" class="col-sm-2 control-label"> 上课老师</label>
            <div class="col-sm-8">
                <select id="teaName" class="form-control">
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-3">
                <button type="button" class="btn btn-primary btn-lg" onclick="addCourse()"> 添加</button>
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
    /* 查询出全部的教师，初始化下拉列表 */
    $(function () {
        $.ajax({
            type: "get",
            url: "${APP_PATH}/api/teacher/list",
            success: function (result) {
                var data = result.data;

                var content = "";
                $.each(data, function (index, item) {
                    content += '<option value="' + item.id + '">' + item.teaName + '</option>'
                });

                $("#teaName").append(content);
            }
        });
    });

    function addCourse() {
        var cno = $("#cNo").val();
        var cname = $("#cName").val();
        var credit = $("#credit").val();
        var chour = $("#cHour").val();
        var address = $("#address").val();
        var teaNo = $("#teaName").val();

        if (cno.length <= 0 || cname.length <= 0 || credit.length <= 0 || chour.length <= 0 || address.length <= 0 || teaNo.length <= 0) {
            layer.msg('添加的课程信息不能为空！！！', {time: 1000, icon: 5, shift: 1}, null);
            return;
        }

        var data = {
            cno: cno,
            cname: cname,
            credit: credit,
            chour: chour,
            address: address,
            teaNo: teaNo
        };

        $.ajax({
            type: "POST",
            url: "${APP_PATH}/api/course/addCourse",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                console.log(result)

                if (result.data === 500)
                    layer.msg('添加的课程 ID已存在！！！', {time: 1000, icon: 5, shift: 6}, null);

                if (result.data === 200)
                    layer.msg("添加课程成功", {time: 1000, icon: 1})
            }
        })
    }
</script>
</body>
</html>