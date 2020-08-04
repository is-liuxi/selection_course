<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title> 教师管理首页</title>
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
                <a class="navbar-brand" style="background-color: #ff9933; border-radius: 3px; color: white;"
                   href="${APP_PATH}/main/teacher"> 课程管理</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/addCourse"> 添加课程</a>
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

    <%-- 课程展示 --%>
    <table class="table table-hover">
        <thead>
        <th>课程编号</th>
        <th>课程名称</th>
        <th>课程学分</th>
        <th>课程学时</th>
        <th>上课教室</th>
        <th>上课老师</th>
        <th> 操作</th>
        </thead>
        <tbody id="tContent">

        </tbody>
    </table>

    <%-- 模态框：修改课程信息 --%>
    <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title"> 选择的课程信息 </h3>
                </div>
                <%-- 模态框显示的内容 --%>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <input type="hidden" name="teaNo" class="form-control" id="teaNo">
                        <div class="form-group">
                            <label for="cNo" class="col-sm-2 control-label"> 课程编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="cNo" class="form-control" id="cNo" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cName" class="col-sm-2 control-label"> 课程名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="cName" class="form-control" id="cName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="credit" class="col-sm-2 control-label"> 课程学分</label>
                            <div class="col-sm-10">
                                <input type="number" name="credit" class="form-control" id="credit">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cHour" class="col-sm-2 control-label"> 课程学时</label>
                            <div class="col-sm-10">
                                <input type="number" name="cHour" class="form-control" id="cHour">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label"> 上课教室</label>
                            <div class="col-sm-10">
                                <input type="text" name="address" class="form-control" id="address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teaName" class="col-sm-2 control-label"> 上课老师</label>
                            <div class="col-sm-10">
                                <input type="text" name="teaName" class="form-control" id="teaName">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> 关闭</button>
                    <button type="button" class="btn btn-primary" onclick="updateCourseById()"> 确定修改</button>
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
            url: "${APP_PATH}/api/course/list/",
            success: function (result) {
                var data = result.data;

                var content = '';
                $.each(data, function (index, item) {
                    content += '<tr>';
                    content += '<td>' + item.cno + '</td>';
                    content += '<td>' + item.cname + '</td>'
                    content += '<td>' + item.credit + '</td>';
                    content += '<td>' + item.chour + '</td>';
                    content += '<td>' + item.address + '</td>';
                    content += '<td>' + item.teacher.teaName + '</td>';
                    content += '<td><a href="javascript:void(0)" class="btn btn-primary active" data-toggle="modal" data-target="#myModal" role="button" onclick="selectCourseById(' + item.cno + ')"> 修改 </a> ' +
                        ' <a href="javascript:void(0)" class="btn btn-danger active" role="button" onclick="deleteCourseById(' + item.cno + ')"> 删除 </a></td>';
                    content += '</tr>';
                });

                $("#tContent").append(content);
            }
        });
    });

    /* 模态框 */
    $('myModal').modal({});

    /* 查询数据展示到模态框中 */
    function selectCourseById(cNo) {
        $.ajax({
            type: "get",
            url: "${APP_PATH}/api/course/selectCourseById/" + cNo,
            success: function (result) {
                console.log(result)
                var data = result.data;
                $("#cNo").val(data.cno);
                $("#cName").val(data.cname);
                $("#credit").val(data.credit);
                $("#cHour").val(data.chour);
                $("#address").val(data.address);
                $("#teaName").val(data.teacher.teaName);
                $("#teaNo").val(data.teacher.id);
            }
        })
    }

    /* 修改课程 */
    function updateCourseById() {
        var cno = $("#cNo").val();
        var cname = $("#cName").val();
        var credit = $("#credit").val();
        var chour = $("#cHour").val();
        var address = $("#address").val();
        var teaName = $("#teaName").val();

        var data = {
            cno: cno,
            cname: cname,
            credit: credit,
            chour: chour,
            address: address,
            teacher: {
                teaName: teaName
            }
        };

        $.ajax({
            type: "PUT",
            url: "${APP_PATH}/api/course/updateCourseById",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.data === 200)
                    window.location.href = "${APP_PATH}/main/teacher"
            }
        })

    }

    /* 删除课程 */
    function deleteCourseById(cNo) {
        layer.confirm('是否删除课程：' + cNo, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "delete",
                url: "${APP_PATH}/api/course/deleteCourseById/" + cNo,
                success: function (result) {
                    if (result.data === 200) {

                        window.location.href = "${APP_PATH}/main/teacher";

                        layer.msg('删除课程成功', {icon: 1});
                    }
                }
            })
        });
    }

</script>
</body>
</html>