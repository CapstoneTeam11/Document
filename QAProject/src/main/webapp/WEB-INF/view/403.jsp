<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: Minh--%>
<%--Date: 6/19/2015--%>
<%--Time: 3:27 PM--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
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

<%--<!-- Boostrap Theme Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">--%>

<%--<!-- Notification Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>

<%--<!-- Left Notification style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/jquery.growl.css"/>--%>

<%--<!-- Favicons -->--%>
<%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>
<%--<!-- Toast message Style -->--%>
<%--<link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">--%>

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
                    <h3>Error</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content">
        <div class="row">
            <div class="col-md-12">
                <div class="error_404">
                    <div>
                        <h2>403</h2>
                        <h3>Not have permission</h3>
                        <h4>${error}</h4>
                    </div>
                    <div class="clearfix"></div><br>
                    <c:if test="${not empty sessionScope.user && sessionScope.user.roleId.id!=3}">
                        <a href="/newsfeed" class="button large color margin_0">Return to News Feed</a>
                    </c:if>
                </div>
            </div><!-- End main -->
        </div><!-- End row -->
    </section><!-- End container -->

    <%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<%@include file="js.jsp" %>
<c:if test="${sessionScope.user!=null}">
    <script src="/resource/assets/js/notification.js"></script>
</c:if>
<!-- End js -->
</body>
</html>
