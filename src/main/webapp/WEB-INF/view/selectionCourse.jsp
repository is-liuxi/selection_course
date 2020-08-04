<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>选课中心</title>
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
            margin-top: 40px;
            align-content: center;
        }

        td {
            height: 50px;
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
                <a class="navbar-brand" style="background-color: #ff9933; border-radius: 3px; color: white;"
                   href="${APP_PATH}/main/selectionCourse">选课中心</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/myCourse">我的课表</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/me">个人中心</a>
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

    <%-- 模态框 --%>
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
                        <input type="hidden" name="teaNo" class="form-control" id="teaNo" readonly>
                        <div class="form-group">
                            <label for="cNo" class="col-sm-2 control-label"> 课程编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="cNo" class="form-control" id="cNo" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cName" class="col-sm-2 control-label"> 课程名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="cName" class="form-control" id="cName" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="credit" class="col-sm-2 control-label"> 课程学分</label>
                            <div class="col-sm-10">
                                <input type="text" name="credit" class="form-control" id="credit" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cHour" class="col-sm-2 control-label"> 课程学时</label>
                            <div class="col-sm-10">
                                <input type="text" name="cHour" class="form-control" id="cHour" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label"> 上课教室</label>
                            <div class="col-sm-10">
                                <input type="text" name="address" class="form-control" id="address" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="teaName" class="col-sm-2 control-label"> 上课老师</label>
                            <div class="col-sm-10">
                                <input type="text" name="teaName" class="form-control" id="teaName" readonly>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> 关闭</button>
                    <button type="button" class="btn btn-primary" onclick="save()"> 确认选择</button>
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
            url: "${APP_PATH}/api/course/selectionCourse/" + ${user.id},
            success: function (result) {
                var data = result.data;

                var content = '';
                $.each(data, function (index, item) {
                    content += '<tr>';
                    content += '<td>' + item.cno + '</td>';
                    content += '<td>' + item.cname + '</t;d>'
                    content += '<td>' + item.credit + '</td>';
                    content += '<td>' + item.chour + '</td>';
                    content += '<td>' + item.address + '</td>';
                    content += '<td>' + item.teacher.teaName + '</td>';
                    content += '<td><a href="" class="btn btn-primary active" data-toggle="modal" data-target="#myModal" role="button" onclick="selectCourseById(' + item.cno + ')"> 选择 </a></td>';
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

    /* 选择课程 */
    function save() {
        var data = {
            couNo: $("#cNo").val(),
            stuNo: "${user.id}",
            teaNo: $("#teaNo").val()
        };
        $.ajax({
            type: "post",
            url: "${APP_PATH}/api/StuCTea/save",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (result) {
                console.log(result);
                if (result.data === 200) {
                    layer.msg("添加课程成功", {time: 500, icon: 1, shift: 6}, null);
                    /* 选完课程后又回到当前页面 */
                    window.location.href = "${APP_PATH}/main/selectionCourse";
                }
            }
        });

    }
</script>
</body>
</html>