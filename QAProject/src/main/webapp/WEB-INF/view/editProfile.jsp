<%--
  Created by IntelliJ IDEA.
  User: Minh
  Date: 5/26/2015
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Ask me – Responsive Questions and Answers Template</title>
    <meta name="description" content="Ask me Responsive Questions and Answers Template">
    <meta name="author" content="2code.info">



    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Main Style -->
    <link rel="stylesheet" href="/resource/assets/css/style.css">

    <!-- Skins -->
    <link rel="stylesheet" href="/resource/assets/css/skins/skins.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" href="/resource/assets/css/responsive.css">

    <!-- Boostrap Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap.min.css">

    <!-- Boostrap Theme Style -->
    <link rel="stylesheet" href="/resource/assets/css/bootstrap-theme.min.css">

    <!-- Notification Style -->
    <link rel="stylesheet" href="/resource/assets/css/notification.css">

    <!-- Favicons -->
    <link rel="shortcut icon" href="http://2code.info/demo/html/ask-me/images/favicon.ico">
    <!-- Toast message Style -->
    <link rel="stylesheet" href="/resource/assets/css/jquery.toastmessage.css">

</head>

<body>

<div class="loader"><div class="loader_html"></div></div>

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


<header id="header">
    <section class="container clearfix">
        <div class="logo"><a href="/newsfeed"><img alt="" src="/resource/assets/images/logo.png"></a></div>
        <nav class="">
            <ul class="nav nav-pills notification" >
                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color : white;"><i class="icon-globe" style="font-size: 22px;"></i><span style="color: #ff7361" id="countNotifi">15</span></a>
                    <!--UPDATE ICON-->
                    <ul class="dropdown-menu" style="min-width : 414px;">
                        <li class="notification-li"><div class="notification-all"><div style="margin-left: 10px;"><a class="notification-user">Notification</a></div></div></li>
                        <ul class="scrollable-menu" style="min-width : 414px;">
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class Create a new post in ABC Class <a class="notification-link" style="display : inline-block;">user</a></div></div></div></li>
                            <li class="notification-li"><div class="notification-all"><div style="min-width: 40px;"><img src="http://2code.info/demo/html/ask-me/images/demo/avatar.png" class="mail-avatar"></div><div style="margin-left: 10px;"><a href="#" class="notification-user">Khang</a><div class="notification-action" style="width: 300px;word-wrap: break-word; white-space: normal;"> Want To join <a class="notification-link" style="display : inline-block;">ABC Class</a></div><div></div><a href="#" class="button small blue-button" style="">Approve</a><a href="#" class="button small red-button" style="">Reject</a></div></div></li>
                            <div class="notification-all"><div style="margin-left: 10px;"><a href="#" class="notification-user">See All</a></div></div>
                        </ul>
                    </ul>

                </li>

            </ul>
        </nav>
        <nav class="navigation">
            <ul>
                <li><a href="/newsfeed">News feed</a></li>
                <li><a href="/studentdashboard">Dashboard</a></li>
                <li class="current_page_item"><a href="/profile">Your profile</a></li>
                <li><a href="contact_us.html">About Us</a></li>
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->

<%@include file="header.jsp" %>

<section class="container main-content page-left-sidebar">
<div class="row">
<div class="col-md-9">
    <div class="row">
        <div class="user-profile">
            <div class="col-md-12">
                <div class="page-content">
                    <h2>Edit profile</h2>
                    <div class="form-style form-style-3">
                        <form>
                            <div class="form-inputs clearfix">
                                <p>
                                    <div class="form-group">
                                        <label class="col-md-3">Display Name</label>
                                        <div class="col-md-9">
                                            <input type="text" style="width: 100% !important;" value="${user.displayName}" id="display-name">
                                        </div>
                                    </div>
                                </p>
                                <p>

                                        <div class="form-group">
                                            <label class="col-md-3">Know About<span>*</span></label>
                                            <div class="col-md-9">
                                                <select class="form-control" style="width: 100%;" id="cate">
                                                    <option value="">Select a type</option>
                                                    <c:forEach var="category" items="${categories}">
                                                        <%--<c:if test="user.categoryId == category.id">--%>
                                                            <%--<option value="${category.id}">${category.categoryName}</option>--%>
                                                        <%--</c:if>--%>
                                                        <option value="${category.id}" ${user.categoryId.id == category.id ? 'selected="selected"' : ''}>${category.categoryName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                    </div>
                                </p>
                            </div>
                            <div class="form-style form-style-2">
                                <div class="user-profile-img"><img src="${user.profileImageURL}" alt="admin"></div>
                                <p class="user-profile-p">
                                    <label>Profile Picture</label>
                                    <div class="col-md-9" style="  margin-left: 100px;">
                                        <div class="fileinputs" style="width: 100%;">
                                            <input type="file" class="file">
                                            <div class="fakefile">
                                                <button type="button" class="button small margin_0">Select file</button>
                                                <span><i class="icon-arrow-up"></i>Browse</span>
                                            </div>
                                        </div>
                                    </div>
                                <p></p>
                                <div class="clearfix"></div>
                                <p>
                                    <div class="form-group">
                                        <label class="col-md-3">About Yourself</label>
                                        <div class="col-md-9">
                                            <textarea cols="58" rows="8" id="about-me">${user.aboutMe}</textarea>
                                        </div>
                                    </div>
                                </p>
                            </div>
                            <p class="form-submit">
                                <a href="javascript:editProfile();"  class="button color small login-submit submit text-center">Update</a>
                            </p>
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div><!-- End page-content -->
            </div><!-- End col-md-12 -->
        </div><!-- End user-profile -->
    </div><!-- End row -->
    <div class="clearfix"></div>
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    <div class="widget widget_stats">
        <h3 class="widget_title">Stats</h3>
        <div class="ul_list ul_list-icon-ok">
            <ul>
                <li><i class="icon-question-sign"></i>Questions ( <span>20</span> )</li>
                <li><i class="icon-edit"></i>Article ( <span>50</span> )</li>
                <li><i class="icon-group"></i>Class ( <span>7</span> )</li>
            </ul>
        </div>
    </div>

</aside><!-- End sidebar -->
</div><!-- End row -->
</section><!-- End container -->

<%@include file="footer.jsp" %>
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="/resource/assets/js/jquery.min.js"></script>
<script src="/resource/assets/js/bootstrap.min.js"></script>
<script src="/resource/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/resource/assets/js/jquery.easing.1.3.min.js"></script>
<script src="/resource/assets/js/html5.js"></script>
<script src="/resource/assets/js/twitter/jquery.tweet.js"></script>
<script src="/resource/assets/js/jflickrfeed.min.js"></script>
<script src="/resource/assets/js/jquery.inview.min.js"></script>
<script src="/resource/assets/js/jquery.tipsy.js"></script>
<script src="/resource/assets/js/tabs.js"></script>
<script src="/resource/assets/js/jquery.flexslider.js"></script>
<script src="/resource/assets/js/jquery.prettyPhoto.js"></script>
<script src="/resource/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="/resource/assets/js/jquery.scrollTo.js"></script>
<script src="/resource/assets/js/jquery.nav.js"></script>
<script src="/resource/assets/js/tags.js"></script>
<script src="/resource/assets/js/jquery.bxslider.min.js"></script>
<script src="/resource/assets/js/custom.js"></script>
<script src="/resource/assets/js/jquery.toastmessage.js"></script>

<!-- End js -->
<script>
    function editProfile(){
        var url = "/editProfileData/";
        var displayName =$("#display-name").val();
        var cate = $( "#cate option:selected" ).val();
        var aboutMe =$("#about-me").val();
        $.ajax({
            type: "POST",
            url: url,
            data: "displayName="+displayName+"&cate="+cate+"&aboutMe="+aboutMe,
            success: function(data, callback){
                if(data != null && data.length >0){
                    $().toastmessage('showSuccessToast', "Update Successful!");
                }else{
                    $().toastmessage('showErrorToast', "Update fail! Please try again late!");
                }
            }
        });
    }
</script>
</body>
</html>
