<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title> 学生信息管理</title>
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

        .table {
            margin-top: 20px;
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
                <a class="navbar-brand" href="${APP_PATH}/main/addCourse"> 添加课程</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/addUser"> 添加用户</a>
            </div>
            <div class="navbar-header dropdown">
                <a class="navbar-brand" href="javascript:void(0)" data-toggle="dropdown"
                   style="background-color: #ff9933; border-radius: 3px; color: white;"> 信息管理 <span class="caret"></span>
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

    <%-- 所有学生展示 --%>
    <table class="table table-hover">
        <thead>
        <th> 学号</th>
        <th> 姓名</th>
        <th> 密码</th>
        <th> 班级</th>
        <th> 性别</th>
        <th> 操作</th>
        </thead>
        <tbody id="tContent">

        </tbody>
    </table>

        <%-- 模态框：修改学生信息 --%>
        <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title"> 修改学生的信息 </h3>
                    </div>
                    <%-- 模态框显示的内容 --%>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <input type="hidden" name="teaNo" class="form-control" id="teaNo">
                            <div class="form-group">
                                <label for="id" class="col-sm-2 control-label"> 学号</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="stuName" class="col-sm-2 control-label"> 学生姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stuName" class="form-control" id="stuName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label"> 学生密码</label>
                                <div class="col-sm-10">
                                    <input type="text" name="password" class="form-control" id="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="classes" class="col-sm-2 control-label"> 班级</label>
                                <div class="col-sm-10">
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
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"> 关闭</button>
                        <button type="button" class="btn btn-primary" onclick="updateStudentById()"> 确定修改</button>
                    </div>
                </div>
            </div>
        </div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/js/layer/layer.js"></script>
<script>
    /* 页面内容初始化 */
    $(function () {
        $.ajax({
            type: "get",
            url: "${APP_PATH}/api/student/list/",
            success: function (result) {
                var data = result.data;

                var content = '';
                $.each(data, function (index, item) {
                    content += '<tr>';
                    content += '<td>' + item.id + '</td>';
                    content += '<td>' + item.stuName + '</td>'
                    content += '<td>' + item.password + '</td>';
                    content += '<td>' + item.classes + '</td>';
                    content += '<td>' + (item.gender===0?"男":"女") + '</td>';
                    content += '<td><a href="javascript:void(0)" class="btn btn-primary active" data-toggle="modal" data-target="#myModal" role="button" onclick="selectStudentById(' + item.id + ')"> 修改 </a> ' +
                        ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteStudentById(' + item.id + ')"> 删除 </a></td>';
                    content += '</tr>';
                });

                $("#tContent").append(content);
            }
        });
    });

    /* 模态框 */
    $('myModal').modal({});

    /* 修改按钮，查询数据，模态框显示 */
    function selectStudentById(sNo) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/api/student/selectStudentById/" + sNo,
            success: function (result) {
                var data = result.data;

                $("#id").val(data.id);
                $("#password").val(data.password);
                $("#stuName").val(data.stuName);
                $("#classes").val(data.classes);

                if (data.gender == 0)
                    $("#boy").attr("checked", true);
                else
                    $("#girl").attr("checked", true);
            }
        })
    }

    /* 修改数据 */
    function updateStudentById() {
        var id = $("#id").val();
        var password = $("#password").val();
        var stuName = $("#stuName").val();
        var classes = $("#classes").val();
        var gender = $(":checked[name='gender']").val();

        var data = {
            id: id,
            stuName: stuName,
            password: password,
            classes: classes,
            gender: gender
        };

        $.ajax({
            type: "PUT",
            url: "${APP_PATH}/api/student/updateStudent",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.data === 200)
                    window.location.href = "${APP_PATH}/main/studentManager";
            }
        })
    }

    /* 删除按钮 */
    function deleteStudentById(sNo) {
        layer.confirm('是否删除学生：' + sNo, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "delete",
                url: "${APP_PATH}/api/student/deleteStudentById/" + sNo,
                success: function (result) {
                    if (result.data === 200) {
                        window.location.href = "${APP_PATH}/main/studentManager";

                        layer.msg('删除学生成功', {icon: 1});
                    }
                }
            })
        });
    }
</script>
</body>
</html>