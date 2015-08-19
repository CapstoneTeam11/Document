<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 6/30/2015--%>
  <%--Time: 9:07 AM--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

    <%--<!-- Basic Page Needs -->--%>
    <%--<meta charset="utf-8">--%>
    <%--<title>Ask me – Responsive Questions and Answers Template</title>--%>
    <%--<meta name="description" content="Ask me Responsive Questions and Answers Template">--%>
    <%--<meta name="author" content="2code.info">--%>



    <%--<!-- Mobile Specific Metas -->--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>

    <%--<!-- Main Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/style.css">--%>

    <%--<!-- Skins -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/skins/skins.css">--%>

    <%--<!-- Responsive Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/responsive.css">--%>

    <%--<!-- Boostrap Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">--%>

    <%--<!-- Notification Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>

    <%--<!-- Favicons -->--%>
    <%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>
    <%--<!-- Toast message Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">--%>
    <%--<!--TagInput-->--%>
    <%--<link rel="stylesheet" href="/resource/assets/js/bootstrap-tagsinput.css">--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/tag.css">--%>
<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Top student's question topics</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar" style="min-height: 260px">
        <div class="row">
            <div class="col-md-9">
                <div class="clearfix"></div>
                <div class="page-content page-shortcode">
                    <div class="row" style="margin-top: 65px; margin-bottom: 65px">
                        <div id="noResult" style="text-align: center;font-size: 20px; display: none">
                            There is no question in your classrooms.
                        </div>
                        <div id="chartContainer" style="height: 300px; width: 100%;">
                        </div>
                    </div>
                </div><!-- End page-content -->
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
                <div class="widget widget_highest_points">
                    <h3 class="widget_title">Hi, ${sessionScope.user.displayName}</h3>
                    <ul>
                        <li>
                            <div class="author-img">
                                <a href="/profile/view/${sessionScope.user.id}"><img width="60" height="60"
                                                                                     src="${sessionScope.user.profileImageURL}" alt=""></a>
                            </div>
                            <h6><a href="/profile/update">Edit profile</a></h6>
                        </li>
                    </ul>
                </div>

            </aside><!-- End sidebar -->
        </div><!-- End row -->
    </section><!-- End container -->

    <%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<script src="/resource/assets/js/jquery.canvasjs.min.js"></script>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>

<!-- End js -->
<script type="text/javascript">
    window.onload = function () {
        var dps = [];
        $.ajax({
            type: "POST",
            url: "/tracking/load",
            success: function(data){
                var tags = data;
                if (tags.length <= 0) {
                    $("#chartContainer").hide();
                    $("#noResult").show();
                } else {
                    for (var i=0; i<tags.length;i++){
                        var dp = {y: tags[i].count, label: tags[i].name};
                        dps.push(dp);
                    }
                    var chart = new CanvasJS.Chart("chartContainer",
                            {
                                animationEnabled: true,
                                animationDuration: 2000,
                                axisY:{
                                    title: "Number of topic"
                                },
                                title:{
                                    text: "Top students' question topics"
                                },
                                data: [
                                    {
                                        type: "bar",
                                        dataPoints: dps
                                    }
                                ]
                            });
                    chart.render();
                    $(".canvasjs-chart-credit").hide();
                }
            }
        });

    }
</script>
</body>
</html>
