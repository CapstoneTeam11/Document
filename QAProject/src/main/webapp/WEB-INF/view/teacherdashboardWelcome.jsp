<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Minh--%>
  <%--Date: 6/9/2015--%>
  <%--Time: 3:37 PM--%>
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

    <%--<!-- Boostrap Theme Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">--%>

    <%--<!-- Notification Style -->--%>
    <%--<link rel="stylesheet" href="/resource/assets/css/notification.css">--%>

    <%--<!-- Favicons -->--%>
    <%--<link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">--%>

<%--</head>--%>

<%--<body>--%>

<%--<div class="loader"><div class="loader_html"></div></div>--%>
<%@include file="css.jsp" %>
<div id="wrap">

    <div class="panel-pop" id="signup">
        <h2>Register Now<i class="icon-remove"></i></h2>
        <div class="form-style form-style-3">
            <form>
                <div class="form-inputs clearfix">
                    <p>
                        <label class="required">Username<span>*</span></label>
                        <input type="text">
                    </p>
                    <p>
                        <label class="required">E-Mail<span>*</span></label>
                        <input type="email">
                    </p>
                    <p>
                        <label class="required">Password<span>*</span></label>
                        <input type="password" value="">
                    </p>
                    <p>
                        <label class="required">Confirm Password<span>*</span></label>
                        <input type="password" value="">
                    </p>
                </div>
                <p class="form-submit">
                    <input type="submit" value="Signup" class="button color small submit">
                </p>
            </form>
        </div>
    </div><!-- End signup -->

    <div class="panel-pop" id="lost-password">
        <h2>Lost Password<i class="icon-remove"></i></h2>
        <div class="form-style form-style-3">
            <p>Lost your password? Please enter your username and email address. You will receive a link to create a new password via email.</p>
            <form>
                <div class="form-inputs clearfix">
                    <p>
                        <label class="required">Username<span>*</span></label>
                        <input type="text">
                    </p>
                    <p>
                        <label class="required">E-Mail<span>*</span></label>
                        <input type="email">
                    </p>
                </div>
                <p class="form-submit">
                    <input type="submit" value="Reset" class="button color small submit">
                </p>
            </form>
            <div class="clearfix"></div>
        </div>
    </div><!-- End lost-password -->


    <%@include file="header.jsp" %>

    <div class="breadcrumbs" style="margin-top: 86px">
        <section class="container" style="height:70px; display: flex; align-items: center">
            <div class="row">
                <div class="col-md-12">
                    <h3>Dashboard</h3>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </div><!-- End breadcrumbs -->

    <section class="container main-content page-left-sidebar">
        <div class="row">
            <div class="col-md-9">
                <div class="clearfix"></div>
                <div class="page-content page-shortcode">
                    <div class="row" style="margin-top: 65px; margin-bottom: 65px">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <a href="/createClass">
                                <div class="page-content page-shortcode">
                                    <div class="box_icon">
                                        <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#1abc9c" span_hover="#34495e" style="height: 50px; width: 50px; font-size: 25px; line-height: 50px; background-color: rgb(52, 73, 94);"><i class="icon-group"></i></span></span>
                                        <div class="t_center">
                                            <h3>Create your first class</h3>
                                            <p>Hi, ${sessionScope.user.displayName}! You haven't had any classroom yet. Create your first class to discuss now. </p>
                                        </div>
                                    </div>
                                </div>
                            </a>
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
                <div class="widget widget_tag_cloud">
                    <h3 class="widget_title">
                        Your Tags
                        <c:if test="${empty sessionScope.user.tagUserList}">
                            <a href="/profile/update#yourtag" style="float: right;">Edit tag</a>
                        </c:if>
                    </h3>
                    <c:if test="${not empty sessionScope.user.tagUserList}">
                        <c:forEach var="tag" items="${sessionScope.user.tagUserList}">
                            <a href="#">${tag.tagId.tagName}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty sessionScope.user.tagUserList}">
                        Provide your favourite tags now to get more interest news.
                    </c:if>
                </div>

            </aside><!-- End sidebar -->
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
