<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title> 教师信息管理</title>
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
                   style="background-color: #ff9933; border-radius: 3px; color: white;"> 信息管理 <span
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

    <%-- 所有教师展示 --%>
    <table class="table table-hover">
        <thead>
        <th> 教师编号</th>
        <th> 姓名</th>
        <th> 密码</th>
        <th> 操作</th>
        </thead>
        <tbody id="tContent">

        </tbody>
    </table>

    <%-- 模态框：修改教师信息 --%>
    <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title"> 修改教师的信息 </h3>
                </div>
                <%-- 模态框显示的内容 --%>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <input type="hidden" name="teaNo" class="form-control" id="teaNo">
                        <div class="form-group">
                            <label for="id" class="col-sm-2 control-label"> 教师编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="id" class="form-control" id="id" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teaName" class="col-sm-2 control-label"> 教师姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="teaName" class="form-control" id="teaName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label"> 教师密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="password" class="form-control" id="password">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> 关闭</button>
                    <button type="button" class="btn btn-primary" onclick="updateTeacherById()"> 确定修改</button>
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
            url: "${APP_PATH}/api/teacher/list/",
            success: function (result) {
                var data = result.data;

                var content = '';
                $.each(data, function (index, item) {
                    content += '<tr>';
                    content += '<td>' + item.id + '</td>';
                    content += '<td>' + item.teaName + '</td>'
                    content += '<td>' + item.password + '</td>';
                    content += '<td><a href="javascript:void(0)" class="btn btn-primary active" data-toggle="modal" data-target="#myModal" role="button" onclick="selectTeacherById(' + item.id + ')"> 修改 </a> ' +
                        ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteTeacherById(' + item.id + ')"> 删除 </a></td>';
                    content += '</tr>';
                });

                $("#tContent").append(content);
            }
        });
    });

    /* 模态框 */
    $('myModal').modal({});

    /* 修改按钮，查询数据，模态框显示 */
    function selectTeacherById(tNo) {
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/api/teacher/selectTeacherById/" + tNo,
            success: function (result) {
                var data = result.data;

                $("#id").val(data.id);
                $("#password").val(data.password);
                $("#teaName").val(data.teaName);
            }
        })
    }

    /* 修改数据 */
    function updateTeacherById() {
        var id = $("#id").val();
        var password = $("#password").val();
        var teaName = $("#teaName").val();

        var data = {
            id: id,
            teaName: teaName,
            password: password
        };
        $.ajax({
            type: "PUT",
            url: "${APP_PATH}/api/teacher/updateTeacherById",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.data === 200)
                    window.location.href = "${APP_PATH}/main/teacherManager";
            }
        })
    }

    /* 删除按钮 */
    function deleteTeacherById(tNo) {
        layer.confirm('是否删除教师：' + tNo, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "delete",
                url: "${APP_PATH}/api/teacher/deleteTeacherById/" + tNo,
                success: function (result) {
                    if (result.data === 200) {
                        window.location.href = "${APP_PATH}/main/teacherManager";

                        layer.msg('删除课程成功', {icon: 1});
                    }
                }
            })
        });
    }
</script>
</body>
</html>