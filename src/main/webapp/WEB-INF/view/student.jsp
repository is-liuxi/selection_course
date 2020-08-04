<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>新闻中心</title>
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.min.css">
    <style>
        body {
            padding: 0px;
            margin: 0px;
            background-color: #ccc;
        }

        nav {
            margin-top: 20px;
        }

        .navbar-header:not(:first-child) {
            align-content: center;
            margin-right: 10px;
            padding-left: 20px;
        }

        a img {
            height: 400px;
        }

        p {
            text-indent: 2em;
        }

        a.navbar-brand:first-child{

        }
        .thumbnail{
            height: 706px;
        }
    </style>
</head>
<body>
<div class="container">
    <%-- 导航条 --%>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="background-color: #ff9933; border-radius: 3px; color: white;" href="${APP_PATH}/main/student">新闻中心</a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="${APP_PATH}/main/selectionCourse">选课中心</a>
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

    <%-- 轮播图 --%>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <a href="https://www.hniu.cn/info/1035/4313.htm" title="大专院校新冠肺炎防控技术方案">
                    <img src="${APP_PATH}/static/img/hniu_01.png">
                </a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <a href="https://www.hniu.cn/info/1043/4366.htm">
                    <img src="${APP_PATH}/static/img/hniu_02.png" title="我院2020年单独招生考试工作圆满完成">
                </a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <a href="https://www.hniu.cn/info/1043/4366.htm">
                    <img src="${APP_PATH}/static/img/hniu_03.png" title="毕业生双选会">
                </a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="${APP_PATH}/static/img/hniu_04.png">
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <%-- 新闻看点 --%>
    <div class="row" style="margin-top: 20px;">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <a href="https://www.hniu.cn/info/1043/4479.htm">
                    <img src="${APP_PATH}/static/img/news_01.png" style="height: 262px">
                </a>
                <div class="caption">
                    <h3>中国民主同盟湖南信息职业技术学院支部成立大会顺利召开</h3>
                    <p>
                        7月10日，中国民主同盟湖南信息职业技术学院支部成立大会顺利召开，成立了由史小平任支部主委、邓锐任支部副主委、黄秀亮任组织委员、童俊任宣传委员的民盟湖南信息职业技术学院支部委员会。学院副院长、民盟市委副主委刘志红主持，长沙市政协副主席、民盟市委主委张庆和等市、区领导一行10人、学院党委书记赵兴舟出席，九三学社社员和学院民盟盟员参加。
                    </p>
                    <p>
                        会上，史小平代表民盟湖南信息职业技术学院支部作了表态发言。她表示十分感谢民盟长沙市委和学校党委的细心关怀和大力支持，一定不负众望，加强学习，以身作则，自觉遵守《中国民主同盟章程》，服从上级组织和学校党委领导，组织盟员认真学习政治理论，积极开展组织活动，推动盟员做好本职工作，使各位盟员在各自的工作岗位上发挥更好的作用。
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <a href="https://www.hniu.cn/info/1043/4455.htm">
                    <img src="${APP_PATH}/static/img/news_02.png">
                </a>
                <div class="caption">
                    <h3>师生同台应考 共同提升技能</h3>
                    <p>
                        受“新冠肺炎”疫情影响，线下授课时间被大量压缩，职业技能鉴定考试却如期而至，我院2018级学生在5月返校后，广大师生未雨绸缪，提前备战，7月4日，更是有4位老师和1619名学生一起同台应考，参加了电路图形制作工等7个职业（工种）的技能鉴定考试，这也是学院近年来应考人数最多的一次。
                    </p>
                    <p>
                        “之所以参加这次职业技能鉴定考试，一方面我想提升自身的专业技能水平；另一方面，作为老师不光要能出题，还要能解题，在授课的时候也能从不同的课程角度来教导学生，将所学专业形成一个有机整体，达到更好的教学效果。”参加考试的电子工程学院教师熊英在考后说道。据悉，今年参加考试的四位老师均为85后、90后，“为了响应学院‘双师型’教师队伍建设，我们都会在完成教学工作同时，注重提升自身的技术技能水平。”90后的袁雪琼老师说道。
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <a href="https://www.hniu.cn/info/1043/4469.htm">
                    <img src="${APP_PATH}/static/img/news_03.png">
                </a>
                <div class="caption">
                    <h3>我院内部质量保证体系诊断与改进复核工作推进会顺利召开</h3>
                    <p>
                        为贯彻落实教育部、湖南省教育厅关于职业院校内部质量保证体系诊断与改进工作的有关要求，构建好学院内部质量保证体系，扎实推进质量诊改工作，7月8日上午，学院内部质量保证体系诊断与改进工作推进会顺利召开。副院长余求根主持，党委书记赵兴舟、院长陈剑旄及在院班子成员出席，质量管理处等相关部门负责人参加。
                    </p>
                    <p>
                        会上，质量管理处负责人报告了《湖南信息职业技术学院内部质量保证体系诊断与改进复核工作方案》，就质量诊改复核工作的责任分工和进度安排予以明确。上海尚强信息科技有限公司项目负责人就内部质量保证体系建设的内涵和框架、如何制定质量目标和质量标准、如何建立健全内部质量保证体系等内容进行了解析和指导。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<script>
    $('.carousel').carousel({
        interval: 1500
    })
</script>
</body>
</html>
