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
                <a class="navbar-brand" href="${APP_PATH}/main/myCourse"
                   style="background-color: #ff9933; border-radius: 3px; color: white;">我的课表</a>
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
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/layer/layer.js"></script>
<script>
    /* 页面内容初始化 */
    $(function () {
        $.ajax({
            type: "get",
            url: "${APP_PATH}/api/course/selectionMyCourse/" + ${user.id},
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
                    content += '<td><a href="javascript:void(0)" class="btn btn-primary active" role="button" onclick="deleteMyCourseById(' + item.cno + ')"> 退选 </a></td>';
                    content += '</tr>';
                });

                $("#tContent").append(content);
            }
        });
    });

    /* 已选课程退选 */
    function deleteMyCourseById(cNo) {
        layer.confirm('是否退出已选课程：' + cNo, {
            //按钮
            btn: ['取消', '确定']
        }, function () {
            layer.msg('已取消...', {icon: 6, time: 1000});
        }, function () {
            $.ajax({
                type: "delete",
                url: "${APP_PATH}/api/course/deleteMyCourseById/" + cNo + "/" + ${user.id},
                success: function (result) {
                    if (result.data === 200) {
                        layer.msg('退选课程成功', {icon: 1});

                        window.location.href = "${APP_PATH}/main/myCourse"
                    }
                }
            })
        });
    }
</script>
</body>
</html>